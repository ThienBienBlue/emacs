(use-package projectile
  :config
  (projectile-mode t)
  (evil-define-key 'normal 'global (kbd "<leader>f") 'projectile-command-map))

(provide 'init-projectile)
