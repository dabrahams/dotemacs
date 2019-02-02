;; Support initial tabs in Python backtraces, as produced by Buildbot.
(require 'cl-macs)
(require 'compile)
(let* ((clause (assoc 'caml compilation-error-regexp-alist-alist))
       (pat (cadr clause)))
  (when (and clause (string= (substring pat 0 2) "^ "))
    (setcdr clause
            (cons
             (concat "^\\s-" (substring pat 2))
             (cddr clause)))))

(add-hook 'compilation-mode-hook
          (lambda () (make-local-variable 'hl-line-sticky-flag)
            (setq hl-line-sticky-flag t)
            (hl-line-mode t)
            (make-local-variable 'auto-hscroll-mode)
            (setq auto-hscroll-mode nil)
            (toggle-truncate-lines -1)
            ))

; disable wrapping and hscrolling
;(add-hook 'compilation-mode-hook
;          (lambda ()
;            (make-local-variable
;             (quote hl-line-sticky-flag))
;            (setq hl-line-sticky-flag t)
;            (hl-line-mode t)))
          
(add-hook 'next-error-hook
          (lambda () 
            (with-current-buffer next-error-last-buffer
              (make-local-variable 'hl-line-sticky-flag)
              (setq hl-line-sticky-flag t)
              (hl-line-mode nil)
              (hl-line-mode t))))

(defun cmake-project-filename ()
  (let ((filename (match-string-no-properties 2)))
    (if (file-name-absolute-p filename) filename
      (save-match-data
        (with-temp-buffer
          (insert-file-contents-literally "cmake_install.cmake")
          (goto-char (point-min))
          (re-search-forward "Install script for directory: \\(.+\\)")
          (cons filename (match-string-no-properties 1))))
      )
    ))


;;
;; Parse xcpretty output; from https://github.com/threeve/emacs.d
;;
(add-to-list 'compilation-error-regexp-alist 'xcpretty-error)
(add-to-list 'compilation-error-regexp-alist 'xcpretty-warning)
(add-to-list 'compilation-error-regexp-alist-alist
             '(xcpretty-error
               "^\\(?:\\(?:\u274c\\|\\[x\\]\\)\\)\\s-+\\([^:]+?\\):\\([0-9]+\\):\\([0-9]+\\): .*"
               2 3 4 nil 2))
(add-to-list 'compilation-error-regexp-alist-alist
             '(xcpretty-warning
               "^\\(?:\\(\u26a0\ufe0f\\|\\[!\\]\\)\\)\\s-+\\([^:]+?\\):\\([0-9]+\\):\\([0-9]+\\): .*"
               2 3 4 1 2))

(push 'cmake compilation-error-regexp-alist)
(push '(cmake "^\\(?:CMake \\(?:Error\\|Warnin\\(g\\)\\) at \\|  \\)\\(.+?\\):\\([0-9]+\\) ([A-Za-z_][A-Za-z0-9_]*)"
              (cmake-project-filename) 3 nil (1))
      compilation-error-regexp-alist-alist)

(push 'mac-assert compilation-error-regexp-alist)
(push `(mac-assert "^Assertion failed: \\(.+?\\), function .+?, file \\(.+?\\), line \\([0-9]+\\)\\.$"
              2 3 ,(not :column) ,(not :just-a-warning) 1)
      compilation-error-regexp-alist-alist)


(push 'mygnu compilation-error-regexp-alist)
(push '(mygnu
     ;; The first line matches the program name for

     ;;     PROGRAM:SOURCE-FILE-NAME:LINENO: MESSAGE

     ;; format, which is used for non-interactive programs other than
     ;; compilers (e.g. the "jade:" entry in compilation.txt).

     ;; This first line makes things ambiguous with output such as
     ;; "foo:344:50:blabla" since the "foo" part can match this first
     ;; line (in which case the file name as "344").  To avoid this,
     ;; the second line disallows filenames exclusively composed of
     ;; digits.

     ;; Similarly, we get lots of false positives with messages including
     ;; times of the form "HH:MM:SS" where MM is taken as a line number, so
     ;; the last line tries to rule out message where the info after the
     ;; line number starts with "SS".  --Stef

     ;; The core of the regexp is the one with *?.  It says that a file name
     ;; can be composed of any non-newline char, but it also rules out some
     ;; valid but unlikely cases, such as a trailing space or a space
     ;; followed by a -, or a colon followed by a space.

     ;; The "in \\|from " exception was added to handle messages from Ruby.
     "^\\(?:[[:alpha:]][-[:alnum:].]+: ?\\|[ \t]+\\(?:in \\|from \\)\\|\\(?:.+?\\[\\[[^@]*@\\)\\)?\
\\([0-9]*[^0-9\n]\\(?:[^\n :]\\| [^/\n]\\|:[^ \n]\\)*?\\): ?\
\\([0-9]+\\)\\(?:[.:]\\([0-9]+\\)\\)?\
\\(?:-\\([0-9]+\\)?\\(?:\\.\\([0-9]+\\)\\)?\\)?:\
\\(?: *\\(\\(?:Future\\|Runtime\\)?[Ww]arning\\|W:\\)\\|\
 *\\([Ii]nfo\\(?:\\>\\|rmationa?l?\\)\\|I:\\|instantiated from\\|[Nn]ote\\)\\|\
 *[Ee]rror\\|\[0-9]?\\(?:[^0-9\n]\\|$\\)\\|[0-9][0-9][0-9]\\)"
     1 (2 . 4) (3 . 5) (6 . 7))
      compilation-error-regexp-alist-alist)

;; When my compile-command crashes, emacs infuriatingly tries to take me to an
;; error at "/bin/bash: line: 1", revealing gibberish.  This matches that
;; pattern but then produces an empty filename.
(push 'crash compilation-error-regexp-alist)
(push `(crash "^/bin/bash\\(\\): line .*" 1) 
   compilation-error-regexp-alist-alist)

;; Destructively update compilation-error-regexp-alist-alist to make
;; all "Included from" lines in GCC error messages be merely INFO
;; instead of WARNINGs so compilation-next-error doesn't stop there.
(setcar (cddr (cl-cdddr (assoc 'gcc-include compilation-error-regexp-alist-alist))) 0)


;;
;; Process ANSI escape sequences in compilation-mode, per
;; https://emacs.stackexchange.com/a/38531/20572
;;

;; There are two parts to this. First, process ANSI colors:

;; Stolen from (http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html)
(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

;; Next, filter out unwanted ANSI escape sequences, like the ones intended for
;; ttys but Emacs doesn't know/care about:

;; Stolen from (https://oleksandrmanzyuk.wordpress.com/2011/11/05/better-emacs-shell-part-i/)
(defun regexp-alternatives (regexps)
  "Return the alternation of a list of regexps."
  (mapconcat (lambda (regexp)
               (concat "\\(?:" regexp "\\)"))
             regexps "\\|"))

(defvar non-sgr-control-sequence-regexp nil
  "Regexp that matches non-SGR control sequences.")

(setq non-sgr-control-sequence-regexp
      (regexp-alternatives
       '(;; icon name escape sequences
         "\033\\][0-2];.*?\007"
         ;; non-SGR CSI escape sequences
         "\033\\[\\??[0-9;]*[^0-9;m]"
         ;; noop
         "\012\033\\[2K\033\\[1F"
         )))

(defun filter-non-sgr-control-sequences-in-region (begin end)
  (save-excursion
    (goto-char begin)
    (while (re-search-forward
            non-sgr-control-sequence-regexp end t)
      (replace-match ""))))

(defun filter-non-sgr-control-sequences-in-output (ignored)
  (let ((start-marker
         (or comint-last-output-start
             (point-min-marker)))
        (end-marker
         (process-mark
          (get-buffer-process (current-buffer)))))
    (filter-non-sgr-control-sequences-in-region
     start-marker
     end-marker)))

(add-hook 'comint-output-filter-functions
          'filter-non-sgr-control-sequences-in-output)

;; Note that the second part is actually getting applied to all comint
;; derivatives, not just compilation-mode (It also fixes issues in,
;; e.g. shell). If this is not what you want, then add the hook to
;; compilation-filter-hook instead.
