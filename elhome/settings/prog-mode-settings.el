(add-hook 'prog-mode-hook 'dwa/prog-mode-hook)
(defun dwa/prog-mode-hook ()
  (ignore-errors (fci-mode t) (whitespace-mode -1))
  (flymake-mode 1)
  ;; These are wrong as they are enabled globally.  Just put them in 99-sugar if you want that.
  ;; (electric-pair-mode t)
  ;; (electric-layout-mode t)
  )
