(use-package rg)

(use-package projectile
  :config
  (projectile-mode t)
  (evil-define-key '(normal motion) 'global (kbd "<leader>p") 'projectile-command-map))

(provide 'init-projectile)
