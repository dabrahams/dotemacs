;; Enable locally-installed site-lisp
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(unless (boundp 'user-emacs-directory)
  (defconst user-emacs-directory (expand-file-name "~/.emacs.d/")))

(add-to-list 'load-path (concat user-emacs-directory "site-lisp/non-GPL3") :append)

(add-to-list 'Info-default-directory-list "/Applications/Emacs.app/Contents/Resources/info")

;;
;; MELPA Package Management Setup
;;
(require 'package nil :noerror)

(if (string-match "^0.[0-8]$" package-el-version)
    (progn
      (defconst elpa-package-archive-base package-archive-base)
      (defconst package-archive-base "http://melpa.milkbox.net/packages/")
      (defadvice package--download-one-archive (around package--download-builtins-archive activate)
	"Allow package-list-packages to work without exposing any of what's at ELPA"
	(let ((package-archive-base 
	       (if (equal (ad-get-arg 0) "builtin-packages")
		   elpa-package-archive-base
		 package-archive-base)))
	  ad-do-it))

      ;; Newer package.el's create a directory called "archives" that
      ;; is not a package.  Define a version of this function that's
      ;; resilient to that directory existing.
      (defun package-load-descriptor (dir package) 
	"Load the description file for a package. 
Return nil if the package could not be found." 
	(let* ((pkg-dir (concat (file-name-as-directory dir) package "/"))
	       (pkg-sans-version (and (file-directory-p pkg-dir) (package-strip-version package))))
	  (when pkg-sans-version
	    (load (concat pkg-dir pkg-sans-version "-pkg") nil t))))

      (defadvice package-unpack-single (around package-unpack-fix activate)
	"Work around a bug that prevents package from recovering
      when a dependency is already installed" 
	(condition-case nil
	    ad-do-it
	  (file-already-exists nil)))
      )

  (progn
    (add-to-list 'package-archives
		 '("melpa" . "http://melpa.milkbox.net/packages/") t)
    (when (< emacs-major-version 24)
      (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") :append))))

(let ((elpa-dir (concat user-emacs-directory "elpa")))
  (unless (file-directory-p elpa-dir)
    (make-directory elpa-dir)
    (package-refresh-contents)))

;; This adds packages to load-path and loads their -autoloads files,
;; but nothing more.  Still, it might be better to load these
;; explicitly, to help maintain control over what appears in my emacs
;; installation.  Consider setting package-load-list before calling it.
(package-initialize)

;;
;; Ensure all my "baseline" packages are available
;;
;; My baseline packages are the minimum I need to get through the
;; startup sequence.  If they're not already installed, they'll be
;; fetched now.  Most other packages are loaded with use-package.
(defun dwa/ensure-package (feature)
  "Use the package manager to ensure that this feature is loaded.
Any \"ensured\" packages form the minimal basis of my emacs
installation."
  (unless (require feature nil :noerror)
    (package-install feature)
    (require feature)))

(dwa/ensure-package 'melpa)     ;; contains at least one fix to the package manager.

;; workaround for backward compatibility of use-package
(unless (fboundp 'declare-function)
  (defmacro declare-function (fn file &optional arglist fileonly) nil))

(dwa/ensure-package 'bind-key)
(dwa/ensure-package 'use-package)
(dwa/ensure-package 'initsplit)
(dwa/ensure-package 'elhome)

(use-package maxframe
  :init (add-hook 'window-setup-hook 'maximize-frame t))


;;
;; Global, "everywhere" key bindings
;;
(require 'bind-key)

(defun dwa/unconditional-kill-buffer ()
  (interactive)
  (let (kill-buffer-query-functions)
    (kill-buffer (current-buffer))))

(defun dwa/mark-active ()
  (if (fboundp 'region-active-p) (region-active-p) mark-active))

(defun dwa/mark-or-point ()
  "Return the mark if it is active, otherwise the point."
  (if (dwa/mark-active) (mark) (point)))

(defun dwa/select-forward-word (&optional arg)
  (interactive)
  (unless (dwa/mark-active)
    (set-mark (point)))
  (forward-word arg))
  
(defun dwa/select-backward-word (&optional arg)
  (interactive)
  (dwa/select-forward-word -1))

;;; FIXME - replace with my-recompile
(defun dwa/recompile ()
  (interactive)
  (switch-to-buffer "*compilation*")
  (compile (car compile-history)))

(bind-key* "<C-return>" 'other-window )
(bind-key* "C-." 'forward-word)
(bind-key* "C-," 'backward-word)
(bind-key* "C->" 'dwa/select-forward-word)
(bind-key* "C-<" 'dwa/select-backward-word)
(bind-key* "C-x C-k" 'dwa/unconditional-kill-buffer)
(bind-key* "C-S-<f7>" 'my-compile)
(bind-key* "<f7>" 'my-recompile)

;; Bindings for help extensions
(bind-key* "C-h M" 'man)

(defvar lisp-find-map)
(define-prefix-command 'lisp-find-map)
(bind-key* "C-h e" 'lisp-find-map)
(bind-key* "C-h e t" 'describe-theme)
(bind-key* "C-h e l" 'find-library)
(bind-key* "C-h e f" 'find-function)
(bind-key* "C-h e k" 'find-function-on-key)
(bind-key* "C-h e v" 'find-variable)
(bind-key* "C-h e i" 'info-apropos)
(bind-key* "C-h e o" 'customize-option)
(bind-key* "C-h e g" 'customize-group)
(bind-key* "C-h e m" 'view-echo-area-messages)


;;
;; ELHOME SETUP
;;

;; FIXME - can be removed after a new elhome is released
(unless (fboundp 'string-match-p)
  (defun string-match-p (regexp string &optional start)
    (save-match-data (string-match regexp string start))))

(setq custom-theme-directory "~/.emacs.d/elhome/settings")
(elhome-init)

;; Disable me-minor-mode from showing up in the mode line; we're using
;; bind-key instead.
(setq minor-mode-alist
      (assq-delete-all 'me-minor-mode minor-mode-alist))

;; Yamamoto Mitsuharu's emacs-mac-port
;; (https://github.com/railwaycat/emacs-mac-port) changes
;; report-emacs-bug so it sends reports to him instead of the upstream
;; maintainers.  But his code is so good that I almost invariably want
;; the bug to be reported upstream.  I use this function to do that.
(defun report-upstream-emacs-bug ()
  (interactive)
  (let ((features (remq 'mac features))) 
    (call-interactively 'report-emacs-bug)))

(use-package magit
  :bind ("C-x g" . magit-status))

;; Set up default font on earlier emacsen
;; FIXME - this should be moved into some elhome initialization file
(when (string-match "^22\..*" emacs-version)
  (add-to-list 'default-frame-alist  '(font . "-apple-monaco-medium-r-normal--14-0-72-72-m-0-iso10646-1")))

;;
;; Set up environment variables
;; FIXME - this should be moved into some elhome initialization file
(eval-when-compile
  (require 'cl))

;; Grab the user's environment settings
(with-temp-buffer
  ;; Find variable settings that are particular to a login shell
  (shell-command "diff -U0 <(set) <(echo set|${SHELL} -l)" (current-buffer))
  ;; parse the output for settings that changed
  (while (re-search-forward "^[+]\\([^=\n]+\\)=\\(.*\\)\n?" (not :bound) :noerror)
    (setenv (match-string 1) (match-string 2))))

;; Now update exec-path using the PATH environment variable
(dolist (dir-path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path dir-path))

;;(load (car (reverse (file-expand-wildcards "~/.emacs.d/elpa/elhome-*/elhome.el")))) 
;;(elhome-init)
