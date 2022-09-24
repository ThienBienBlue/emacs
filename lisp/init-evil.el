(setq evil-want-C-u-scroll t
      evil-split-window-below t
      evil-vsplit-window-right t)

(use-package evil
  :config
  ;; Load up the other maps into my-leader-map.
  ;; Emacs uses maps as it's primary way of loading key bindings.
  ;; E.g. my-leader-map -> project-prefix-map -> [KEY].
  (defvar setup/leader-map (make-sparse-keymap) "Keymap for `\\` leader key.")

  ;; Personal <leader>c mappings. `c` key to follow C-c convention for emacs.
  (defvar setup/leader-c-map (make-sparse-keymap) "Keymap for `<leader>c` prefix.")
  (define-key setup/leader-c-map (kbd "c") 'company-mode)
  (define-key setup/leader-c-map (kbd "f") 'ffap)
  (define-key setup/leader-c-map (kbd "g") 'xref-goto-xref)

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
  (define-key setup/eglot-map (kbd "k") 'eldoc-doc-buffer)
  (define-key setup/eglot-map (kbd "i") 'eglot-find-implementation)
  (define-key setup/eglot-map (kbd "c") 'eglot-code-actions)

  ;; Bind maps to the leader key
  (define-key setup/leader-map (kbd "l") setup/eglot-map)
  (define-key setup/leader-map (kbd "p") project-prefix-map)
  (define-key setup/leader-map (kbd "g") 'magit-status)
  (define-key setup/leader-map (kbd "c") setup/leader-c-map)

  ;; Bind evil-keys to activate my-leader-map. Use the VIM default.
  (defconst leader-key (kbd "\\") "The chosen VIM leader key.")
  (define-key evil-normal-state-map leader-key setup/leader-map)
  (define-key evil-motion-state-map leader-key setup/leader-map)

  ;; Additional Evil options goes here.
  (global-unset-key (kbd "C-k"))
  (global-unset-key (kbd "C-j"))
  (evil-mode 1))

(provide 'init-evil)
