(add-hook 'prog-mode-hook 'dwa/prog-mode-hook)
(defun dwa/prog-mode-hook ()
  (ignore-errors
    (display-fill-column-indicator-mode)
    (whitespace-mode -1))
  (when (eq major-mode 'swift-mode)
    ;;  See https://github.com/swift-emacs/swift-mode/issues/180
    (which-function-mode -1))
    ;; Turn on flymake in this buffer, but only *after* local
    ;; variables have been set up.
    ;; (run-with-idle-timer 
    ;;  0.1 (not :repeat) 
    ;;  (lambda (b) (ignore-errors (with-current-buffer b (flymake-mode 1))))
    ;;  (current-buffer))
  ;; These are wrong as they are enabled globally.  Just put them in 99-sugar if you want that.
  ;; (electric-pair-mode t)
  ;; (electric-layout-mode t)
  )

(add-hook 'polymode-minor-mode-hook 'dwa/polymode-minor-mode-hook)
(defun dwa/polymode-minor-mode-hook ()
  (ignore-errors
    (display-fill-column-indicator-mode -1)))

;; Create mode-specific tables.
(defvar swift-mode-syntax-table nil
  "Syntax table used while in SWIFT mode.")

(if (not swift-mode-syntax-table)
    (progn
      (setq swift-mode-syntax-table (make-syntax-table))
      (mapc (function (lambda (n)
                        (modify-syntax-entry (aref n 0)
                                             (aref n 1)
                                             swift-mode-syntax-table)))
            '(
              ;; whitespace (` ')
              [?\f  " "]
              [?\t  " "]
              [?\   " "]
              ;; word constituents (`w')
              ;; punctuation
              [?< "."]
              [?> "."]
              ;; comments
              [?/  ". 124"]
              [?*  ". 23b"]
              [?\n  ">"]
              [?\^m  ">"]
              ;; symbol constituents (`_')
              [?_ "_"]
              ;; punctuation (`.')
              ;; open paren (`(')
              [?\( "())"]
              [?\[ "(]"]
              [?\{ "(}"]
              ;; close paren (`)')
              [?\) ")("]
              [?\] ")["]
              [?\} "){"]
              ;; string quote ('"')
              [?\" "\""]
              ;; escape-syntax characters ('\\')
              [?\\ "\\"]
              ))))

(defconst swift-doc-comment-detail-re
  (let* ((just-space "[ \t\n]*")
        (not-just-space "[ \t]*[^ \t\n].*")
        (eol "\\(?:$\\)")
        (continue "\n\\1"))

    (concat "^\\([ \t]*///\\)" not-just-space eol
            "\\(?:" continue not-just-space eol "\\)*"
            "\\(" continue just-space eol
            "\\(?:" continue ".*" eol "\\)*"
            "\\)"))
  "regexp that finds the non-summary part of a swift doc comment as subexpression 2")

(defun swift-hide-doc-comment-detail ()
  "Hide everything but the summary part of doc comments.

Use `M-x hs-show-all' to show them again."
    (interactive)
  (hs-minor-mode)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (while (search-forward-regexp swift-doc-comment-detail-re (point-max) :noerror)
        (hs-hide-comment-region (match-beginning 2) (match-end 2))
        (goto-char (match-end 2))))))

(defun swift-summaries-only ()
  (interactive)
  "Strip verbosity from Swift doc comments"
  (replace-regexp "\\(\n *///\\)\\( [^ \n].*\\)\\(\\(\\1 [^ \n].*\\)*\\)\\(\\1.*\\)*" "\\1\\2\\3"))

(defvar swift-mode-generic-parameter-list-syntax-table
  (let ((s (copy-syntax-table swift-mode-syntax-table)))
    (modify-syntax-entry ?\< "(>" s)
    (modify-syntax-entry ?\> ")<" s)
    s))

(defun swift-skip-comments-and-space ()
  "Skip comments and whitespace, returning t"
  (while (forward-comment 1))
  t)

(defconst swift-identifier-re "\\_<[[:alpha:]_].*?\\_>")

(defun swift-skip-optionality ()
  "Hop over any comments, whitespace, and strings
of `!' or `?', returning t unconditionally."
  (swift-skip-comments-and-space)
  (while (not (zerop (skip-chars-forward "!?")))
    (swift-skip-comments-and-space)))

(defun swift-skip-generic-parameter-list ()
  "Hop over any comments, whitespace, and, if present, a generic
parameter list, returning t if the parameter list was found and
nil otherwise."
  (swift-skip-comments-and-space)
  (when (looking-at "<")
    (with-syntax-table swift-mode-generic-parameter-list-syntax-table
      (ignore-errors (forward-sexp) t))))

(defun swift-skip-re (pattern)
  "Hop over any comments and whitespace; then if PATTERN matches
the next characters skip over them, returning t if so and nil
otherwise."
  (swift-skip-comments-and-space)
  (save-match-data
    (when (looking-at pattern)
      (goto-char (match-end 0))
      t)))

(defun swift-skip-identifier ()
  "Hop over any comments, whitespace, and an identifier if one is
present, returning t if so and nil otherwise."
  (swift-skip-re swift-identifier-re))

(defun swift-skip-simple-type-name ()
  "Hop over a chain of the form identifier
generic-parameter-list? ( `.' identifier generic-parameter-list?
)*, returning t if the initial identifier was found and nil otherwise."
  (when (swift-skip-identifier)
    (swift-skip-generic-parameter-list)
    (when (swift-skip-re "\\.")
      (swift-skip-simple-type-name))
    t))

(defun swift-skip-type-name ()
    "Hop over any comments, whitespace, and the name of a type if
one is present, returning t if so and nil otherwise"
  (swift-skip-comments-and-space)
  (let ((found nil))
    ;; repeatedly
    (while
        (and
         ;; match a tuple or an identifier + optional generic param list
         (cond
          ((looking-at "[[(]")
           (forward-sexp)
           (setq found t))

          ((swift-skip-simple-type-name)
           (setq found t)))

          ;; followed by "->"
         (prog2 (swift-skip-re "\\?+")
             (swift-skip-re "throws\\|rethrows\\|->")
           (swift-skip-re "->") ;; accounts for the throws/rethrows cases on the previous line
           (swift-skip-comments-and-space))))
    found))

(defun swift-skip-constraint ()
    "Hop over a single type constraint if one is present,
returning t if so and nil otherwise"
  (swift-skip-comments-and-space)
  (and (swift-skip-type-name)
       (swift-skip-re ":\\|==")
       (swift-skip-type-name)))

(defun swift-skip-where-clause ()
    "Hop over a where clause if one is present, returning t if so
and nil otherwise"
  (when (swift-skip-re "\\<where\\>")
    (while (and (swift-skip-constraint) (swift-skip-re ",")))
    t))

(defun swift-in-string-or-comment ()
  "Return non-nil if point is in a string or comment."
  (or (nth 3 (syntax-ppss)) (nth 4 (syntax-ppss))))

(defconst swift-body-keyword-re
  "\\_<\\(var\\|func\\|init\\|deinit\\|subscript\\)\\_>")

(defun swift-hide-bodies ()
  "Hide the bodies of methods, functions, and computed properties.

Use `M-x hs-show-all' to show them again."
    (interactive)
  (hs-minor-mode)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (while (search-forward-regexp swift-body-keyword-re (point-max) :noerror)
        (when
            (and
             (not (swift-in-string-or-comment))
             (let ((keyword (match-string 0)))
               ;; parse up to the opening brace
               (cond
                ((equal keyword "deinit") t)

                ((equal keyword "var")
                 (and (swift-skip-identifier)
                      (swift-skip-re ":")
                      (swift-skip-type-name)))

                ;; otherwise, there's a parameter list
                (t
                 (and
                  ;; parse the function's base name or operator symbol
                  (if (equal keyword "func") (forward-symbol 1) t)
                  ;; advance to the beginning of the function
                  ;; parameter list
                  (progn
                    (swift-skip-generic-parameter-list)
                    (swift-skip-comments-and-space)
                    (equal (char-after) ?\())
                  ;; parse the parameter list and any return type
                  (prog1
                    (swift-skip-type-name)
                    (swift-skip-where-clause))))))
             (swift-skip-re "{"))
          (hs-hide-block :reposition-at-end))))))
