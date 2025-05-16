;;; Emacs Configuration
(defvar my-config-dir (expand-file-name "config/" user-emacs-directory))
(defun load-config (file)
  (load (expand-file-name file my-config-dir)))

;; Load core configuration
(load-config "early-init.el")
(load-config "init-core.el")
(load-config "init-packages.el")
(load-config "init-ui.el")
(load-config "init-keybindings.el")
(load-config "init-langs.el")
