(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(global-hl-line-mode t)

(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

(provide 'init-themes)
