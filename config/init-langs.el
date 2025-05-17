;; == LSP Configuration ==
(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil)
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-diagnostics-enable nil)
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold (* 100 1024 1024))

;; == Languages ==
(use-package lsp-pyright
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))
