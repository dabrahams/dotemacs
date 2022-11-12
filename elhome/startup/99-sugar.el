;;
;; This file contains startup code without which I wouldn't be at
;; all lost in a debugging session.
;;

(require 'use-package)

;; Disable the narrow-to-region binding; it's too easy to do by mistake
(bind-key* "C-x n n" nil)

(when (require 'sticky-windows nil :noerror)
  (bind-key* "C-x 0" 'sticky-window-delete-window)
  (bind-key* "C-x 1" 'sticky-window-delete-other-windows)
  (bind-key* "C-x 9" 'sticky-window-keep-window-visible))

(when (require 'auto-complete-config nil :no-error)
  (ac-config-default)
  (define-key ac-mode-map (kbd "C-c h") 'ac-last-quick-help)
  (define-key ac-mode-map (kbd "C-c H") 'ac-last-help))

(let ((warning-minimum-level :error)) (server-mode))

(prefer-coding-system 'utf-8)

;; auto modes

(add-to-list 'auto-mode-alist
             '("\\.mm\\'" . objc-mode))

(defun request-feature (feature)
  (or (require feature nil 'noerror)
      (and (message "requested feature %s not available" feature) nil)))

(use-package diminish :defer)

(use-package workgroups
  :defer
  :diminish workgroups-mode
  :init 
  (when (ignore-errors (progn (workgroups-mode 1) t))
    (if (bound-and-true-p wg-prefixed-map)
	(define-key wg-prefixed-map [(control ?z)] 'wg-switch-to-previous-workgroup)
      (if (file-readable-p "~/.emacs.d/workgroups")
	  (wg-load "~/.emacs.d/workgroups")))))

(use-package ws-butler
  :defer
  :init (ws-butler-global-mode))

; (add-to-list 'load-path "~/src/s/swift/utils")

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


(defun smart-brace-pair()
  (interactive "*")
  (if (eq (char-before (car (my-selection))) ?$)
      (insert-pair "{" "}")
    (brace-pair)))

(defun dollar-brace-pair()
  (interactive "*")
  (insert-pair "${" "}"))

(use-package swift-mode
  :if (locate-library "swift-mode")
  :mode ("\\.swift\\.gyb" . swift-mode)
  :commands swift-mode
  :bind (:map swift-mode-map ("C-{" . smart-brace-pair) ("C-$" . dollar-brace-pair)))

(use-package rust-mode
  :if (locate-library "rust-mode")
  :init (add-to-list 'auto-mode-alist '("\\.rust" . rust-mode))
  :bind (:map rust-mode-map ("C-{" . smart-brace-pair)))

(add-to-list 'auto-mode-alist '("\\.[jt]s$" . js-mode))

;; Flymake

;; (defun dwa/flymake-setup ()
;;   (when (and (request-feature 'use-package)
;;              (request-feature 'ghc-flymake)
;;              (request-feature 'haskell-font-lock)
;;              )            ; jww (2012-09-19): hack!
;;     (bind-key "M-?" 'ghc-flymake-display-errors c-mode-base-map))
;;   (bind-key "M-p" 'flymake-goto-prev-error c-mode-base-map)
;;   (bind-key "M-n" 'flymake-goto-next-error c-mode-base-map))
;; (add-hook 'c-mode-common-hook 'dwa/flymake-setup)

(defface dwa/glasses
  '((t :weight bold :underline t))
  "Face for highlighting capital letters in Camel-case")

;;;;;;;;;;
;; FFAP
;;;;;;;;;;

;; Automatically find files and URLs at point
(use-package ffap
  :bind (("\C-x\C-f" . find-file-at-point)
         ("\C-x\C-r" . ffap-read-only)
         ("\C-x\C-v" . ffap-alternate-file)

         ("\C-x4f"   . ffap-other-window)
         ("\C-x5f"   . ffap-other-frame)
         ("\C-x4r"   . ffap-read-only-other-window)
         ("\C-x5r"   . ffap-read-only-other-frame)

         ("\C-xd"    . dired-at-point)
         ("\C-x4d"   . ffap-dired-other-window)
         ("\C-x5d"   . ffap-dired-other-frame)
         ("\C-x\C-d" . ffap-list-directory))
  :init (progn (add-hook 'gnus-summary-mode-hook 'ffap-gnus-hook)
               (add-hook 'gnus-article-mode-hook 'ffap-gnus-hook))
    )

;; These hooks set up by ffap-bindings rebind `M-m', which I use for
;; org capture
(remove-hook 'gnus-summary-mode-hook 'ffap-gnus-hook)
(remove-hook 'gnus-article-mode-hook 'ffap-gnus-hook)

(when (request-feature 'ws-trim)
;  (global-ws-trim-mode t)
  (set-default 'ws-trim-level 0)
  (setq ws-trim-global-modes '(guess (not message-mode eshell-mode))))

;; Pretty ^L
(when (request-feature 'pp-c-l)
  (pretty-control-l-mode))

;; Page navigation 
(request-feature 'page-ext)

;; Per-window point
(when (request-feature 'per-window-point)
  (pwp-mode))

;;;;;;;;

(when (request-feature 'session)
  (add-hook 'after-init-hook 'session-initialize))

;;;;;;;

(when (request-feature 'color-theme)
  ;; (define-color-theme
  ;;   dwa-dark-theme
  ;;   "Dave Abrahams"
  ;;   "Refinement of zenburn for dark spaces"
  ;;   (color-theme-zenburn)
  ;;   (load-theme 'zenburn-overrides))
  (color-theme-initialize)
  (request-feature 'org-faces)
  ;; Store away the emacs default theme so I can get back there
  (fset 'color-theme-emacs-default (color-theme-make-snapshot))
  (add-to-list 'color-themes
               '(color-theme-emacs-default "Emacs Default" "Gnu"))
  (add-hook 'after-init-hook 'color-theme-select :append)
;  (add-hook 'after-init-hook 'dwa-dark-theme :append)
  )

(defun dark ()
  (interactive)
  (load-theme 'zenburn)
  (load-theme 'zenburn-overrides))

(defun light ()
  (interactive)
  (when (> emacs-major-version 23)
    ;; There's a bug in emacs 23 that makes this lose mode line faces
    (disable-theme 'zenburn-overrides))
  (disable-theme 'zenburn))

(setq frame-title-format
    '(:eval
      (concat "%["
              (if buffer-file-name default-directory "%b")
              " - %I%]")))

;; Make sure any customizations are saved before exiting.  Should
;; eventually be replaced by the use of cus-edit+
(defun dwa/save-customizations-before-exit ()
  (let ((doe (get 'debug-on-error 'customized-value))
        (doq (get 'debug-on-quit 'customized-value)))
    (unwind-protect
        (progn
          (put 'debug-on-error 'customized-value nil)
          (put 'debug-on-quit 'customized-value nil)
          (condition-case err 
              (progn (customize-unsaved) nil)
            (error 
             (or (equal err '(error "No user options are set but unsaved"))
                 (signal (car err) (cdr err))))))
      (put 'debug-on-error 'customized-value doe)
      (put 'debug-on-quit 'customized-value doq))))

;; Use cus-edit+ checking for unsaved customizations if available.
(unless (and (require 'cl nil :noerror) (require 'cus-edit+ nil :noerror))
  (add-to-list 'kill-emacs-query-functions 'dwa/save-customizations-before-exit))

;(request-feature 'elscreen-buffer-list)

;(request-feature 'frame-bufs)
;(ignore-errors (frame-bufs-mode t))

;; Man pages often come out too wide
(defadvice Man-getpage-in-background
  (around Man-narrow-please activate compile preactivate)
  (let ((Man-width (when (> (window-width) 90) 90)))
    ad-do-it))
(setenv "MANWIDTH" nil) ;; the `man' function respects these environment variables
(setenv "COLUMNS" nil)  ;; so let's dis' them.

;; The git pager sux except in a terminal
(setenv "GIT_PAGER" "")

(defun tde () 
  (interactive)
  (call-interactively 'toggle-debug-on-error))

(defun tdq () 
  (interactive)
  (call-interactively 'toggle-debug-on-quit))

(defun ed () 
  (interactive)
  (edebug-defun))

(defun de ()
  (interactive)
  (end-of-defun)
  (backward-sexp)
  (forward-sexp)
  (eval-last-sexp nil))

;; Toggle window dedication

(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message 
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window 
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is not dedicated")
   (current-buffer)))

;;
;; Avoid putting new stuff in tiny windows, per
;; [[message://4ED8FAB5.3050306@gmx.at]]
;;
(if (not (string-lessp emacs-version "24"))
 (defun make-small-windows-softly-dedicated ()
  (walk-window-tree
   (lambda (window)
     (cond
      ((and (> (window-total-size window) 10)
	    (eq (window-dedicated-p window) 'too-small))
       (set-window-dedicated-p window nil))
      ((and (<= (window-total-size window) 10)
	    (not (window-dedicated-p window)))
       (set-window-dedicated-p window 'too-small))))))
 ;; more expensive version for Emacs23 since constructing the window
 ;; list means one cons cell for each live window on the changed frame
 ;; [[message://4EF4AD73.6030006@gmx.at]]
 (defun make-small-windows-softly-dedicated ()
   (dolist (window (window-list nil 'nomini))
     (cond
      ((and (> (window-height window) 10)
            (eq (window-dedicated-p window) 'too-small))
       (set-window-dedicated-p window nil))
      ((and (<= (window-height window) 10)
            (not (window-dedicated-p window)))
       (set-window-dedicated-p window 'too-small))))))

(add-hook 'window-configuration-change-hook 'make-small-windows-softly-dedicated)

;; Buffer initialization stuff
(defcustom my-buffer-initialization-alist
      '(
        ("\\.[ih]\\(pp\\|xx\\)?$" . my-begin-cc-header)
        ("\\.c\\(pp\\|xx\\)$" . my-begin-cc-source)
        ("\\.\\(jam\\|\\html?\\|sh\\|py\\|rst\\|xml\\)$" . my-copyright)
        )
      "A list of pairs (PATTERN . FUNCTION) describing how to initialize an empty buffer whose
file name matches PATTERN."
      ':type 'alist
      )

(defadvice find-file (after my-prepare-code-contents disable)
  ;; if the file doesn't exist yet and is empty
  (if (and (equal (buffer-size) 0)
           (not (file-exists-p (buffer-file-name))))

      ;; try to find an initialization function
      (let ((initializer
             (find-if
              (lambda (pair) (string-match (car pair) (buffer-file-name)))
              my-buffer-initialization-alist)))

        ;; if found, call it
        (if initializer
            (progn (eval (list (cdr initializer)))
                   (set-buffer-modified-p nil)))
      )))

;; Makes `C-c RET C-a' send the current file as an attachment in dired
;; [[message://m2vcukdcsu.fsf@gmail.com]]
(autoload 'gnus-dired-mode "gnus-dired" nil t)
(add-hook 'dired-mode-hook 'gnus-dired-mode)

;; --- importing JW stuff

(defun my-gtags-or-semantic-find-tag ()
  (interactive)
  (if (and (fboundp 'semantic-active-p)
           (funcall #'semantic-active-p))
      (call-interactively #'semantic-complete-jump)
    (call-interactively #'gtags-find-tag)))

(use-package gtags
  :commands gtags-mode
  :diminish gtags-mode
  :config
  (progn

    (add-hook 'after-change-major-mode-hook (lambda () (gtags-mode t)))

    (bind-key "M-." 'my-gtags-or-semantic-find-tag gtags-mode-map)

    (bind-key "C-c t ." 'gtags-find-rtag)
    (bind-key "C-c t f" 'gtags-find-file)
    (bind-key "C-c t p" 'gtags-parse-file)
    (bind-key "C-c t g" 'gtags-find-with-grep)
    (bind-key "C-c t i" 'gtags-find-with-idutils)
    (bind-key "C-c t s" 'gtags-find-symbol)
    (bind-key "C-c t r" 'gtags-find-rtag)
    (bind-key "C-c t v" 'gtags-visit-rootdir)

    (bind-key "<mouse-2>" 'gtags-find-tag-from-here gtags-mode-map)))

;; Crashes compilation unless helm is installed
;(use-package helm-gtags
;      :bind ("M-T" . helm-gtags-select)
;      :config
;      (bind-key "M-," 'helm-gtags-resume gtags-mode-map))


(add-hook 'emacs-lisp-mode-hook 
          (lambda () (add-hook 'after-save-hook 'check-parens nil t)))

(use-package proof-site
  :load-path "el-get/dwamacs/site-lisp/ProofGeneral/generic/"
  :defer
  :config
  (progn
    (eval-after-load "coq"
      '(bind-key "M-RET" 'proof-goto-point coq-mode-map))

    (defadvice proof-electric-terminator
      (after insert-newline-after-terminator activate)
      (open-line 1)
      (indent-according-to-mode))))

(use-package findr
  :commands (findr-search findr-query-replace findr-find-files)
  :bind ("M-*" . tags-loop-continue))

;; ---

(use-package magit
  :init (progn
          (add-hook 'magit-mode-hook
                  (lambda()
                    (when (require 'magit-svn nil t) (turn-on-magit-svn))))

          ;; ability to cycle back to old commit messages
          ;; (https://github.com/magit/magit/issues/1677)
          (add-hook 'git-commit-setup-hook
                    (lambda ()
                      (add-hook 'with-editor-pre-finish-hook
                                'git-commit-save-message nil t)))
          )
  
  :config (dolist (mapName '(magit-mode-map magit-file-section-map magit-hunk-section-map))
            (when (boundp mapName)
              (unbind-key "<C-return>" (symbol-value mapName))))
  )

(use-package magit-imerge
  :config (progn
            (define-key magit-mode-map (kbd "C-c C-i") 'magit-gitignore)
            (define-key magit-mode-map "i" 'magit-imerge)))

;(use-package magit-gh-pulls
;  :config (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

;(use-package magithub
;  :after magit)

(use-package find-file-in-git-repo
  :bind ("\C-x f" . find-file-in-git-repo))

;; ---
(defun ac-clang-cc-mode-setup ()
  ;; (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

;; (use-package auto-complete-clang-async
;;   :init (progn
;; 	  (add-hook 'c-mode-common-hook 'ac-clang-cc-mode-setup)
;; 	  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;; 	  (global-auto-complete-mode t)))

;; automatic pairing and formatting

;; Note: these must be enabled in the right order to get the
;; appropriate effect!
(when (fboundp 'electric-indent-mode)
  ;; Enable
  (electric-indent-mode t)
  (electric-layout-mode t)
  (electric-pair-mode t)
  ;; Force disable
  (setq electric-indent-mode nil
        electric-layout-mode nil
        electric-pair-mode nil)
  ;; Allow individual buffers to override
  (make-variable-buffer-local 'electric-indent-mode)
  (make-variable-buffer-local 'electric-layout-mode)
  (make-variable-buffer-local 'electric-pair-mode)
  )

(use-package "xmlunicode.el"
  :commands
  (xmlunicode-character-insert
   xmlunicode-smart-double-quote
   xmlunicode-smart-hyphen
   xmlunicode-smart-single-quote
   xmlunicode-smart-period
   xmlunicode-character-menu-insert
   xmlunicode-character-shortcut-insert)
  )

(use-package artist
  :bind (:map artist-mode-map ([C-down-mouse-1] . artist-mouse-choose-operation)))

(when (save-match-data (string-match "/Gnus" (concat exec-directory (or (car command-line-args) ""))))
  (set-background-color "wheat")
  (gnus)
  (gnus-topic-read-group))

(defun interrupting-flymake-start-syntax-check (base-function)
  (when (and (boundp 'flymake-syntax-check-process) (process-live-p flymake-syntax-check-process))
    (setq flymake-check-was-interrupted t)
    (flymake-kill-process flymake-syntax-check-process))
  (funcall base-function)
  (when flymake-processes
    (let ((proc (car flymake-processes)))
      (set-process-query-on-exit-flag proc nil)
      (set (make-local-variable 'flymake-syntax-check-process) proc)
      (setq flymake-check-was-interrupted t)
      (setq flymake-is-running nil))))


(use-package flymake
   ; :config 
   ; (advice-add 'flymake-start-syntax-check :around #'interrupting-flymake-start-syntax-check)
   :bind ([M-f4] . flymake-goto-next-error)
   ([M-S-f4] . flymake-goto-prev-error)
  ; (add-function :before flymake-kill-process interrupting-flymake-kill-process)
)

(use-package poly-markdown
  :mode (("\\.\\(text\\|md\\|mkdn?\\|mmd\\|markdown\\)\\'" . poly-markdown-mode)))
(defun dwa/markdown-mode-setup ()
  (set-window-margins (selected-window) 10 10)
  (visual-line-mode)
)
(add-hook 'markdown-mode-hook 'dwa/markdown-mode-setup)

;;;

(use-package flx-ido
  :config (flx-ido-mode 1))

;;;

(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; Keystrokes to alter font size in the whole frame, and not just one buffer:
;; https://stackoverflow.com/a/60641769/125349
(defun acg/zoom-frame (&optional amt frame)
  "Increaze FRAME font size by amount AMT. Defaults to selected
frame if FRAME is nil, and to 1 if AMT is nil."
  (interactive "p")
  (let* ((frame (or frame (selected-frame)))
         (font (face-attribute 'default :font frame))
         (size (font-get font :size))
         (amt (or amt 1))
         (new-size (+ size amt)))
    (set-frame-font (font-spec :size new-size) t `(,frame))
    (message "Frame's font new size: %d" new-size)))

(defun acg/zoom-frame-out (&optional amt frame)
  "Call `acg/zoom-frame' with negative argument."
  (interactive "p")
  (acg/zoom-frame (- (or amt 1)) frame))

(global-set-key (kbd "M-+") 'acg/zoom-frame)
(global-set-key (kbd "M-_") 'acg/zoom-frame-out)

