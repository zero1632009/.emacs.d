;; == ModeLine ==
(setq-default mode-line-format
              '(" "
                (:eval
                 (propertize (buffer-name)
                             'face 'mode-line-buffer-id))))
(set-face-attribute 'mode-line nil
                    :font "JetBrains Mono Nerd Font"
                    :height 110
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :font "JetBrains Mono Nerd Font"
                    :height 110
                    :box nil)
(defun my-simple-modeline ()
  (let* ((buffer-name (buffer-name))
         (modified (if (buffer-modified-p) "+" ""))
         (readonly (if buffer-read-only "-" "")))
    (format " %s%s%s" buffer-name modified readonly)))
(setq-default mode-line-format
              '((:eval (my-simple-modeline))))

;;==  Font ==
(set-face-attribute 'default nil :font "JetBrains Mono Nerd Font" :height 110)
