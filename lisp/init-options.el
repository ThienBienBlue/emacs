(defvar setup/default-font-size 110)

(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 80)))
(setq display-line-numbers-type 'relative)

(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(global-display-line-numbers-mode t)
(global-hl-line-mode +1)

(set-face-attribute 'default nil
                    :font "FiraCode Nerd Font Mono"
                    :height setup/default-font-size
                    :slant 'normal
                    :underline nil)
(set-face-italic 'default nil)

;; CC options
(setq-default c-default-style "linux"
              c-basic-offset 4
              tab-width 4)

(provide 'init-options)