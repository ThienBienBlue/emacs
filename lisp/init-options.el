(defvar setup/default-font-size 110)

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

(set-face-attribute 'default nil :height setup/default-font-size)

(provide 'init-options)
