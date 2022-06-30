(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t))

(provide 'init-themes)
