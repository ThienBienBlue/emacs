(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;(set-foreground-color "#d7d7d7")
;(set-background-color "#282828")
;(set-cursor-color "#ffdd33")
;(set-face-attribute 'line-number-current-line nil :foreground "#ffdd33")
(load-theme 'tango-dark)

(setq font-name (seq-find (lambda (name) (find-font (font-spec :name name)))
                          '("Fira Mono"
                            "Fira Code"
                            "JetBrains Mono"
                            "Source Code Pro"
                            "Ubuntu Mono")))
(if font-name
    (set-face-attribute 'default nil :height 110 :font font-name)
  (set-face-attribute 'default nil :height 110))

(provide 'init-themes)
