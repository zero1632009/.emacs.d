;;; Emacs Configuration
(defvar my-config-dir (expand-file-name "config/" user-emacs-directory))
(defun load-config (file)
  (load (expand-file-name file my-config-dir)))

;; Load core configuration
(load-config "init-core.el")
(load-config "init-packages.el")
(load-config "init-ui.el")
(load-config "init-keybindings.el")
(load-config "init-langs.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
