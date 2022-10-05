(use-package magit
  :config
  (define-key setup/leader-map (kbd "g") 'magit-status))

(provide 'init-magit)
