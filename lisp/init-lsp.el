(use-package lsp-mode
  :config
  (setq lsp-keymap-prefix "C-c C-l")
  (defun lsp-on-attach ()
    (lsp)
    (evil-define-key 'normal 'global (kbd "<leader>lf") 'lsp-format-buffer)
    (evil-define-key 'normal 'global (kbd "<leader>lr") 'lsp-rename)
    (evil-define-key 'normal 'global (kbd "K") 'lsp-ui-doc-glance))
  (add-hook 'c-mode-hook #'lsp-on-attach)
  (add-hook 'go-mode-hook #'lsp-on-attach))

(use-package lsp-ui)

(provide 'init-lsp)
