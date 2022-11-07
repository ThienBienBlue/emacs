(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(set-foreground-color "#e4e4ef")
(set-background-color "#181818")
(set-cursor-color "#ffdd33")
(set-face-attribute 'line-number-current-line nil
					:foreground
					(face-attribute 'default :background)
					:background
					(face-attribute 'default :foreground))

(provide 'init-themes)
