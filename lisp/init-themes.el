(load-theme 'tango-dark)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(set-face-attribute 'region nil :foreground (face-attribute 'default :foreground))

(defface unobtrusive-whitespace
  '((t :foreground "#1e2426"))
  "Barely visible unless highlighting.")
(setq whitespace-style '(face tabs spaces tab-mark space-mark)
      whitespace-tab 'unobtrusive-whitespace
      whitespace-space 'unobtrusive-whitespace
      whitespace-hspace 'unobtrusive-whitespace)

(global-whitespace-mode +1)

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
