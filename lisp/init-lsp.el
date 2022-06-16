(use-package lsp-mode
  :config
  (setq lsp-keymap-prefix "C-c C-l")
  (defun lsp-on-attach ()
    (lsp)
    (define-key evil-normal-state-map (kbd "K") 'lsp-ui-doc-glance))
  (add-hook 'c-mode-hook #'lsp-on-attach)
  (add-hook 'go-mode-hook #'lsp-on-attach))

(use-package lsp-ui)

(provide 'init-lsp)
