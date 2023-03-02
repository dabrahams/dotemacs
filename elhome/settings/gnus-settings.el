(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnus-after-getting-new-news-hook
   '(gnus-display-time-event-handler gnus-group-save-newsrc))
 '(gnus-agent-expire-all t)
 '(gnus-agent-expire-days 14)
 '(gnus-agent-go-online t)
 '(gnus-agent-mark-unread-after-downloaded nil)
 '(gnus-agent-synchronize-flags t)
 '(gnus-always-read-dribble-file t nil nil "
Nobody can explain the circumstances under which you wouldn't want to recover from the dribble file.")
 '(gnus-article-address-banner-alist
   '(("@sig\\.com\\'" . signature)
     ("@volcanocorp\\.com\\'" . signature)))
 '(gnus-article-date-lapsed-new-header t)
 '(gnus-article-sort-functions
   '((not gnus-article-sort-by-number)))
 '(gnus-article-update-date-headers nil)
 '(gnus-asynchronous t)
 '(gnus-auto-select-next nil nil nil "
*** VERY IMPORTANT SETTING ***.  See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=9399")
 '(gnus-buttonized-mime-types nil)
 '(gnus-check-new-newsgroups nil nil nil "
We generally don't want to wait for NNTP servers to look for new groups except when going into the server buffer.")
 '(gnus-cite-attribution-prefix
   "In article\\|in <\\|On \\(Mon\\|Tue\\|Wed\\|Thu\\|Fri\\|Sat\\|Sun\\),\\|On \\(Jan\\|Feb\\|Mar\\|Apr\\|May\\|Jun\\|Jul\\|Aug\\|Sep\\|Oct\\|Nov\\|Dec\\)\\|----- ?Original Message ?-----")
 '(gnus-cite-parse-max-size 65535)
 '(gnus-cited-closed-text-button-line-format "...<schnipp %n>...
")
 '(gnus-cited-lines-visible
   '(5 . 10))
 '(gnus-cited-opened-text-button-line-format "")
 '(gnus-cloud-method nil)
 '(gnus-completing-read-function 'gnus-ido-completing-read)
 '(gnus-default-article-saver 'gnus-summary-write-to-file)
 '(gnus-default-directory "~")
 '(gnus-duplicate-list-length 100000)
 '(gnus-extra-headers
   '(To Cc List-Id Content-Type))
 '(gnus-gcc-mark-as-read t)
 '(gnus-generate-tree-function 'gnus-generate-horizontal-tree)
 '(gnus-group-default-list-level 4)
 '(gnus-group-line-format "%S%p%P%5y%5T: %(%B%G%B%)
")
 '(gnus-group-mode-hook
   '(gnus-topic-mode gnus-agent-mode))
 '(gnus-group-use-permanent-levels t)
 '(gnus-harvest-db-path "/Users/dave/Library/Data/Gnus/harvest-addrs")
 '(gnus-harvest-ignore-email-regexp
   "[+\"]\\|no-reply\\|noreply\\|@public.gmane.org\\|localhost\\|notifications@github.com\\| via swift-\\([-a-z]*\\) <swift-\\1@swift.org>")
 '(gnus-ignored-from-addresses
   "^david.abrahams@rcn.com\\|dave@boost\\(-consulting\\|pro\\).com$")
 '(gnus-ignored-mime-types
   '("application/x-pkcs7-signature" "application/ms-tnef" "text/x-vcard"))
 '(gnus-interactive-exit nil)
 '(gnus-large-newsgroup 1000)
 '(gnus-local-domain "boostpro.com")
 '(gnus-message-archive-group
   '((format-time-string "sent.%Y-%m")))
 '(gnus-message-highlight-citation t)
 '(gnus-message-replyencrypt nil)
 '(gnus-novice-user nil)
 '(gnus-parameters
   '(("gmane\\.mail\\.imap\\.isync\\.devel"
      (to-address . "isync-devel@lists.sourceforge.net"))
     ("gmane\\.comp\\.programming\\.tools\\.ryppl\\.devel "
      (to-address . "ryppl-dev@googlegroups.com"))
     ("gmane\\.comp\\.file-systems\\.zero-install\\.devel"
      (to-address . "zero-install-devel@lists.sourceforge.net")))
   nil nil "
The GMane group for isync-devel doesn't seem to forward my messages,
so I always post directly to the mailing list.")
 '(gnus-posting-styles
   '(((header "to" ".*[.@]apple\\.com\\(?:$\\|[,>]\\)")
      (address "dabrahams@apple.com")
      ("Bcc" "dabrahams@apple.com"))
     ("\\`\\[?[Aa]pple]?/.*\\|.*\\.comp\\.lang\\.swift\\..*"
      (address "dabrahams@apple.com")
      ("Bcc" "dabrahams@apple.com"))))
 '(gnus-read-newsrc-file nil)
 '(gnus-refer-article-method
   '(current
     (nnregistry "")
     (nnir "nnimap:LocalIMAP")
     (nnir "nntp:LocalNNTP")
     (nntp "LocalNNTP"
           (nntp-address "localhost")
           (nntp-port-number 9119))))
 '(gnus-refer-thread-use-nnir t)
 '(gnus-refer-thread-use-search t)
 '(gnus-safe-html-newsgroups ".")
 '(gnus-save-duplicate-list t)
 '(gnus-save-killed-list nil)
 '(gnus-save-newsrc-file nil)
 '(gnus-score-default-duration 'p)
 '(gnus-score-expiry-days 30)
 '(gnus-score-find-score-files-function
   '(gnus-score-find-hierarchical))
 '(gnus-search-ignored-newsgroups
   "nnimap\\+LocalIMAP:committee\\|nnimap\\+LocalIMAP:\\[Gmail\\]/Spam")
 '(gnus-secondary-select-methods nil)
 '(gnus-select-group-hook
   '(gnus-group-set-timestamp))
 '(gnus-select-method
   '(nntp "news.gmane.org"
          (nnir-search-engine gmane)))
 '(gnus-signature-separator
   '("^-- $" "^-- *$" "^_____+$" "^-----+?
NOTICE: "))
 '(gnus-simplify-subject-functions
   '(gnus-simplify-subject-fuzzy))
 '(gnus-sort-gathered-threads-function 'gnus-thread-sort-by-date t)
 '(gnus-spam-process-destinations
   '(("^\\(\\(nnimap\\+\\)?LocalIMAP:\\)?[^+]*$" "[Gmail]/Spam")))
 '(gnus-spam-process-newsgroups
   '(("^\\(\\(nntp\\+\\)?LocalNNTP:\\)?gmane\\."
      ((spam spam-use-gmane)))))
 '(gnus-split-methods
   '((gnus-save-site-lisp-file)
     (gnus-article-archive-name)
     (gnus-article-nndoc-name)))
 '(gnus-started-hook
   '((lambda nil
       (run-hooks 'gnus-after-getting-new-news-hook))))
 '(gnus-subscribe-newsgroup-method 'gnus-subscribe-topics)
 '(gnus-summary-expunge-below -100)
 '(gnus-summary-highlight
   '(((eq mark gnus-spam-mark)
      . spam)
     ((eq mark gnus-spam-mark)
      . spam)
     ((eq mark gnus-expirable-mark)
      . gnus-summary-expirable-face)
     ((eq mark gnus-spam-mark)
      . spam)
     ((eq mark gnus-spam-mark)
      . spam)
     ((eq mark gnus-canceled-mark)
      . gnus-summary-cancelled)
     ((and uncached
           (> score default-high))
      . gnus-summary-high-undownloaded)
     ((and uncached
           (< score default-low))
      . gnus-summary-low-undownloaded)
     (uncached . gnus-summary-normal-undownloaded)
     ((and
       (> score default-high)
       (or
        (eq mark gnus-dormant-mark)
        (eq mark gnus-ticked-mark)))
      . gnus-summary-high-ticked)
     ((and
       (< score default-low)
       (or
        (eq mark gnus-dormant-mark)
        (eq mark gnus-ticked-mark)))
      . gnus-summary-low-ticked)
     ((or
       (eq mark gnus-dormant-mark)
       (eq mark gnus-ticked-mark))
      . gnus-summary-normal-ticked)
     ((and
       (> score default-high)
       (eq mark gnus-ancient-mark))
      . gnus-summary-high-ancient)
     ((and
       (< score default-low)
       (eq mark gnus-ancient-mark))
      . gnus-summary-low-ancient)
     ((eq mark gnus-ancient-mark)
      . gnus-summary-normal-ancient)
     ((and
       (> score default-high)
       (eq mark gnus-unread-mark))
      . gnus-summary-high-unread)
     ((and
       (< score default-low)
       (eq mark gnus-unread-mark))
      . gnus-summary-low-unread)
     ((eq mark gnus-unread-mark)
      . gnus-summary-normal-unread)
     ((> score default-high)
      . gnus-summary-high-read)
     ((< score default-low)
      . gnus-summary-low-read)
     (t . gnus-summary-normal-read)))
 '(gnus-summary-ignore-duplicates t)
 '(gnus-summary-line-format
   "%O%U%R%z%~(form my-align-gnus-summary)@%B%&user-date;: %(%~(form (dwa/gnus-summary-from-or-to-sans-via-swift-group))@%~(form my-align-gnus-subject)@%)		%s
")
 '(gnus-suppress-duplicates t)
 '(gnus-suspend-gnus-hook
   '(gnus-group-save-newsrc))
 '(gnus-sync-global-vars
   '(gnus-newsrc-last-checked-date gnus-newsrc-alist gnus-server-alist gnus-topic-topology gnus-topic-alist))
 '(gnus-thread-hide-subtree
   '(not gnus-article-unread-p))
 '(gnus-thread-sort-functions
   '((not gnus-thread-sort-by-number)
     (not gnus-thread-sort-by-most-recent-date)
     gnus-thread-sort-by-total-score))
 '(gnus-topic-display-empty-topics nil)
 '(gnus-topic-line-format "%i[ %A: %(%{%n%}%) ]%v
")
 '(gnus-treat-date-lapsed 'head)
 '(gnus-treat-display-smileys nil)
 '(gnus-treat-from-gravatar 'head)
 '(gnus-treat-hide-citation t)
 '(gnus-treat-mail-gravatar 'head)
 '(gnus-treat-strip-cr t)
 '(gnus-treat-strip-leading-blank-lines 'first)
 '(gnus-treat-strip-multiple-blank-lines t)
 '(gnus-treat-strip-trailing-blank-lines 'last)
 '(gnus-tree-minimize-window nil)
 '(gnus-uncacheable-groups "^nnml")
 '(gnus-use-cache t)
 '(gnus-use-trees t)
 '(gnus-verbose 4)
 '(nnir-hyrex-remove-prefix "~/Library/Data/Gnus/Mail")
 '(nnir-ignored-newsgroups
   "nnimap\\+LocalIMAP:committee\\|nnimap\\+LocalIMAP:\\[Gmail\\]/Spam")
 '(nnir-namazu-index-directory "~/Library/Data/Gnus/Mail/namazu")
 '(nnir-namazu-remove-prefix "~/Library/Data/Gnus/Mail")
 '(nnir-notmuch-remove-prefix "~/Library/Data/Gnus/Mail")
 '(nnir-summary-line-format
   "%O%U%R%z%Z %g%~(form my-align-gnus-summary)@%B%&user-date;: %(%~(form (dwa/gnus-summary-from-or-to-sans-via-swift-group))@%~(form my-align-gnus-subject)@%)		%s
")
 '(nnir-swish++-configuration-file "~/Library/Data/Gnus/Mail/swish++.conf")
 '(nnir-swish++-remove-prefix "~/Library/Data/Gnus/Mail/")
 '(nnir-swish-e-additional-switches
   '("-c" "/Users/dave/Library/Data/Gnus/swish-e.conf"))
 '(nnir-swish-e-index-file "/Users/dave/Library/Data/Gnus/index.swish-e")
 '(nnir-swish-e-remove-prefix "/Users/dave/brew/spool/news/")
 '(nnmail-crosspost nil)
 '(nnmail-expiry-wait 30)
 '(nnmail-extra-headers
   '(To Cc Content-Type))
 '(nnmail-message-id-cache-file "~/Library/Data/Gnus/.nnmail-cache")
 '(nnmail-scan-directory-mail-source-once t)
 '(nnmail-split-methods
   '(("duplicates" "^Gnus-Warning:.*duplicate")))
 '(nnmail-treat-duplicates 'delete))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnus-summary-expirable-face
   ((t
     (:foreground "grey55" :strike-through t :slant italic :weight normal :width condensed :family "DejaVu Sans")))))
