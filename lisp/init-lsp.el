(use-package eglot
  :config
  ;; Eglot requires its own key mappings.
  (defvar setup/eglot-map (make-sparse-keymap) "Keymap for `<leader>l` prefix.")
  (define-key setup/eglot-map (kbd "a") 'eglot)
  (define-key setup/eglot-map (kbd "A") 'eglot-reconnect)
  (define-key setup/eglot-map (kbd "s") 'eglot-shutdown)
  (define-key setup/eglot-map (kbd "S") 'eglot-shutdown-all)
  (define-key setup/eglot-map (kbd "r") 'eglot-rename)
  (define-key setup/eglot-map (kbd "f") 'eglot-format)
  (define-key setup/eglot-map (kbd "F") 'eglot-format-buffer)
  (define-key setup/eglot-map (kbd "g") 'xref-find-definitions)
  (define-key setup/eglot-map (kbd "G") 'xref-find-references)
  (define-key setup/eglot-map (kbd "h") 'eglot-find-declaration)
  (define-key setup/eglot-map (kbd "H") 'eglot-find-typeDefinition)
  (define-key setup/eglot-map (kbd "d") 'eldoc-doc-buffer)
  (define-key setup/eglot-map (kbd "i") 'eglot-find-implementation)
  (define-key setup/eglot-map (kbd "c") 'eglot-code-actions)

  (define-key setup/leader-map (kbd "l") setup/eglot-map))

(provide 'init-lsp)
