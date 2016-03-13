(add-to-list 'load-path "~/src/s/swift/utils")
(require 'swift-mode)
(require 'modal)

(defun insert-pair(open close)
  (let* ((sel (my-selection))
         (selected (region-active-p)))
    (goto-char (cdr sel))
    (insert close)
    (set-marker-insertion-type (cdr sel) t)
    (goto-char (car sel))
    (insert open)
    (goto-char (cdr sel))
    (when selected (forward-char))))

(defun brace-pair()
  (interactive "*")
  (insert-pair "{ " " }"))

(bind-key "C-{" 'brace-pair swift-mode-map)

(defun dollar-brace-pair()
  (interactive "*")
  (insert-pair "${" "}"))

(bind-key "C-$" 'dollar-brace-pair swift-mode-map)

;;
;; Support for opening radar URIs from emacs
;;
(defmacro add-rdar-to-uri-regexp (variable-name)
  `(setq ,variable-name
         (replace-regexp-in-string
          "telnet" "\\\\(?:telnet\\\\|rdar\\\\)"
                                  ,variable-name)))

(use-package thingatpt
  :config
  (progn
    (add-to-list 'thing-at-point-uri-schemes "rdar://")
    (if (boundp 'thing-at-point-url-regexp)
        (add-rdar-to-uri-regexp thing-at-point-url-regexp))))

(use-package ffap
  :config
    (add-rdar-to-uri-regexp ffap-url-regexp))

(add-hook 'swift-mode-hook
          (lambda () ;; automatic pairing and formatting
            (setq electric-layout-mode t
                  electric-indent-mode t
                  electric-pair-mode t)
            ))
