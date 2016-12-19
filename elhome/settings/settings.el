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
   (quote
    ("~/Library/Info/python/" "~/Library/Info/c++11/")))
 '(Info-breadcrumbs-in-header-flag t)
 '(Info-default-directory-list
   (quote
    ("/Users/xin/midway/emacs-mac-port/build/share/info/" "/Applications/Emacs.app/Contents/Resources/info" "/Users/dave/brew/share/info/" "/usr/share/info/")))
 '(Info-fit-frame-flag nil)
 '(Info-saved-nodes
   (quote
    ("(emacs)Top" "(elisp)Top" "(org)Top" "(gnus)Top" "(std)Top")))
 '(Man-header-file-path
   (quote
    ("/usr/include" "/usr/local/include" "/Users/dave/brew/include")))
 '(ac-dictionary-directories
   (quote
    ("~/.emacs.d/elhome/ac-dict/")))
 '(ad-redefinition-action
   (quote accept)
   nil nil "The default, `warn', Makes a lot of noise for no apparent benefit")
 '(ansi-color-names-vector
   [zenburn-bg zenburn-red zenburn-green zenburn-yellow zenburn-blue zenburn-magenta zenburn-cyan zenburn-fg])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(auto-insert-mode t)
 '(backup-by-copying t)
 '(backup-directory-alist
   (quote
    (("." . "~/.emacs.d/backups"))))
 '(blink-cursor-mode nil nil nil "
Blinking cursor just annoys me")
 '(byte-compile-verbose nil)
 '(c-backspace-function
   (quote backward-delete-char))
 '(c-default-style
   (quote
    ((c-mode . "dwa")
     (c++-mode . "dwa")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "dwa"))))
 '(canlock-password "963afd5a40a33c7f59217100af5a7c1648af74a1")
 '(color-theme-history-max-length t)
 '(color-theme-is-cumulative nil)
 '(column-number-mode nil)
 '(coq-unicode-tokens-enable t)
 '(create-lockfiles nil)
 '(cursor-type
   (quote box))
 '(custom-buffer-done-kill t)
 '(custom-face-default-form
   (quote all))
 '(custom-magic-show
   (quote short))
 '(custom-magic-show-button t)
 '(custom-safe-themes
   (quote
    ("7c33d91f9896614a9c28e96def4cbd818f0aa7f151d1fb5d205862e86f2a3939" "b93ce589c81df2a0cf7e07d2b84d298105ce0ea189166239915530113d9c07aa" "052864c65d5fee0f0097ee8acd55d86cf666c214cca9a6f71522499b731ef7b4" "95db78d85e3c0e735da28af774dfa59308db832f84b8a2287586f5b4f21a7a5b" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "42f2726b08c278a3e2aa80e9ffb3178586b954b6c476f6cb5c0e817b048b55e6" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "fcbdc19b1b8adf59c3fc41b5030ed5b6af8c40564be4fa90c56971e4cefb96c9" "3edd5529eae67629a60407f5f49141c28bdeef0a774cf429d486fddb3db67dcf" "484955d17f5ecf9960c88e2dc8fbff997121e2804bf6ce5cbc297314c28a050d" "b75cb5c678c1129f92140dba07155675bb26250f28df59f714707b3eb162f92b" "f10d561ff8739114cc013ad05167e56618c054fb618dc8e866675fd55955ad21" "d7e021fb20767633bbabc55caa0ba0ebf09e14d6f1e25e105b073a60922ccfb5" "4ce6246e997a7d5ccc3fe3c53d76c612513f988ef36c41dedb91f7c625d9300b" "6be0e2efb6bfcdf5df031cded2efcaeb245d4018c9798d7e9b5138e534f0736a" "ba0380b2213842f54345de57b1065deb610fcc2176ab65846c3d80ee7ca0a8f7" "b06f914a0125006cf3d4e413a42a95d77a21ef54a512b8ea683f2cc4bcd45772" "ec33995fd55b0d78405f207232c6fb86c9f101f8bac5f0f969a42bfe6bad3355" "bf330ec6af1dbb8aed2e19c07b8f5e61c63dd4fed041551717205b471c9f823a" "af2f95f810c2642aa039b5b11ddb309fbd42f5e5d6c032d68a49fad18dc0c968" "dea61a12a79fac7f0aa23784d2f11f10d351925904a27913af301fc769a436d7" "479b343f577693cb162aabfffb32c20dd78ad31eaee4e622764c55409ef38722" "a50de17cacd11e23e3f917fb47a634345937937255870e332beeddb73254e6f3" "5fa3b591d2fae9bd1a250a7ebe09c46ede99e131040754cf92a679208827d9d4" "329ee3023d4fe4408174ed5463b4f4903926d499356a5803d10bb8f47a387eb6" "26fb90f317d9788b546389ec5171f2ccd49e86735c1d1a8260100f61005104c3" "9604bae13a3a91860220c39403abb0ed2d793de836b469252c06ec8022820e92" "bb0041c0aa4680b708465c7150ff29fe1cc7a6d69b8b8fc2cd5f57a520d82f70" "2485eaead83db99165857aae3bf31dcaf184f0e286ed7d948383e4fdf8737f50" "4373a5e070ab804ffff5b2b53a12c945f9317c64a07840b8b5fb1be652604d1b" "d1e9809f97e33a8e461e5acefd4c6f54b6075bf0761e1a76c8c3fb9b0d47fe7b" "fb75d2d70e2696134e4bdad6ae10f10dd0c741bf8a2d375bbdcf864314de723e" "1b7caa779ad718320632954165993f48d9a0418efb59e131d53f3b952f83bde3" "0faff4eae0a8bc28f3f9b9f096b893db78ccc823f73cc34420a629b2cbc6da5d" "864cb146d904312336068803efd75fb965e8e62355e5c6f85dfe3474f51898c0" "b7419fc63a23f84014f0f29dd99a2bb883d7d58e" "a263088a00f531a10f43500d3a782ebbbe7b5092" "e7cc30a240db2b04f082c9a62db0a68d9f841a70" "0988a1666cfff8417b19384adc36d075b739b9a4" default)))
 '(custom-unlispify-tag-names nil)
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
 '(dired-recursive-deletes
   (quote always))
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(doc-view-resolution 300)
 '(el-get-byte-compile nil)
 '(el-get-sources
   (quote
    ((:name gtags :type http :url "http://cvs.savannah.gnu.org/viewvc/*checkout*/global/global/gtags.el" :description "gtags facility for Emacs" :website "http://www.gnu.org/software/global/" :commands gtags-mode :diminish gtags-mode :after
            (progn
              (defun my-gtags-or-semantic-find-tag nil
                (interactive)
                (if
                    (and
                     (fboundp
                      (quote semantic-active-p))
                     (funcall
                      (function semantic-active-p)))
                    (call-interactively
                     (function semantic-complete-jump))
                  (call-interactively
                   (function gtags-find-tag))))
              (add-hook
               (quote after-change-major-mode-hook)
               (lambda nil
                 (gtags-mode t)))
              (bind-key "M-."
                        (quote my-gtags-or-semantic-find-tag)
                        gtags-mode-map)
              (bind-key "C-c t ."
                        (quote gtags-find-rtag))
              (bind-key "C-c t f"
                        (quote gtags-find-file))
              (bind-key "C-c t p"
                        (quote gtags-parse-file))
              (bind-key "C-c t g"
                        (quote gtags-find-with-grep))
              (bind-key "C-c t i"
                        (quote gtags-find-with-idutils))
              (bind-key "C-c t s"
                        (quote gtags-find-symbol))
              (bind-key "C-c t r"
                        (quote gtags-find-rtag))
              (bind-key "C-c t v"
                        (quote gtags-visit-rootdir))
              (bind-key "<mouse-2>"
                        (quote gtags-find-tag-from-here)
                        gtags-mode-map)
              (use-package helm-gtags :bind
                ("M-T" . helm-gtags-select)
                :config
                (bind-key "M-,"
                          (quote helm-gtags-resume)
                          gtags-mode-map)))
            :symbol gtags))))
 '(electric-pair-pairs
   (quote
    ((34 . 34)
     (96 . 96)
     (40 . 41)
     (91 . 93)
     (123 . 125)
     (8220 . 8221))))
 '(elscreen-buffer-list-enabled t)
 '(elscreen-buffer-to-nickname-alist
   (quote
    (("[Ss]hell" . "shell")
     ("compilation" . "compile")
     ("-telnet" . "telnet")
     ("dict" . "OnlineDict")
     ("*WL:Message*" . "Wanderlust"))))
 '(elscreen-display-screen-number nil)
 '(elscreen-display-tab t)
 '(elscreen-mode-to-nickname-alist
   (quote
    (("^dired-mode$" lambda nil
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
     ("^gnus-" . "Gnus"))))
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(enable-local-eval t)
 '(eudc-inline-expansion-format
   (quote
    ("%s %s <%s>" firstname name email)))
 '(eudc-protocol
   (quote ldap))
 '(eudc-server "ldap.apple.com")
 '(explicit-bash-args
   (quote
    ("--noediting" "-i" "-l"))
   nil nil "
added -l so it would take things out of my .bash_profile, like (on boostpro.com) the prompt pattern.  Otherwise I get this abomination: ///bd5882fff11dd5c2900e1ce95b895e66")
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#d9d9d9")
 '(ffap-machine-p-known
   (quote accept))
 '(ffap-machine-p-local
   (quote reject))
 '(ffap-machine-p-unknown
   (quote ping))
 '(ffap-require-prefix t)
 '(flymake-gui-warnings-enabled nil)
 '(font-lock-verbose nil)
 '(g-user-email "dave@boostpro.com")
 '(gdb-delete-out-of-scope nil)
 '(gdb-many-windows t)
 '(gdb-max-frames 100 nil nil "
Increased the number of stack frames displayed from 40")
 '(gdb-show-main t)
 '(glasses-face
   (quote dwa/glasses))
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "")
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(gravatar-icon-size 50)
 '(gravatar-retrieval-program "wget -q -O '%s' '%s'" nil nil "
Requires wget, which isn't on the Mac by default.  Someday should
figure out how to use curl instead, but for now I just installed wget
from macports.")
 '(gravatar-size 48)
 '(hl-line-sticky-flag nil)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-gather-virtual-filenames
   (quote
    (ido-gather-recent-files ido-gather-git-project-files)))
 '(ido-mode
   (quote buffer)
   nil
   (ido))
 '(ido-use-filename-at-point
   (quote guess))
 '(ido-use-url-at-point t)
 '(ido-use-virtual-buffers t)
 '(imap-shell-program
   (quote
    ("/Users/dave/brew/sbin/dovecot --exec-mail imap" "ssh %s imapd" "rsh %s imapd" "ssh %g ssh %s imapd" "rsh %g rsh %s imapd")))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initsplit-customizations-alist
   (quote
    (("\\`\\(gnus\\(-home\\)?\\|message\\)-directory\\'" "preloaded-settings.el" nil t)
     ("\\`erc-nickserv-passwords\\'" "../startup/10-passwd.el" nil nil)
     ("\\`\\(dwa/\\)?\\(org\\|calendar\\|diary\\)-" "org-settings.el" nil nil)
     ("\\`\\(dwa/\\)?\\(mime\\|mm\\)-.*" "mime-settings.el" nil t)
     ("\\`\\(dwa/\\)?\\(wl\\|apel\\|flim\\|semi\\|elmo\\)-" "wl-settings.el" nil nil)
     ("\\`\\(dwa/\\)?yas\\(nippet\\)?\\(-\\|/\\)" "yasnippet-settings.el" nil nil)
     ("\\`\\(dwa/\\)?\\(nn\\|gnus-\\)" "gnus-settings.el" nil nil)
     ("\\`\\(dwa/\\)?bcc-" "byte-code-cache-settings.el" nil nil)
     ("\\`\\(haskell\\|ghc\\)" "haskell-mode-settings.el" nil nil)
     ("\\`\\(markdown\\)" "markdown-settings.el" nil t))))
 '(initsplit-pretty-print t)
 '(ipa-file-function
   (quote ipa-get-sidecar-file))
 '(irony-mode-line " Fe")
 '(ispell-program-name "aspell")
 '(kept-new-versions 6)
 '(large-file-warning-threshold nil)
 '(ldap-host-parameters-alist
   (quote
    (("ldap.apple.com" base "ou=people,o=apple computer" auth simple))))
 '(magit-backup-mode nil)
 '(magit-completing-read-function
   (quote magit-builtin-completing-read))
 '(magit-create-branch-behaviour
   (quote at-point))
 '(magit-process-popup-time 5)
 '(magit-repo-dirs
   (quote
    ("/Users/dave/src")))
 '(magit-repo-dirs-depth 3)
 '(magit-repository-directories
   (quote
    ("/Users/dave/src")))
 '(magit-repository-directories-depth 3)
 '(mailcap-download-directory "~/Downloads")
 '(mairix-file-path "~/Library/Data/Indexes")
 '(mf-display-padding-height 46 nil nil "The default value of 45 leaves the titlebar tucked up under the menu bar on OSX Lion
See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10449")
 '(mf-max-width 2560)
 '(muse-project-alist
   (quote
    (("WikiPlanner"
      ("~/plans" :default "index" :major-mode planner-mode :visit-link planner-visit-link)))))
 '(next-error-highlight t)
 '(ns-alternate-modifier
   (quote control)
   nil nil "
I'm continually pressing option when I mean control.  So, I get no
Command key.  Oh, well!  I wish I could make right-command work as
command.")
 '(ns-command-modifier
   (quote meta))
 '(ns-pop-up-frames nil)
 '(ns-right-alternate-modifier
   (quote hyper))
 '(ns-right-command-modifier
   (quote super))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (nzenburn-theme zenburn anti-zenburn-theme labburn-theme zenburn-theme magithub magit fill-column-indicator flymake-cursor alert find-file-in-git-repo zerodark-theme xmlunicode rust-mode yagist use-package twilight-bright-theme twilight-anti-bright-theme pastels-on-dark-theme message-x maxframe ham-mode grep+ gist findr elhome cus-edit+ column-enforce-mode cmake-mode boxquote)))
 '(pp^L-^L-string
   "····································✄····································
")
 '(proof-electric-terminator-enable t)
 '(proof-shell-fiddle-frames nil nil nil "John says, \"I was able to get the default \"three windows mode\"
for Proof General working reliably by customizing this\"")
 '(proof-splash-enable nil)
 '(proof-three-window-enable nil)
 '(ps-font-family
   (quote Helvetica))
 '(ps-font-info-database
   (quote
    ((Courier
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
      (avg-char-width . 4.10811)))))
 '(ps-header-lines 1)
 '(ps-left-header
   (quote
    (ps-get-buffer-name)))
 '(ps-use-face-background t)
 '(python-python-command "env python")
 '(remember-annotation-functions
   (quote
    (org-remember-annotation))
   nil nil "
As prescribed by http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner.html.  Note: buffer-file-name was checked in the default.")
 '(remember-handler-functions
   (quote
    (org-remember-handler))
   nil nil "As prescribed by http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner.html.  Note: remember-append-to-file is checked in the default.")
 '(safe-local-variable-values
   (quote
    ((auto-fill-inhibit-regexp . ".*|.*")
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
     (eval add-hook
           (quote local-write-file-hooks)
           (lambda nil
             (save-excursion
               (delete-trailing-whitespace))))
     (whitespace-style face lines-tail)
     (eval add-hook
           (quote local-write-file-hooks)
           (quote
            (lambda nil
              (save-excursion
                (delete-trailing-whitespace)))))
     (eval add-hook
           (quote before-save-hook)
           (quote delete-trailing-whitespace))
     (eval whitespace-mode)
     (eval set-face-attribute
           (quote whitespace-line)
           nil :background "red1" :foreground "yellow" :weight
           (quote bold))
     (eval set-face-attribute
           (quote whitespace-tab)
           nil :background "red1" :foreground "yellow" :weight
           (quote bold))
     (whitespace-style face trailing lines-tail)
     (whitespace-line-column . 80)
     (eval require
           (quote whitespace))
     (eval add-hook
           (quote write-file-hooks)
           (quote time-stamp))
     (test-case-name . buildbot\.test\.test_sourcestamp)
     (test-case-name . buildbot\.test\.test_changes)
     (test-case-name . buildbot\.broken_test\.test_web_status_json)
     (encoding . utf8)
     (folded-file . t))))
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(send-mail-function
   (quote smtpmail-send-it))
 '(server-mode nil)
 '(set-mark-command-repeat-pop t)
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
   (quote
    (("www.boostpro.com" 587 "" ""))))
 '(spam-report-gmane-use-article-number nil)
 '(split-height-threshold nil)
 '(swift-basic-offset 2)
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(text-mode-hook
   (quote
    (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil nil nil "
Tool bars take up valuable screen real-estate for icons whose meaning I forget")
 '(truncate-partial-width-windows nil)
 '(user-mail-address "dave@boostpro.com")
 '(vc-diff-switches "-du")
 '(vc-follow-symlinks t)
 '(vc-git-diff-switches
   (quote
    ("--find-renames=80")))
 '(version-control t)
 '(warning-suppress-types
   (quote
    ((\(undo\ discard-info\))))
   nil nil "
Without this, emacs pops up annoying warnings in, e.g., *shell* buffers
where I don't expect it to be keeping undo history anyway")
 '(weblogger-config-alist
   (quote
    (("homepage" "http://daveabrahams.com/xmlrpc.php" "dave" "" "2")
     ("techarcana" "http://techarcana.net/xmlrpc.php" "dave" "" "1")
     ("cpp-next" "http://cpp-next.com/xmlrpc.php" "dave" "" "1")
     ("ryppl" "http://ryppl.org/xmlrpc.php" "dave" "" "4")
     ("boostpro" "http://boostpro.com/xmlrpc.php" "dave" "" "1"))))
 '(weblogger-edit-entry-hook
   (quote
    ((lambda nil
       (switch-to-buffer "*weblogger-entry*")))))
 '(weblogger-edit-mode
   (quote my-weblogger-markdown-mode))
 '(weblogger-server-url "http://cpp-next.com/xmlrpc.php")
 '(weblogger-server-username "dave")
 '(wg-morph-on nil)
 '(which-function-mode t)
 '(winner-mode t)
 '(workgroups-mode t))
 

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
