(setq evil-want-C-u-scroll t
	  evil-want-fine-undo t
	  evil-undo-system 'undo-redo
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
  (define-key setup/leader-c-map (kbd "c") 'corfu-mode)
  (define-key setup/leader-c-map (kbd "f") 'ffap)
  (define-key setup/leader-c-map (kbd "g") 'xref-goto-xref)
  (define-key setup/leader-c-map (kbd "t") 'load-theme)
  (define-key setup/leader-c-map (kbd "w") 'delete-trailing-whitespace)

  ;; Bind maps to the leader key
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
