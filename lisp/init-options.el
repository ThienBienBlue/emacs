(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 80)))
(setq display-line-numbers-type 'relative)

(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq ring-bell-function 'ignore)
(scroll-bar-mode -1)

(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(global-display-line-numbers-mode t)
(global-hl-line-mode +1)

;; Font things
(defconst setup/default-font-size 110)
(defconst setup/default-font "FiraCode Nerd Font Mono")
(if (find-font (font-spec :name setup/default-font))
  (set-face-attribute 'default nil
                      :font setup/default-font
                      :height setup/default-font-size)
  (set-face-attribute 'default nil
                      :height setup/default-font-size))

;; Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Matching Parentheses
(setq show-paren-delay 0)
(show-paren-mode t)

;; CC options
(setq-default c-default-style "linux"
              c-basic-offset 4
              tab-width 4)

(provide 'init-options)
