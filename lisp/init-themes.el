(load-theme 'tango-dark)

(defun extract-rgb (rgb hex)
  "Converts string #rrggbb in hex to corresponding rr/gg/bb int."
  (defun hex-to-int (hex) (string-to-number hex 16))
  (let ((hex-str (cond ((eq :r rgb) (substring hex 1 3))
                       ((eq :g rgb) (substring hex 3 5))
                       ((eq :b rgb) (substring hex 5 7)))))
    (hex-to-int hex-str)))

(defun color-to-hex (color)
  "Converts 'black' to #FFFFFF, #FFFFFF to #FFFFFF"
  (let ((hex-16-channel (color-values color)))
    (let ((r (nth 0 hex-16-channel))
          (g (nth 1 hex-16-channel))
          (b (nth 2 hex-16-channel)))
      (format "#%X%X%X" (/ r 256) (/ g 256) (/ b 256)))))

(defun face-att-hex (face att)
  (color-to-hex (face-attribute face att)))

(defun add-hex (add-sub hex1 hex2)
  "Given #aabbcc and #ddeeff in hex, return #{aa+dd}{bb+ee}{cc+ff}"
  (defun capped (hex)
    (cond ((< hex 0) 0)
          ((< 255 hex) 255)
          (t hex)))
  (defun op (a b)
    (capped (cond ((eq :add add-sub) (+ a b))
                  (t (- a b)))))
  (let ((r1 (extract-rgb :r hex1))
        (g1 (extract-rgb :g hex1))
        (b1 (extract-rgb :b hex1))
        (r2 (extract-rgb :r hex2))
        (g2 (extract-rgb :g hex2))
        (b2 (extract-rgb :b hex2)))
    (format "#%X%X%X"
            (op r1 r2)
            (op g1 g2)
            (op b1 b2))))

(let ((theme-darkmode (eq 'dark (frame-parameter nil 'background-mode)))
      (whitespace-foreground-unadjusted (face-att-hex 'default :background))
      (dim-text-foreground-unadjusted (face-att-hex 'shadow :foreground)))
  (let ((whitespace-foreground (add-hex (if theme-darkmode :add :sub)
                                        whitespace-foreground-unadjusted
                                        "#101010"))
        (dim-text-foreground (add-hex (if theme-darkmode :sub :add)
                                      dim-text-foreground-unadjusted
                                      "#505050")))
    (set-face-attribute 'line-number nil :foreground dim-text-foreground)
    (set-face-attribute 'line-number-current-line nil :foreground dim-text-foreground-unadjusted)
    (defface unobtrusive-whitespace
      `((t :foreground ,whitespace-foreground))
      "Barely visible unless highlighting.")))

(setq whitespace-style '(face tabs spaces tab-mark space-mark)
      whitespace-tab 'unobtrusive-whitespace
      whitespace-space 'unobtrusive-whitespace
      whitespace-hspace 'unobtrusive-whitespace)

(global-whitespace-mode +1)

(setq-default line-spacing 0.1)
(setq fonts-found (seq-filter (lambda (name) (find-font (font-spec :name name)))
                              '(
                                "Monospace"
                                ;"FiraMono"
                                ;"Source Code Pro"
                                )))
(if (< 0 (length fonts-found))
    (progn (setq chosen-font (seq-random-elt fonts-found))
           (set-face-attribute 'default nil :font chosen-font)))

;; Tab bar face.
(set-face-attribute 'tab-bar-tab nil
                    :box nil)
(set-face-attribute 'tab-bar nil
                    :box nil
                    :foreground (face-attribute 'default :foreground)
                    :background (face-attribute 'default :background))

;; Mode line face.
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(set-face-attribute 'region nil :foreground (face-attribute 'default :foreground))

(provide 'init-themes)
