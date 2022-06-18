(use-package lsp-mode
  :config
  (setq lsp-keymap-prefix "C-c C-l")
  (evil-define-key 'normal 'global (kbd "<leader>la") 'lsp)
  (evil-define-key 'normal 'global (kbd "<leader>lf") 'lsp-format-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>lr") 'lsp-rename)
  (evil-define-key 'normal 'global (kbd "K") 'lsp-ui-doc-glance))

(use-package lsp-ui)

(provide 'init-lsp)
