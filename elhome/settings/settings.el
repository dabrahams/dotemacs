(setq magit-last-seen-setup-instructions "1.4.0")

;; Force load this because we don't seem to be able to make
;; initsplit/elhome do the right thing.  Bankruptcy again!
(load-library "mime-settings")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list
   '("~/Library/Info/python/" "~/Library/Info/c++11/"))
 '(Info-breadcrumbs-in-header-flag t)
 '(Info-default-directory-list
   '("/Users/xin/midway/emacs-mac-port/build/share/info/" "/Applications/Emacs.app/Contents/Resources/info" "/Users/dave/brew/share/info/" "/usr/share/info/"))
 '(Info-fit-frame-flag nil)
 '(Info-saved-nodes
   '("(emacs)Top" "(elisp)Top" "(org)Top" "(gnus)Top" "(std)Top"))
 '(Man-header-file-path
   '("/usr/include" "/usr/local/include" "/Users/dave/brew/include"))
 '(ac-dictionary-directories
   '("~/.emacs.d/elhome/ac-dict/"))
 '(ad-redefinition-action 'accept nil nil "The default, `warn', Makes a lot of noise for no apparent benefit")
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"]
   t)
 '(auto-insert-mode t)
 '(backup-by-copying t)
 '(backup-directory-alist
   '(("." . "~/.emacs.d/backups")))
 '(blink-cursor-mode nil nil nil "
Blinking cursor just annoys me")
 '(byte-compile-verbose nil)
 '(c-backspace-function 'backward-delete-char)
 '(c-default-style







'((c-mode . "stlab")
     (c++-mode . "stlab")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "stlab")))
 '(c-style-alist
   '(("cc-mode" "user")
     ("user"
      (c-special-indent-hook))
     ("dwa" "bsd"
      (c-basic-offset . 4)
      (c-backslash-max-column . 200)
      (c-offsets-alist
       (innamespace . my-c-namespace-indent)
       (namespace-open . my-c-namespace-open-indent)
       (defun-block-intro . my-c-defun-block-intro-indent)
       (access-label . -3)
       (template-args-cont my-lineup-more-template-args my-lineup-template-close my-lineup-first-template-args +)
       (inher-intro . 2)
       (arglist-close . 0)))
     ("gnu"
      (c-basic-offset . 2)
      (c-comment-only-line-offset 0 . 0)
      (c-hanging-braces-alist
       (substatement-open before after)
       (arglist-cont-nonempty))
      (c-offsets-alist
       (statement-block-intro . +)
       (knr-argdecl-intro . 5)
       (substatement-open . +)
       (substatement-label . 0)
       (label . 0)
       (statement-case-open . +)
       (statement-cont . +)
       (arglist-intro . c-lineup-arglist-intro-after-paren)
       (arglist-close . c-lineup-arglist)
       (inline-open . 0)
       (brace-list-open . +)
       (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
       (topmost-intro-cont first c-lineup-topmost-intro-cont c-lineup-gnu-DEFUN-intro-cont))
      (c-special-indent-hook . c-gnu-impose-minimum)
      (c-block-comment-prefix . ""))
     ("k&r"
      (c-basic-offset . 5)
      (c-comment-only-line-offset . 0)
      (c-offsets-alist
       (statement-block-intro . +)
       (knr-argdecl-intro . 0)
       (substatement-open . 0)
       (substatement-label . 0)
       (label . 0)
       (statement-cont . +)))
     ("bsd"
      (c-basic-offset . 8)
      (c-comment-only-line-offset . 0)
      (c-offsets-alist
       (statement-block-intro . +)
       (knr-argdecl-intro . +)
       (substatement-open . 0)
       (substatement-label . 0)
       (label . 0)
       (statement-cont . +)
       (inline-open . 0)
       (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
       (inexpr-class . 0)))
     ("stroustrup"
      (c-basic-offset . 4)
      (c-comment-only-line-offset . 0)
      (c-offsets-alist
       (statement-block-intro . +)
       (substatement-open . 0)
       (substatement-label . 0)
       (label . 0)
       (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
       (statement-cont . +)))
     ("whitesmith"
      (c-basic-offset . 4)
      (c-comment-only-line-offset . 0)
      (c-offsets-alist
       (defun-open . +)
       (defun-close . c-lineup-whitesmith-in-block)
       (defun-block-intro add c-lineup-whitesmith-in-block c-indent-multi-line-block)
       (class-open . +)
       (class-close . +)
       (inline-open . +)
       (inline-close . c-lineup-whitesmith-in-block)
       (knr-argdecl-intro . +)
       (block-open . 0)
       (block-close . c-lineup-whitesmith-in-block)
       (brace-list-open . +)
       (brace-list-close . c-lineup-whitesmith-in-block)
       (brace-list-intro add c-lineup-whitesmith-in-block c-indent-multi-line-block)
       (brace-list-entry add c-lineup-after-whitesmith-blocks c-indent-multi-line-block)
       (brace-entry-open add c-lineup-after-whitesmith-blocks c-indent-multi-line-block)
       (statement add c-lineup-after-whitesmith-blocks c-indent-multi-line-block)
       (statement-block-intro add c-lineup-whitesmith-in-block c-indent-multi-line-block)
       (substatement-open . +)
       (substatement-label . +)
       (label . 0)
       (arglist-intro add c-lineup-whitesmith-in-block c-indent-multi-line-block)
       (arglist-cont add c-lineup-after-whitesmith-blocks c-indent-multi-line-block)
       (arglist-cont-nonempty add c-lineup-whitesmith-in-block c-indent-multi-line-block)
       (arglist-close . c-lineup-whitesmith-in-block)
       (inclass . c-lineup-whitesmith-in-block)
       (extern-lang-open . +)
       (namespace-open . +)
       (module-open . +)
       (composition-open . +)
       (extern-lang-close . +)
       (namespace-close . +)
       (module-close . +)
       (composition-close . +)
       (inextern-lang . c-lineup-whitesmith-in-block)
       (innamespace . c-lineup-whitesmith-in-block)
       (inmodule . c-lineup-whitesmith-in-block)
       (incomposition . c-lineup-whitesmith-in-block)
       (inexpr-class . 0)))
     ("ellemtel"
      (c-basic-offset . 3)
      (c-comment-only-line-offset . 0)
      (c-hanging-braces-alist
       (substatement-open before after)
       (arglist-cont-nonempty))
      (c-offsets-alist
       (topmost-intro . 0)
       (substatement . +)
       (substatement-open . 0)
       (case-label . +)
       (access-label . -)
       (inclass . +)
       (inline-open . 0)))
     ("linux"
      (c-basic-offset . 8)
      (c-comment-only-line-offset . 0)
      (c-hanging-braces-alist
       (brace-list-open)
       (brace-entry-open)
       (substatement-open after)
       (block-close . c-snug-do-while)
       (arglist-cont-nonempty))
      (c-cleanup-list brace-else-brace)
      (c-offsets-alist
       (statement-block-intro . +)
       (knr-argdecl-intro . 0)
       (substatement-open . 0)
       (substatement-label . 0)
       (label . 0)
       (statement-cont . +)))
     ("python"
      (indent-tabs-mode . t)
      (fill-column . 78)
      (c-basic-offset . 8)
      (c-offsets-alist
       (substatement-open . 0)
       (inextern-lang . 0)
       (arglist-intro . +)
       (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
       (knr-argdecl-intro . +))
      (c-hanging-braces-alist
       (brace-list-open)
       (brace-list-intro)
       (brace-list-close)
       (brace-entry-open)
       (substatement-open after)
       (block-close . c-snug-do-while)
       (arglist-cont-nonempty))
      (c-block-comment-prefix . ""))
     ("java"
      (c-basic-offset . 4)
      (c-comment-only-line-offset 0 . 0)
      (c-offsets-alist
       (inline-open . 0)
       (topmost-intro-cont . +)
       (statement-block-intro . +)
       (knr-argdecl-intro . 5)
       (substatement-open . +)
       (substatement-label . +)
       (label . +)
       (statement-case-open . +)
       (statement-cont . +)
       (arglist-intro . c-lineup-arglist-intro-after-paren)
       (arglist-close . c-lineup-arglist)
       (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
       (access-label . 0)
       (inher-cont . c-lineup-java-inher)
       (func-decl-cont . c-lineup-java-throws)))
     ("awk"
      (c-basic-offset . 4)
      (c-comment-only-line-offset . 0)
      (c-hanging-braces-alist
       (defun-open after)
       (defun-close . c-snug-1line-defun-close)
       (substatement-open after)
       (block-close . c-snug-do-while)
       (arglist-cont-nonempty))
      (c-hanging-semi&comma-criteria)
      (c-cleanup-list)
      (c-offsets-alist
       (statement-block-intro . +)
       (substatement-open . 0)
       (statement-cont . +))))
   t)
 '(canlock-password "963afd5a40a33c7f59217100af5a7c1648af74a1")
 '(color-theme-history-max-length t)
 '(color-theme-is-cumulative nil)
 '(column-number-mode nil)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-auto-jump-to-first-error t)
 '(compilation-skip-threshold 2)
 '(coq-unicode-tokens-enable t)
 '(coverlay:mark-tested-lines nil)
 '(coverlay:tested-line-background-color "")
 '(coverlay:untested-line-background-color "salmon")
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(cursor-type 'box)
 '(custom-buffer-done-kill t)
 '(custom-face-default-form 'all)
 '(custom-magic-show 'short)
 '(custom-magic-show-button t)
 '(custom-safe-themes
   '("ffaf9bf5c7908bdee309351d944046354acd841118b2ba64cd696f89eb1cf558" "b1fdecc1b2757584db81547f8886f88654b2423ebca7816f1797ff9613283a2d" "da53c5d117ebada2664048682a345935caf8e54094a58febd5f021462ef20ba2" "8dce5b23232d0a490f16d62112d3abff6babeef86ae3853241a85856f9b0a6e7" "72085337718a3a9b4a7d8857079aa1144ea42d07a4a7696f86627e46ac52f50b" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "8e2281b816edb0ec9ff44384662b68bfab8c5389c0258c447a3513fcb397a4f3" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "7c33d91f9896614a9c28e96def4cbd818f0aa7f151d1fb5d205862e86f2a3939" "b93ce589c81df2a0cf7e07d2b84d298105ce0ea189166239915530113d9c07aa" "052864c65d5fee0f0097ee8acd55d86cf666c214cca9a6f71522499b731ef7b4" "95db78d85e3c0e735da28af774dfa59308db832f84b8a2287586f5b4f21a7a5b" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "42f2726b08c278a3e2aa80e9ffb3178586b954b6c476f6cb5c0e817b048b55e6" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "fcbdc19b1b8adf59c3fc41b5030ed5b6af8c40564be4fa90c56971e4cefb96c9" "3edd5529eae67629a60407f5f49141c28bdeef0a774cf429d486fddb3db67dcf" "484955d17f5ecf9960c88e2dc8fbff997121e2804bf6ce5cbc297314c28a050d" "b75cb5c678c1129f92140dba07155675bb26250f28df59f714707b3eb162f92b" "f10d561ff8739114cc013ad05167e56618c054fb618dc8e866675fd55955ad21" "d7e021fb20767633bbabc55caa0ba0ebf09e14d6f1e25e105b073a60922ccfb5" "4ce6246e997a7d5ccc3fe3c53d76c612513f988ef36c41dedb91f7c625d9300b" "6be0e2efb6bfcdf5df031cded2efcaeb245d4018c9798d7e9b5138e534f0736a" "ba0380b2213842f54345de57b1065deb610fcc2176ab65846c3d80ee7ca0a8f7" "b06f914a0125006cf3d4e413a42a95d77a21ef54a512b8ea683f2cc4bcd45772" "ec33995fd55b0d78405f207232c6fb86c9f101f8bac5f0f969a42bfe6bad3355" "bf330ec6af1dbb8aed2e19c07b8f5e61c63dd4fed041551717205b471c9f823a" "af2f95f810c2642aa039b5b11ddb309fbd42f5e5d6c032d68a49fad18dc0c968" "dea61a12a79fac7f0aa23784d2f11f10d351925904a27913af301fc769a436d7" "479b343f577693cb162aabfffb32c20dd78ad31eaee4e622764c55409ef38722" "a50de17cacd11e23e3f917fb47a634345937937255870e332beeddb73254e6f3" "5fa3b591d2fae9bd1a250a7ebe09c46ede99e131040754cf92a679208827d9d4" "329ee3023d4fe4408174ed5463b4f4903926d499356a5803d10bb8f47a387eb6" "26fb90f317d9788b546389ec5171f2ccd49e86735c1d1a8260100f61005104c3" "9604bae13a3a91860220c39403abb0ed2d793de836b469252c06ec8022820e92" "bb0041c0aa4680b708465c7150ff29fe1cc7a6d69b8b8fc2cd5f57a520d82f70" "2485eaead83db99165857aae3bf31dcaf184f0e286ed7d948383e4fdf8737f50" "4373a5e070ab804ffff5b2b53a12c945f9317c64a07840b8b5fb1be652604d1b" "d1e9809f97e33a8e461e5acefd4c6f54b6075bf0761e1a76c8c3fb9b0d47fe7b" "fb75d2d70e2696134e4bdad6ae10f10dd0c741bf8a2d375bbdcf864314de723e" "1b7caa779ad718320632954165993f48d9a0418efb59e131d53f3b952f83bde3" "0faff4eae0a8bc28f3f9b9f096b893db78ccc823f73cc34420a629b2cbc6da5d" "864cb146d904312336068803efd75fb965e8e62355e5c6f85dfe3474f51898c0" "b7419fc63a23f84014f0f29dd99a2bb883d7d58e" "a263088a00f531a10f43500d3a782ebbbe7b5092" "e7cc30a240db2b04f082c9a62db0a68d9f841a70" "0988a1666cfff8417b19384adc36d075b739b9a4" default))
 '(custom-unlispify-tag-names nil)
 '(customize-unsaved-ignore
   '(compilation-auto-jump-to-first-error case-fold-search debug-on-error))
 '(dabbrev-case-fold-search nil)
 '(delete-by-moving-to-trash t)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(describe-char-unidata-list t)
 '(diff-default-read-only t nil nil "
If you don't do this, all the nice navigation stuff is disabled by default.  Who wants to edit diffs by hand, anyway?")
 '(diff-jump-to-old-file t)
 '(diff-switches "-du")
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target nil)
 '(dired-listing-switches "-alh")
 '(dired-recursive-deletes 'always)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(doc-view-continuous t)
 '(doc-view-resolution 300)
 '(ediff-custom-diff-options "-u -b" nil nil "
Show me unified diffs by default")
 '(ediff-diff-options "-d")
 '(ediff-highlight-all-diffs nil nil nil "
only highlight the selected diff (keeps down gray cruft onscreen)")
 '(ediff-keep-variants nil nil nil "
Any unchanged buffers in the ediff are removed when the session ends.
`C-u q' to override when quitting.")
 '(ediff-merge-filename-prefix "")
 '(ediff-skip-merge-regions-that-differ-from-default nil)
 '(ediff-split-window-function 'split-window-horizontally nil nil "
Show diffs side-by-side")
 '(ediff-window-setup-function 'ediff-setup-windows-plain nil nil "
Run Ediff all in one frame.  The default when there's a window manager is for
emacs to pop up a separate frame for the `*Ediff Control Panel*' buffer")
 '(el-get-byte-compile nil)
 '(el-get-sources
   '((:name gtags :type http :url "http://cvs.savannah.gnu.org/viewvc/*checkout*/global/global/gtags.el" :description "gtags facility for Emacs" :website "http://www.gnu.org/software/global/" :commands gtags-mode :diminish gtags-mode :after
            (progn
              (defun my-gtags-or-semantic-find-tag nil
                (interactive)
                (if
                    (and
                     (fboundp 'semantic-active-p)
                     (funcall #'semantic-active-p))
                    (call-interactively #'semantic-complete-jump)
                  (call-interactively #'gtags-find-tag)))
              (add-hook 'after-change-major-mode-hook
                        (lambda nil
                          (gtags-mode t)))
              (bind-key "M-." 'my-gtags-or-semantic-find-tag gtags-mode-map)
              (bind-key "C-c t ." 'gtags-find-rtag)
              (bind-key "C-c t f" 'gtags-find-file)
              (bind-key "C-c t p" 'gtags-parse-file)
              (bind-key "C-c t g" 'gtags-find-with-grep)
              (bind-key "C-c t i" 'gtags-find-with-idutils)
              (bind-key "C-c t s" 'gtags-find-symbol)
              (bind-key "C-c t r" 'gtags-find-rtag)
              (bind-key "C-c t v" 'gtags-visit-rootdir)
              (bind-key "<mouse-2>" 'gtags-find-tag-from-here gtags-mode-map)
              (use-package helm-gtags :bind
                ("M-T" . helm-gtags-select)
                :config
                (bind-key "M-," 'helm-gtags-resume gtags-mode-map)))
            :symbol gtags)))
 '(electric-pair-pairs
   '((34 . 34)
     (96 . 96)
     (40 . 41)
     (91 . 93)
     (123 . 125)
     (8220 . 8221)))
 '(elscreen-buffer-list-enabled t)
 '(elscreen-buffer-to-nickname-alist
   '(("[Ss]hell" . "shell")
     ("compilation" . "compile")
     ("-telnet" . "telnet")
     ("dict" . "OnlineDict")
     ("*WL:Message*" . "Wanderlust")))
 '(elscreen-display-screen-number nil)
 '(elscreen-display-tab t)
 '(elscreen-mode-to-nickname-alist
   '(("^dired-mode$" lambda nil
      (format "Dired(%s)" dired-directory))
     ("^Info-mode$" lambda nil
      (format "Info(%s)"
              (file-name-nondirectory Info-current-file)))
     ("^mew-draft-mode$" lambda nil
      (format "Mew(%s)"
              (buffer-name
               (current-buffer))))
     ("^mew-" . "Mew")
     ("^\\(irchat\\|erc\\)-" . "Chat")
     ("^liece-" . "Liece")
     ("^lookup-" . "Lookup")
     ("^gnus-" . "Gnus")))
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(enable-local-eval t)
 '(enable-recursive-minibuffers nil)
 '(enable-remote-dir-locals t)
 '(eudc-inline-expansion-format
   '("%s <%s>" name email))
 '(eudc-protocol 'ldap)
 '(eudc-server "ldap.apple.com")
 '(explicit-bash-args
   '("--noediting" "-i" "-l")
   nil nil "
added -l so it would take things out of my .bash_profile, like (on boostpro.com) the prompt pattern.  Otherwise I get this abomination: ///bd5882fff11dd5c2900e1ce95b895e66")
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#d9d9d9")
 '(ffap-machine-p-known 'accept)
 '(ffap-machine-p-local 'reject)
 '(ffap-machine-p-unknown 'ping)
 '(ffap-require-prefix t)
 '(fill-column 100)
 '(findr-skip-directory-regexp
   "\\/.backups$\\|/_darcs$\\|/\\.git$\\|/CVS$\\|/\\.svn$\\|/.build$\\|/.swiftpm$")
 '(flymake-gui-warnings-enabled nil)
 '(font-lock-verbose nil)
 '(g-user-email "dave@boostpro.com")
 '(gdb-delete-out-of-scope nil)
 '(gdb-many-windows t)
 '(gdb-max-frames 100 nil nil "
Increased the number of stack frames displayed from 40")
 '(gdb-show-main t)
 '(glasses-face 'dwa/glasses)
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
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
 '(gravatar-icon-size 50)
 '(gravatar-retrieval-program "wget -q -O '%s' '%s'" nil nil "
Requires wget, which isn't on the Mac by default.  Someday should
figure out how to use curl instead, but for now I just installed wget
from macports.")
 '(gravatar-size 48)
 '(grep-use-null-filename-separator nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(gud-tooltip-mode t)
 '(hl-line-sticky-flag nil)
 '(ido-enable-flex-matching t)
 '(ido-everywhere nil)
 '(ido-gather-virtual-filenames
   '(ido-gather-recent-files ido-gather-git-project-files))
 '(ido-mode 'buffer nil
            (ido))
 '(ido-show-dot-for-dired t)
 '(ido-use-faces nil)
 '(ido-use-filename-at-point 'guess)
 '(ido-use-url-at-point t)
 '(ido-use-virtual-buffers 'auto)
 '(imap-shell-program
   '("/Users/dave/brew/sbin/dovecot --exec-mail imap" "ssh %s imapd" "rsh %s imapd" "ssh %g ssh %s imapd" "rsh %g rsh %s imapd"))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist
   '((fullscreen . maximized)))
 '(initsplit-customizations-alist
   '(("\\`\\(gnus\\(-home\\)?\\|message\\)-directory\\'" "preloaded-settings.el" nil t)
     ("\\`erc-nickserv-passwords\\'" "../startup/10-passwd.el" nil nil)
     ("\\`\\(dwa/\\)?\\(org\\|calendar\\|diary\\)-" "org-settings.el" nil nil)
     ("\\`\\(dwa/\\)?\\(mime\\|mm\\)-.*" "mime-settings.el" nil t)
     ("\\`\\(dwa/\\)?\\(wl\\|apel\\|flim\\|semi\\|elmo\\)-" "wl-settings.el" nil nil)
     ("\\`\\(dwa/\\)?yas\\(nippet\\)?\\(-\\|/\\)" "yasnippet-settings.el" nil nil)
     ("\\`\\(dwa/\\)?\\(nn\\|gnus-\\)" "gnus-settings.el" nil nil)
     ("\\`\\(dwa/\\)?bcc-" "byte-code-cache-settings.el" nil nil)
     ("\\`\\(haskell\\|ghc\\)" "haskell-mode-settings.el" nil nil)
     ("\\`\\(markdown\\)" "markdown-settings.el" nil t)))
 '(initsplit-pretty-print t)
 '(ipa-file-function 'ipa-get-sidecar-file)
 '(irony-mode-line " Fe")
 '(ispell-program-name "aspell")
 '(jabber-account-list
   '(("dabrahams@im.apple.com"
      (:connection-type . starttls))))
 '(jabber-mode-line-mode t)
 '(jabber-muc-disable-disco-check t)
 '(kept-new-versions 6)
 '(large-file-warning-threshold nil)
 '(ldap-host-parameters-alist
   '(("ldap.apple.com" base "ou=people,o=apple computer" auth simple)))
 '(lsp-clients-clangd-args
   '("--compile-commands-dir=/Users/dabrahams/src/s/build/Ninja-ReleaseAssert/swift-macosx-x86_64"))
 '(magit-backup-mode nil)
 '(magit-completing-read-function 'magit-builtin-completing-read)
 '(magit-create-branch-behaviour 'at-point)
 '(magit-mode-hook
   '(magit-load-config-extensions bug-reference-mode))
 '(magit-process-popup-time 5)
 '(magit-push-arguments nil)
 '(magit-repo-dirs
   '("/Users/dave/src"))
 '(magit-repo-dirs-depth 3)
 '(magit-repository-directories
   '(("~/src" . 3)))
 '(magit-repository-directories-depth 3 t)
 '(magit-save-repository-buffers 'dontask)
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-bisect-output magit-insert-bisect-rest magit-insert-bisect-log magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-stashes magit-insert-unpulled-from-upstream magit-insert-unpulled-from-pushremote magit-insert-unpushed-to-upstream magit-insert-recent-commits magit-insert-unpushed-to-pushremote))
 '(magit-wip-mode t)
 '(mail-dont-reply-to-names
   "dave@\\(boost-consulting\\|boostpro\\)\\.com\\|dave\\.abrahams@rcn\\.com\\|boost\\.consulting@gmail\\.com\\|dave\\.boostpro@gmail\\.com\\|Undisclosed-recipients[:;]*\\|\\<noreply\\>\\|\\<no-reply\\>")
 '(mail-envelope-from 'header)
 '(mail-setup-with-from nil)
 '(mail-signature t)
 '(mail-source-delete-incoming t)
 '(mail-source-delete-old-incoming-confirm nil)
 '(mail-source-report-new-mail-interval 15)
 '(mail-specify-envelope-from t)
 '(mail-user-agent 'gnus-user-agent)
 '(mailcap-download-directory "~/Downloads")
 '(mairix-file-path "~/Library/Data/Indexes")
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
Don't complain about long lines, please")
 '(mf-display-padding-height 46 nil nil "The default value of 45 leaves the titlebar tucked up under the menu bar on OSX Lion
See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10449")
 '(mf-max-width 2560)
 '(mime-edit-split-message nil nil nil "
This should really be the default.  Most MUAs can't decode the split messages!")
 '(mime-play-delete-file-immediately nil)
 '(mime-save-directory "/tmp")
 '(minibuffer-depth-indicate-mode t)
 '(mm-attachment-override-types
   '("text/x-vcard" "application/pkcs7-mime" "application/x-pkcs7-mime" "application/pkcs7-signature" "application/x-pkcs7-signature" "image/*")
   nil nil "
Added image/* to display attached images inline")
 '(mm-discouraged-alternatives
   '("image/.*" "text/html" "text/richtext"))
 '(mm-inline-large-images 'resize)
 '(mm-inline-text-html-with-images t)
 '(muse-project-alist
   '(("WikiPlanner"
      ("~/plans" :default "index" :major-mode planner-mode :visit-link planner-visit-link))))
 '(next-error-highlight t)
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
 '(nnmail-treat-duplicates 'delete)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(ns-alternate-modifier 'control nil nil "
I'm continually pressing option when I mean control.  So, I get no
Command key.  Oh, well!  I wish I could make right-command work as
command.")
 '(ns-command-modifier 'meta)
 '(ns-pop-up-frames nil)
 '(ns-right-alternate-modifier 'hyper)
 '(ns-right-command-modifier 'super)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-native-compile t)
 '(package-selected-packages
   '(ws-butler abridge-diff poly-markdown lua-mode jekyll-modes org-protocol-jekyll indium "use-package" cov coverlay lemon-mode memoize flycheck-ocaml learn-ocaml iedit merlin tuareg utop sml-mode prettier counsel-projectile flycheck-projectile nameframe-perspective nameframe-projectile org-projectile perspective projectile projectile-variable treemacs-projectile bison-mode bug-hunter visual-fill-column magit-gh-pulls yaml-mode forge ghub treepy closql emacsql-sqlite emacsql quelpa cask git commander dash ansi package-build shut-up epl f s whitespace-cleanup-mode bazel-mode realgud-lldb easy-jekyll magit-imerge swift-mode magit zerodark-theme marmalade-client flx-ido nzenburn-theme zenburn anti-zenburn-theme labburn-theme zenburn-theme flymake-cursor alert find-file-in-git-repo xmlunicode rust-mode yagist use-package twilight-bright-theme twilight-anti-bright-theme pastels-on-dark-theme message-x maxframe ham-mode grep+ gist findr elhome cus-edit+ column-enforce-mode cmake-mode boxquote))
 '(pdf-view-midnight-colors
   '("#DCDCCC" . "#383838"))
 '(perfect-margin-mode t)
 '(perfect-margin-visible-width 80)
 '(pp^L-^L-string
   "····································✄····································
")
 '(proof-electric-terminator-enable t)
 '(proof-shell-fiddle-frames nil nil nil "John says, \"I was able to get the default \"three windows mode\"
for Proof General working reliably by customizing this\"")
 '(proof-splash-enable nil)
 '(proof-three-window-enable nil)
 '(ps-font-family 'Helvetica)
 '(ps-font-info-database
   '((Courier
      (fonts
       (normal . "Courier")
       (bold . "Courier-Bold")
       (italic . "Courier-Oblique")
       (bold-italic . "Courier-BoldOblique"))
      (size . 10.0)
      (line-height . 10.55)
      (space-width . 6.0)
      (avg-char-width . 6.0))
     (Helvetica
      (fonts
       (normal . "Helvetica")
       (bold . "Helvetica-Bold")
       (italic . "Helvetica-Oblique")
       (bold-italic . "Helvetica-BoldOblique"))
      (size . 10.0)
      (line-height . 11.56)
      (space-width . 2.78)
      (avg-char-width . 5.09243))
     (Times
      (fonts
       (normal . "Times-Roman")
       (bold . "Times-Bold")
       (italic . "Times-Italic")
       (bold-italic . "Times-BoldItalic"))
      (size . 10.0)
      (line-height . 11.0)
      (space-width . 2.5)
      (avg-char-width . 4.71432))
     (Palatino
      (fonts
       (normal . "Palatino-Roman")
       (bold . "Palatino-Bold")
       (italic . "Palatino-Italic")
       (bold-italic . "Palatino-BoldItalic"))
      (size . 10.0)
      (line-height . 12.1)
      (space-width . 2.5)
      (avg-char-width . 5.08676))
     (Helvetica-Narrow
      (fonts
       (normal . "Helvetica-Narrow")
       (bold . "Helvetica-Narrow-Bold")
       (italic . "Helvetica-Narrow-Oblique")
       (bold-italic . "Helvetica-Narrow-BoldOblique"))
      (size . 10.0)
      (line-height . 11.56)
      (space-width . 2.2796)
      (avg-char-width . 4.17579))
     (NewCenturySchlbk
      (fonts
       (normal . "NewCenturySchlbk-Roman")
       (bold . "NewCenturySchlbk-Bold")
       (italic . "NewCenturySchlbk-Italic")
       (bold-italic . "NewCenturySchlbk-BoldItalic"))
      (size . 10.0)
      (line-height . 12.15)
      (space-width . 2.78)
      (avg-char-width . 5.31162))
     (AvantGarde-Book
      (fonts
       (normal . "AvantGarde-Book")
       (italic . "AvantGarde-BookOblique"))
      (size . 10.0)
      (line-height . 11.77)
      (space-width . 2.77)
      (avg-char-width . 5.45189))
     (AvantGarde-Demi
      (fonts
       (normal . "AvantGarde-Demi")
       (italic . "AvantGarde-DemiOblique"))
      (size . 10.0)
      (line-height . 12.72)
      (space-width . 2.8)
      (avg-char-width . 5.51351))
     (Bookman-Demi
      (fonts
       (normal . "Bookman-Demi")
       (italic . "Bookman-DemiItalic"))
      (size . 10.0)
      (line-height . 11.77)
      (space-width . 3.4)
      (avg-char-width . 6.05946))
     (Bookman-Light
      (fonts
       (normal . "Bookman-Light")
       (italic . "Bookman-LightItalic"))
      (size . 10.0)
      (line-height . 11.79)
      (space-width . 3.2)
      (avg-char-width . 5.67027))
     (Symbol
      (fonts
       (normal . "Symbol"))
      (size . 10.0)
      (line-height . 13.03)
      (space-width . 2.5)
      (avg-char-width . 3.24324))
     (Zapf-Dingbats
      (fonts
       (normal . "Zapf-Dingbats"))
      (size . 10.0)
      (line-height . 9.63)
      (space-width . 2.78)
      (avg-char-width . 2.78))
     (ZapfChancery-MediumItalic
      (fonts
       (normal . "ZapfChancery-MediumItalic"))
      (size . 10.0)
      (line-height . 11.45)
      (space-width . 2.2)
      (avg-char-width . 4.10811))
     (Zapf-Chancery-MediumItalic
      (fonts
       (normal . "ZapfChancery-MediumItalic"))
      (size . 10.0)
      (line-height . 11.45)
      (space-width . 2.2)
      (avg-char-width . 4.10811))))
 '(ps-header-lines 1)
 '(ps-left-header
   '(ps-get-buffer-name))
 '(ps-use-face-background t)
 '(python-python-command "env python")
 '(rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25)
 '(rcirc-server-alist
   '(("irc.us.libera.chat" :channels
      ("#emacs"))))
 '(remember-annotation-functions
   '(org-remember-annotation)
   nil nil "
As prescribed by http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner.html.  Note: buffer-file-name was checked in the default.")
 '(remember-handler-functions
   '(org-remember-handler)
   nil nil "As prescribed by http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner.html.  Note: remember-append-to-file is checked in the default.")
 '(revert-without-query
   '(".*"))
 '(safe-local-variable-values
   '((auto-fill-mode . -1)
     (auto-fill-mode)
     (smie-indent-basic . 2)
     (git-commit-major-mode . git-commit-elisp-text-mode)
     (whitespace-action quote
                        (auto-cleanup))
     (whitespace-style face lines-tail tabs empty trailing)
     (whitespace-style face lines-tail tabs)
     (swift-mode:basic-offset . 2)
     (swift-mode:parenthesized-expression-offset . 2)
     (swift-mode:multiline-statement-offset . 2)
     (flycheck-clang-language-standard . "c++14")
     (swift-basic-offset . 4)
     (swift-mode
      (whitespace-style face lines indentation:space)
      (swift-basic-offset . 4)
      (tab-always-indent . t))
     (prog-mode
      (eval add-hook 'prog-mode-hook
            (lambda nil
              (whitespace-mode 1))
            (not :APPEND)
            :BUFFER-LOCAL))
     (objc-mode
      (whitespace-style face lines indentation:space))
     (c-mode
      (whitespace-style face lines indentation:space))
     (c++-mode
      (whitespace-style face lines indentation:space))
     (swift-syntax-check-fn . swift-syntax-check-single-file)
     (swift-syntax-check-fn quote swift-syntax-check-single-file)
     (flycheck-clang-language-standard . "c++14")
     (auto-fill-inhibit-regexp . ".*|.*")
     (swift-syntax-check-fn . swift-project-swift-syntax-check)
     (swift-find-executable-fn . swift-project-executable-find)
     (buffer-face-mode . 1)
     (swift-basic-offset . 2)
     (whitespace-line-column . 77)
     (whitespace-style lines face)
     (whitespace-line-column . 2)
     (whitespace-mode . t)
     (whitespace-style lines)
     (tab-always-indent . t)
     (tab-always-indent t)
     (tab-always-indent)
     (whitespace-style face lines indentation:space)
     (whitespace-mode)
     (whitespace-style tabs)
     (whitespace-style indentation:space)
     (whitespace-style face indentation:space)
     (whitespace-style face lines indentation:tab)
     (require-final-newline . t)
     (org-confirm-babel-evaluate)
     (org-export-babel-evaluate . t)
     (org-refile-targets
      (nil :todo . "THEME"))
     (org-refile-targets
      (nil :todo . "PROJECT"))
     (org-refile-targets
      (org-agenda-files :level . 3))
     (org-refile-targets
      (nil :tag . "refiletarget"))
     (eval add-hook 'local-write-file-hooks
           (lambda nil
             (save-excursion
               (delete-trailing-whitespace))))
     (whitespace-style face lines-tail)
     (eval add-hook 'local-write-file-hooks
           '(lambda nil
              (save-excursion
                (delete-trailing-whitespace))))
     (eval add-hook 'before-save-hook 'delete-trailing-whitespace)
     (eval whitespace-mode)
     (eval set-face-attribute 'whitespace-line nil :background "red1" :foreground "yellow" :weight 'bold)
     (eval set-face-attribute 'whitespace-tab nil :background "red1" :foreground "yellow" :weight 'bold)
     (whitespace-style face trailing lines-tail)
     (whitespace-line-column . 80)
     (eval require 'whitespace)
     (eval add-hook 'write-file-hooks 'time-stamp)
     (test-case-name . buildbot\.test\.test_sourcestamp)
     (test-case-name . buildbot\.test\.test_changes)
     (test-case-name . buildbot\.broken_test\.test_web_status_json)
     (encoding . utf8)
     (folded-file . t)))
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(send-mail-function 'smtpmail-send-it)
 '(server-mode nil)
 '(set-mark-command-repeat-pop t)
 '(shell-command-with-editor-mode t)
 '(show-paren-mode t)
 '(shr-bullet "• ")
 '(shr-table-corner 43)
 '(shr-table-horizontal-line 45)
 '(shr-table-vertical-line 124)
 '(shr-width 80)
 '(smime-certificate-directory "~/Library/Data/Gnus/Mail/certs/")
 '(smtp-server "smtp.gmail.com")
 '(smtpmail-default-smtp-server "www.boostpro.com")
 '(smtpmail-local-domain "boostpro.com")
 '(smtpmail-smtp-service 587 t)
 '(smtpmail-starttls-credentials
   '(("www.boostpro.com" 587 "" "")))
 '(spam-report-gmane-use-article-number nil)
 '(split-height-threshold nil)
 '(swift-basic-offset 2)
 '(swift-mode:basic-offset 2)
 '(swift-mode:multiline-statement-offset 2)
 '(swift-mode:parenthesized-expression-offset 2)
 '(tab-bar-show 1)
 '(tab-stop-list
   '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
 '(text-mode-hook
   '(turn-on-auto-fill text-mode-hook-identify))
 '(tool-bar-mode nil nil nil "
Tool bars take up valuable screen real-estate for icons whose meaning I forget")
 '(tramp-backup-directory-alist
   '(("." . "~/.emacs.d/backups"))
   nil
   (tramp))
 '(tramp-default-host "localhost" nil
                      (tramp))
 '(tramp-default-proxies-alist
   '(("\\`localhost\\'" nil nil)
     ("\\`206.217.198.21\\'" nil nil)
     ("\\`.+\\'" "\\`root\\'" "/ssh:%h:"))
   nil
   (tramp)
   "
Gets around the common setting that prohibits ssh login as root.

Don't do any proxying for connections to localhost (depends
on the customization of tramp-default-host to \"localhost\" for simple
matching), and otherwise, if sudo'ing somewhere, ssh there first and
then sudo on the remote host itself.")
 '(tramp-remote-path
   '(tramp-own-remote-path tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
 '(truncate-partial-width-windows nil)
 '(user-mail-address "dave@boostpro.com")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vc-diff-switches "-du")
 '(vc-follow-symlinks t)
 '(vc-git-diff-switches
   '("--find-renames=80"))
 '(version-control t)
 '(warning-suppress-types
   '((\(undo\ discard-info\)))
   nil nil "
Without this, emacs pops up annoying warnings in, e.g., *shell* buffers
where I don't expect it to be keeping undo history anyway")
 '(weblogger-config-alist
   '(("homepage" "http://daveabrahams.com/xmlrpc.php" "dave" "" "2")
     ("techarcana" "http://techarcana.net/xmlrpc.php" "dave" "" "1")
     ("cpp-next" "http://cpp-next.com/xmlrpc.php" "dave" "" "1")
     ("ryppl" "http://ryppl.org/xmlrpc.php" "dave" "" "4")
     ("boostpro" "http://boostpro.com/xmlrpc.php" "dave" "" "1")))
 '(weblogger-edit-entry-hook
   '((lambda nil
       (switch-to-buffer "*weblogger-entry*"))))
 '(weblogger-edit-mode 'my-weblogger-markdown-mode)
 '(weblogger-server-url "http://cpp-next.com/xmlrpc.php")
 '(weblogger-server-username "dave")
 '(wg-morph-on nil)
 '(which-function-mode t)
 '(whitespace-action
   '(auto-cleanup))
 '(winner-mode t)
 '(workgroups-mode t)
 '(ws-butler-global-mode t))
 

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold-italic
   ((t
     (:inherit
      (bold italic)))))
 '(diff-refine-change
   ((((background light))
     (:background "#FFFFC0")))
   t)
 '(dwa/glasses
   ((t
     (:underline "red" :weight bold))))
 '(font-lock-constant-face
   ((((class grayscale)
      (background light))
     (:inherit fixed-pitch :foreground "LightGray" :underline t :weight bold))
    (((class grayscale)
      (background dark))
     (:inherit fixed-pitch :foreground "Gray50" :underline t :weight bold))
    (((class color)
      (min-colors 88)
      (background light))
     (:inherit fixed-pitch :foreground "dark cyan"))
    (((class color)
      (min-colors 88)
      (background dark))
     (:inherit fixed-pitch :foreground "Aquamarine"))
    (((class color)
      (min-colors 16)
      (background light))
     (:foreground "CadetBlue"))
    (((class color)
      (min-colors 16)
      (background dark))
     (:inherit fixed-pitch :foreground "Aquamarine"))
    (((class color)
      (min-colors 8))
     (:inherit fixed-pitch :foreground "magenta"))
    (t
     (:inherit fixed-pitch :underline t :weight bold))))
 '(font-lock-radar-fg
   ((t
     (:foreground "slate gray")))
   t)
 '(font-lock-radar-white
   ((t
     (:foreground "dim gray")))
   t)
 '(font-lock-string-face
   ((((class color)
      (min-colors 88)
      (background light))
     (:background "Beige" :foreground "DarkGreen" :slant italic))))
 '(git-commit-overlong-summary-face
   ((t
     (:inherit nil))))
 '(gnus-summary-expirable-face
   ((t
     (:foreground "grey55" :strike-through t :slant italic :weight normal :width condensed :family "DejaVu Sans"))))
 '(lazy-highlight
   ((t
     (:background "paleturquoise"))))
 '(magit-whitespace-warning-face
   ((t
     (:inherit nil))))
 '(radar-default-light\ blue
   ((t
     (:foreground "medium blue" :box nil :weight bold)))
   t)
 '(radar-default-light\ sky\ blue
   ((t
     (:foreground "deep sky blue" :box nil :weight bold)))
   t)
 '(radar-grey18-default
   ((t
     (:background "gainsboro" :box nil :weight normal)))
   t)
 '(radar-grey18-light\ blue
   ((t
     (:background "gainsboro" :foreground "medium blue" :box nil :weight normal)))
   t)
 '(radar-grey22-default
   ((t
     (:background "white smoke" :box nil :weight normal)))
   t)
 '(radar-grey22-light\ blue
   ((t
     (:background "light gray" :foreground "medium blue" :box nil :weight normal)))
   t)
 '(rst-adornment
   ((t
     (:inherit
      (font-lock-keyword-face fixed-pitch)))))
 '(rst-directive
   ((t
     (:inherit
      (font-lock-builtin-face fixed-pitch)))))
 '(rst-level-1
   ((((background light))
     (:inherit fixed-pitch :background "grey85"))
    (((background dark))
     (:inherit fixed-pitch :background "grey15"))))
 '(rst-level-1-face
   ((t
     (:background "grey85" :foreground "black")))
   t)
 '(rst-level-2
   ((((background light))
     (:inherit rst-level-1 :background "grey78"))
    (((background dark))
     (:inherit rst-level-1 :background "grey22"))))
 '(rst-level-2-face
   ((t
     (:inherit nil :background "grey78" :foreground "black")))
   t)
 '(rst-level-3
   ((((background light))
     (:inherit rst-level-2 :background "grey71"))
    (((background dark))
     (:inherit rst-level-2 :background "grey29"))))
 '(rst-level-3-face
   ((t
     (:background "grey71" :foreground "black")))
   t)
 '(rst-level-4
   ((((background light))
     (:inherit rst-level-3 :background "grey64"))
    (((background dark))
     (:inherit rst-level-3 :background "grey36"))))
 '(rst-level-4-face
   ((t
     (:background "grey64" :foreground "black")))
   t)
 '(rst-level-5
   ((((background light))
     (:inherit rst-level-4 :background "grey57"))
    (((background dark))
     (:inherit rst-level-4 :background "grey43"))))
 '(rst-level-5-face
   ((t
     (:background "grey57" :foreground "black")))
   t)
 '(rst-level-6
   ((((background light))
     (:inherit rst-level-5 :background "grey50"))
    (((background dark))
     (:inherit rst-level-5 :background "grey50"))))
 '(rst-level-6-face
   ((t
     (:background "grey50" :foreground "black")))
   t)
 '(rst-literal
   ((t
     (:inherit
      (font-lock-string-face fixed-pitch)))))
 '(wg-brace-face
   ((((class color)
      (background light))
     (:foreground "#7b8f01"))
    (((class color)
      (background dark))
     (:foreground "light slate blue")))
   t)
 '(wg-command-face
   ((((class color)
      (background light))
     (:foreground "#80002c"))
    (((class color)
      (background dark))
     (:foreground "aquamarine")))
   t)
 '(wg-current-workgroup-face
   ((((class color)
      (background light))
     (:foreground "dark blue"))
    (((class color)
      (background dark))
     (:foreground "white")))
   t)
 '(wg-divider-face
   ((((class color)
      (background light))
     (:foreground "#7b8f01"))
    (((class color)
      (background dark))
     (:foreground "light slate blue")))
   t)
 '(wg-filename-face
   ((((class color)
      (background light))
     (:foreground "#783106"))
    (((class color))
     (:foreground "light sky blue")))
   t)
 '(wg-frame-face
   ((((class color)
      (background light))
     (:foreground "black"))
    (((class color)
      (background dark))
     (:foreground "white")))
   t)
 '(wg-message-face
   ((((class color)
      (background light))
     (:foreground "#783106"))
    (((class color)
      (background dark))
     (:foreground "light sky blue")))
   t)
 '(wg-mode-line-face
   ((((class color)
      (background light))
     (:foreground "#783106"))
    (((class color)
      (background dark))
     (:foreground "light sky blue")))
   t)
 '(wg-other-workgroup-face
   ((((class color)
      (background light))
     (:foreground "#887767"))
    (((class color)
      (background dark))
     (:foreground "light slate grey")))
   t)
 '(wg-previous-workgroup-face
   ((((class color)
      (background light))
     (:foreground "#783106"))
    (((class color)
      (background dark))
     (:foreground "light sky blue")))
   t)
 '(whitespace-line
   ((((background light))
     (:background "light goldenrod"))
    (((background dark))
     (:background "dark goldenrod"))))
 '(widget-button
   ((((background dark))
     (:inherit custom-button :background "gray15" :foreground "gray" :box nil :weight bold))
    (((background light))
     (:inherit custom-button :background "white smoke" :box nil :weight bold)))))
