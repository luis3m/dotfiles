
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     clojure
     scala
     haskell
     csharp
     fsharp
     java
     javascript
     elm
     markdown
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     spell-checking
     syntax-checking
     version-control
     sql
     )
   dotspacemacs-additional-packages '(xclip lsp-ui lsp-mode company-lsp lsp-treemacs helm-lsp dap-mode yasnippet-snippets use-package)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(nord
                         vscode-dark
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes/")
  (require 'ob-sql)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'xclip)
  (xclip-mode 1)

  ;; (evil-define-key search-map (kbd "d") 'lsp-find-definition)

  (use-package company
    :ensure t
    :diminish t
    :init
    (add-hook 'after-init-hook 'global-company-mode)
    (add-hook 'elm-mode-hook 'company-mode)
    :config
    (setq company-idle-delay 0.02
          company-minimum-prefix-length 2
          company-echo-delay 0
          company-dabbrev-downcase nil
          company-dabbrev-code-everywhere t
          company-dabbrev-code-modes t
          company-dabbrev-code-ignore-case t
          company-tooltip-align-annotations t
          company-transformers '(company-sort-prefer-same-case-prefix)))

  (defface orchid-face `((t (:foreground "#C586C0" :weight normal))) "Face for Orchid function"
  :group  'orchid-color)

  (add-hook 'scala-mode-hook
      (lambda ()
       (font-lock-add-keywords nil
        '(("\\<\\(sealed\\|final\\|implicit\\|override\\)\\>" .
           font-lock-keyword-face)
          ("\\<\\(match\\|case\\|if\\|else\\|while\\|for\\|yield\\)\\>" .
           'orchid-face)
          ("package \\(.*\\)" 1
           'default)
          ("import \\(.*\\)" 1
           'default)))))

  (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

  (use-package lsp-mode
    :ensure t
    :commands lsp
    :hook (elm-mode . lsp)
    :config
    (setq lsp-prefer-flymake nil
          lsp-enable-symbol-highlighting nil
          lsp-enable-snippet nil
          lsp-ui-sideline-enable nil
          lsp-ui-flycheck-enable t))

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)

  (use-package company-lsp
    :ensure t
    :commands company-lsp
    :config
    (push '(company-lsp :with company-yasnippet) company-backends)
    )

  (use-package helm-lsp :commands helm-lsp-workspace-symbol)
  (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
  (use-package dap-mode)

  (add-hook 'elm-mode-hook (lambda () (defalias 'company-elm 'company-lsp)))

  ;; (spacemacs|use-package-add-hook elm
    ;; :post-config
    ;; (spacemacs/set-leader-keys-for-major-mode 'elm-mode "z" 'lsp-find-definition))
  ;; (add-hook 'lsp-mode-hook (lambda () (spacemacs/set-leader-keys-for-major-mode 'lsp-mode ",d" 'lsp-find-definition)))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#080808" "#d70000" "#67b11d" "#875f00" "#268bd2" "#af00df" "#00ffff" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("8ecdc56c89c47c96d8b4eaada5f41a73a93fab81579bffd3c1172cca5332dd31" "62a2d4a64a482d001f93d56a76510d33625df351e084fe02c60f3de2cedfc62b" "18791009371f7f0e473c5e3dd68d749923336c019fd340131bd3cbdd345b0a75" "397976362f5e468e9d7349a8f86b43b4da0bf3abe81de462e358e12d4da5e96e" "e4d11b8b554fa7be2631cb3a5c9793b93cc8fbefedb9b9d3a2d7460af2c9e35e" "51f2b0afe54ebe23707be7a547e8b1a672f86c1898c0557970f3ee1555aa7e8b" "1e68116b5eb9edfe00b16eee71e9a1973fde36bf6d92747f91018f503a3c23fd" "3553f5b206dde773d39e119be7a99e04993651e3b4c4572ca9be814f97f4c5a6" "3ffaa70d3a70da7651d4918fe8ec468d65c8079ba3b3b2c2020ec4a56c1768b5" "922b4f73b94557c248787ff790b2416caeb856b0722bcd5f9c9e207b714afb09" "77edc6108e944489d8b3b6db827cbcce9fafcb4e6c531d62b0a8c4e28aed09e4" "3ef14da32f23f7de37ea82b1d396266c78b0fee9b261fb1fefcf2476ad6b8bfb" "a9e15a51acc209b97275a05cc46e4c6fd5a5df637ab40dbc79e35f7ce4af90bc" "f1a59dd0444f64163b8819c5f00c9e7842cea520fbeaca29c9f6b58eda9503d1" "9e5ac4193566d71ff846cd41f1daf26585305bffd1ac76a6ef2804db39b6f055" "c80c4ec8ae586c50161aca6eb885452f214e00e7ec7a77c0bc9a6c444ad7fe59" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647" "b69323309e5839676409607f91c69da2bf913914321c995f63960c3887224848" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "ed573618e4c25fa441f12cbbb786fb56d918f216ae4a895ca1c74f34a19cfe67" "53993d7dc1db7619da530eb121aaae11c57eaf2a2d6476df4652e6f0bd1df740" "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "08141ce5483bc173c3503d9e3517fca2fb3229293c87dc05d49c4f3f5625e1df" "7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" "9026dffca08a7ea237528a4abf45cd9a6008ee54fccb8592b8de43b398143b59" "16d09b8ffbc9aabb215f28ed421068f1d5363bc8aa6bdb4012dc311df4bb42bf" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (kaolin-themes doom-themes zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme yasnippet-snippets dap-mode bui tree-mode helm-lsp lsp-treemacs treemacs pfuture lsp-ui company-lsp ht lsp-mode transient reformatter lv sesman parseedn parseclj a xclip sql-indent noflet ensime sbt-mode unfill mwim helm-company helm-c-yasnippet fuzzy company-tern dash-functional tern company-statistics company-emacs-eclim company-cabal clojure-snippets auto-yasnippet ac-ispell web-beautify smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download omnisharp shut-up auto-complete magit-gitflow livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc intero htmlize hlint-refactor hindent helm-hoogle helm-gitignore haskell-snippets gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fsharp-mode company-quickhelp flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck-elm flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eclim diff-hl csharp-mode company-ghci company-ghc ghc company haskell-mode coffee-mode cmm-mode auto-dictionary clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode scala-mode elm-mode mmm-mode markdown-toc markdown-mode gh-md solarized-theme nord-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

