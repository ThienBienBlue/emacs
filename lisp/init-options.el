(defvar setup/default-font-size 110)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(global-display-line-numbers-mode t)

(set-face-attribute 'default nil :height setup/default-font-size)

(provide 'init-options)
