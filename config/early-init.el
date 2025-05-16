;; == Emacs Configuration ==

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
