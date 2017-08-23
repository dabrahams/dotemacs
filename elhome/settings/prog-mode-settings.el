(add-hook 'prog-mode-hook 'dwa/prog-mode-hook)
(defun dwa/prog-mode-hook ()
  (ignore-errors (fci-mode t) (whitespace-mode -1))
    ;; Turn on flymake in this buffer, but only *after* local
    ;; variables have been set up.
    (run-with-idle-timer 
     0.1 (not :repeat) 
     (lambda (b) (with-current-buffer b (flymake-mode 1)))
     (current-buffer))
  ;; These are wrong as they are enabled globally.  Just put them in 99-sugar if you want that.
  ;; (electric-pair-mode t)
  ;; (electric-layout-mode t)
  )
