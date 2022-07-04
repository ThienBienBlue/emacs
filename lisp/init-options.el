(setq display-line-numbers-type 'relative)

(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq ring-bell-function 'ignore)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)
(setq backup-by-copying nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq use-short-answers t)

(global-display-line-numbers-mode t)

;; Make buffer names unique.
(setq uniquify-buffer-name-style 'post-forward)

;; Font things.
(defconst setup/default-font-size 110)
(defconst setup/default-font "FiraCode Nerd Font Mono")
(if (find-font (font-spec :name setup/default-font))
    (set-face-attribute 'default nil
                        :font setup/default-font
                        :height setup/default-font-size)
  (set-face-attribute 'default nil
                      :height setup/default-font-size))

;; Matching Parentheses.
(setq show-paren-delay 0)
(show-paren-mode t)

;; CC options.
(setq-default c-default-style "linux"
              c-basic-offset 4
              tab-width 4)

;; Emacs performace options.
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(provide 'init-options)
