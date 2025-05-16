;; == ModeLine ==
(setq-default mode-line-format
              '(" "
                (:eval
                 (propertize (buffer-name)
                             'face 'mode-line-buffer-id))))
(set-face-attribute 'mode-line nil
                    :font "JetBrainsMono Nerd Font"
                    :height 120
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :font "JetBrainsMono Nerd Font"
                    :height 120
                    :box nil)
(defun my-simple-modeline ()
  (let* ((buffer-name (buffer-name))
         (modified (if (buffer-modified-p) "+" ""))
         (readonly (if buffer-read-only "-" "")))
    (format " %s%s%s" buffer-name modified readonly)))
(setq-default mode-line-format
              '((:eval (my-simple-modeline))))

;;==  Font ==
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (set-face-attribute 'default nil :font "Consolas-11"))
 ((string-equal system-type "gnu/linux") ; GNU/Linux
  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-12"))
 ((string-equal system-type "darwin") ; macOS
  (set-face-attribute 'default nil :font "Menlo-12")))
