;; Workarounds for [[message://m2bn8icavz.fsf@boostpro.com][eudc-mab issue]]
(setq eudc-contacts-file
  "~/Library/Application Support/AddressBook/AddressBook-v22.abcddb-shm")
(setq eudc-buffer-time 
      (current-time))

;;; Load eudc so we can get its completions
(require 'eudc)
;;;

(defun message-insert-spam-resistant-citation-line ()
  "Insert a simple citation line that slightly obscures the email address of the sender."

  (when message-reply-headers
    (let ((from-header (mail-header-from message-reply-headers)))
      (insert "\non " 
              (format-time-string 
               "%a %b %d %Y" (date-to-time (mail-header-date message-reply-headers))) 
              ", "
              (replace-regexp-in-string 
               " via swift\\(-[-a-z]+\\)? <swift\\1" " <swift\\1"
               (if (string-match "@public.gmane.org" from-header)
                   from-header ;; already obfuscated
                 (replace-regexp-in-string "@" "-AT-" from-header)))
              " wrote:\n\n")) ))

(defun org-message-store-link ()
  (when (eq major-mode 'message-mode)
    (save-restriction
      (message-narrow-to-headers)
      (org-store-link-props
       :type "message"
       :link (concat "message://" (substring (message-fetch-field "message-id" t) 1 -1))
       :description (message-fetch-field "subject")))
    t))

(defun org-message-buffer-store-link ()
  (require 'org)
  (let ((org-store-link-functions '(org-message-store-link)))
    (call-interactively 'org-store-link)))

(add-hook 'org-store-link-functions 'org-message-store-link)
(add-hook 'message-sent-hook 'org-message-buffer-store-link)

(defun dwa/message-send-rename ()
  "Renames sent message buffers to include the Subject field when
used as the value of `message-send-rename-function'."
  (message-narrow-to-headers)
  (unwind-protect
      (when (string-match
             "\\`\\*\\(sent \\|unsent \\)?\\(.+\\)\\*[^\\*]*\\|\\`mail to "
             (buffer-name))
        (let ((name (match-string 2 (buffer-name)))
              to group)
          (if (not (or (null name)
                       (string-equal name "mail")
                       (string-equal name "posting")))
              (setq name (concat "*sent " name ": "))
            (message-narrow-to-headers)
            (setq to (message-fetch-field "to"))
            (setq group (message-fetch-field "newsgroups"))
            (widen)
            (setq name
                  (cond
                   (to (concat "*sent mail to "
                               (or (car (mail-extract-address-components to))
                                   to) ": "))
                   ((and group (not (string= group "")))
                    (concat "*sent posting on " group ": "))
                   (t "*sent mail: "))))
          (setq name (concat name (message-fetch-field "subject") "*"))
          (unless (string-equal name (buffer-name))
            (rename-buffer name t))))
    (widen)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(message-citation-line-function 'message-insert-spam-resistant-citation-line)
 '(message-cite-prefix-regexp "\\([ 	]*[_.[:word:]]+>+\\|[ 	]*[]>|]\\)+" nil nil "
Removed \"}\" from the allowable characters because I often type that when writing replies.")
 '(message-dont-reply-to-names
   '("\\`dave\\(\\+.*\\)?@\\(boostpro\\|boost-consulting\\).com\\'" "\\`dabrahams\\(\\+.*\\)?@apple.com\\'" "\\<no-?reply\\>" "\\`undisclosed-recipients:"))
 '(message-forward-ignored-headers
   '("^Content-Transfer-Encoding:" "^X-Gnus" "^X-" "^Received:" "^User-Agent:" "^Face:" "^References:"))
 '(message-forward-show-mml t)
 '(message-log-max 1000)
 '(message-mode-hook
   '(use-hard-newlines))
 '(message-send-mail-function 'message-send-mail-with-sendmail)
 '(message-send-rename-function 'dwa/message-send-rename)
 '(message-subject-re-regexp
   "^[ 	]*\\(\\([Rr][Ee]\\|[Aa][Ww]\\)\\(\\[[0-9]*\\]\\)*:[ 	]*\\)*[ 	]*" nil nil "
Handle Germans' Aw: version of Re:")
 '(message-subject-trailing-was-query t nil nil "
always strip the trailing old subject in (was: ...) subjects")
 '(message-syntax-checks
   '((sender . disabled)
     (long-lines . disabled))
   nil nil "
Don't complain about long lines, please"))
