(use-package lsp-mode
  :config
  (defvar lsp-leader-map (make-sparse-keymap) "Keymap for `<leader>l`.")
  (define-key lsp-leader-map (kbd "a") 'lsp)
  (define-key lsp-leader-map (kbd "f") 'lsp-format-buffer)
  (define-key lsp-leader-map (kbd "r") 'lsp-rename)
  (define-key lsp-leader-map (kbd "d") 'lsp-find-definition)
  (define-key lsp-leader-map (kbd "D") 'lsp-find-declaration)
  (define-key lsp-leader-map (kbd "t") 'lsp-find-type-definition)
  (define-key lsp-leader-map (kbd "k") 'lsp-ui-doc-glance))

(use-package lsp-ui)

(provide 'init-lsp)
