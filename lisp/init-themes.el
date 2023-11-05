;(set-foreground-color "#d7d7d7")
;(set-background-color "#282828")
;(set-cursor-color "#ffdd33")
;(set-face-attribute 'line-number-current-line nil :foreground "#ffdd33")
(load-theme 'tango-dark)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(setq-default line-spacing 0.1)
(setq fonts-found (seq-filter (lambda (name) (find-font (font-spec :name name)))
                              '("Fira Mono"
                                "JetBrains Mono"
                                "Source Code Pro"
                                "Cascadia Code")))
(if (< 0 (length fonts-found))
    (progn (setq chosen-font (seq-random-elt fonts-found))
           (set-face-attribute 'default nil :font chosen-font)))

(provide 'init-themes)
