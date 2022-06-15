(setq lsp-keymap-prefix "s-l")

(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

(require 'yasnippet)
(yas-global-mode 1)

(provide 'init-lsp)
