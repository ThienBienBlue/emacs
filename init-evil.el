(setq evil-want-C-u-scroll t
      evil-want-fine-undo t
      evil-search-module 'evil-search
      evil-undo-system 'undo-redo
      evil-visual-state-cursor '(hollow)
      evil-split-window-below t
      evil-vsplit-window-right t)

(use-package evil
  :config
  ;; Load up the other maps into my-leader-map.
  ;; Emacs uses maps as it's primary way of loading key bindings.
  ;; E.g. my-leader-map -> project-prefix-map -> [KEY].
  (defvar setup/leader-map (make-sparse-keymap) "Keymap for `\\` leader key.")

  (define-key setup/leader-map (kbd "g") 'magit-status)
  (define-key setup/leader-map (kbd "p") project-prefix-map)
  (define-key setup/leader-map (kbd "l") setup/eglot-map)
  (define-key setup/leader-map (kbd "c") 'company-mode)

  ;; Navigation <leader>n mappings.
  (defvar setup/navigation-map (make-sparse-keymap) "Keymap for `<leader>n` prefix.")
  (define-key setup/navigation-map (kbd "f") 'ffap)
  (define-key setup/navigation-map (kbd "g") 'xref-goto-xref)
  (define-key setup/navigation-map (kbd "t") 'tab-new)
  (define-key setup/navigation-map (kbd "c") 'tab-close)
  (define-key setup/navigation-map (kbd "b") 'tab-list)

  ;; Bind maps to the leader key
  (define-key setup/leader-map (kbd "n") setup/navigation-map)

  ;; Bind evil-keys to activate my-leader-map. Use the VIM default.
  (defconst leader-key (kbd "\\") "The chosen VIM leader key.")
  (define-key evil-normal-state-map leader-key setup/leader-map)
  (define-key evil-motion-state-map leader-key setup/leader-map)

  ;; Additional Evil options goes here.
  (global-set-key (kbd "C-c z") 'evil-mode)
  (evil-mode 1))

(provide 'init-evil)
