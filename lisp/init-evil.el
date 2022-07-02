(setq evil-want-C-u-scroll t
      evil-insert-state-cursor 'box
      evil-split-window-below t
      evil-vsplit-window-right t)

(use-package evil

  :config
  ;; Load up the other maps into my-leader-map.
  ;; Emacs uses maps as it's primary way of loading key bindings.
  ;; E.g. my-leader-map -> project-prefix-map -> [KEY].
  (defvar my-leader-map (make-sparse-keymap) "Keymap for `\\` leader key.")
  (define-key my-leader-map (kbd "l") lsp-leader-map)
  (define-key my-leader-map (kbd "p") project-prefix-map)

  ;; Bind evil-keys to activate my-leader-map. Use the VIM default.
  (defconst leader-key (kbd "\\") "The chosen VIM leader key.")
  (define-key evil-normal-state-map leader-key my-leader-map)
  (define-key evil-motion-state-map leader-key my-leader-map)

  ;; Additional Evil options goes here.
  (global-unset-key (kbd "C-k"))
  (global-unset-key (kbd "C-j"))
  (evil-mode 1))

(provide 'init-evil)
