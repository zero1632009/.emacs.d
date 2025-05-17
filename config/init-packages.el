;; == Package Management ==

;; == Setup Package Management ==
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(setq package-enable-at-startup nil)
(setq package-native-compile t)
(unless package--initialized
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-verbose nil
      use-package-compute-statistics t)
(provide 'init-packages)

;; == Package ==
;; Themes
(use-package ef-themes
  :init
  (load-theme 'ef-bio :no-confirm))

;; Keybinding
(use-package which-key
  :defer nil
  :diminish
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5
        which-key-popup-type 'side-window
        which-key-max-description-length 32
        which-key-separator " → "))
(provide 'init-which-key)

;; Icons
(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t
  :commands (all-the-icons-install-fonts))

;; File Management
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)
(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)
(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
(use-package treemacs-persp
  :after (treemacs persp-mode)
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))
(use-package treemacs-tab-bar
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;; File Search
(use-package fzf)
(use-package rg)

;; Completion
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-minimum-prefix-length 1))

;; LSP
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp))
  :commands lsp
  :commands (lsp lsp-deferred)
  :custom
  (lsp-prefer-capf t))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-delay 0.5))
