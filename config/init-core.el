;; == Startup ==
(defvar my-emacs-cache-dir
  (expand-file-name "~/.cache/emacs/"))
(unless (file-directory-p my-emacs-cache-dir)
  (make-directory my-emacs-cache-dir t))

(setq auto-save-list-file-prefix
      (expand-file-name "auto-save-list/.saves-" my-emacs-cache-dir))

(when (boundp 'native-comp-eln-cache-directory)
  (setq native-comp-eln-cache-directory
        (expand-file-name "eln-cache/" my-emacs-cache-dir)))

(when (and (not (boundp 'native-comp-eln-cache-directory))
           (boundp 'native-comp-eln-load-path))
  (setq native-comp-eln-load-path
        (list (expand-file-name "eln-cache/" my-emacs-cache-dir))))

;; == Settings ==
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)
(delete-selection-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq sentence-end-double-space nil)
(global-visual-line-mode 1)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(setq gc-cons-threshold 100000000
      gc-cons-percentage 0.5)
(defvar my--original-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist my--original-file-name-handler-alist)))
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-saves/" t)))
(setq native-comp-async-report-warnings-errors nil)
