;(set-foreground-color "#d7d7d7")
;(set-background-color "#282828")
;(set-cursor-color "#ffdd33")
;(set-face-attribute 'line-number-current-line nil :foreground "#ffdd33")
(load-theme 'tango-dark)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(setq-default line-spacing 0.1)
(setq font-name (seq-find (lambda (name) (find-font (font-spec :name name)))
                          '("Fira Mono"
                            "Fira Code"
                            "JetBrains Mono"
                            "Source Code Pro"
                            "Ubuntu Mono")))
(if font-name
    (set-face-attribute 'default nil :font font-name))

(provide 'init-themes)
