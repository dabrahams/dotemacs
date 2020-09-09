(add-hook 'prog-mode-hook 'dwa/prog-mode-hook)
(defun dwa/prog-mode-hook ()
  (ignore-errors (fci-mode t) (whitespace-mode -1))
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
