(use-package evil
  :config
  (setq evil-want-C-u-scroll t
        evil-insert-state-cursor 'box)
  (require 'evil)
  (evil-mode 1))

(provide 'init-evil)
