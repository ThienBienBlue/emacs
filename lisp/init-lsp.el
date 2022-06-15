(require 'lsp-mode)

(defun lsp-on-attach ()
  (lsp)
  (define-key evil-normal-state-map (kbd "K") 'lsp-ui-doc-glance))

(add-hook 'c-mode-hook #'lsp-on-attach)
(add-hook 'go-mode-hook #'lsp-on-attach)

(require 'yasnippet)
(yas-global-mode 1)


(provide 'init-lsp)
