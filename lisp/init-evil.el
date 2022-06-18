(setq evil-want-C-u-scroll t
      evil-insert-state-cursor 'box
      evil-split-window-below t
      evil-vsplit-window-right t)

(use-package evil
  :config
  (evil-set-leader 'normal (kbd "\\"))
  (evil-mode 1))

(provide 'init-evil)
