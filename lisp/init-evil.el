(setq evil-want-C-u-scroll t
      evil-insert-state-cursor 'box)

(use-package evil
  :config
  (require 'evil)
  (evil-mode 1))

(provide 'init-evil)
