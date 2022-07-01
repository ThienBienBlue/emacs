(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(use-package gruvbox-theme)

(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

(provide 'init-themes)
