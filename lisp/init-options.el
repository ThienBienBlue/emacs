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

(setq dired-kill-when-opening-new-dired-buffer t
      dired-listing-switches "-agho --group-directories-first")
(setq use-short-answers t)

(global-display-line-numbers-mode t)
(global-auto-revert-mode t)

;; Indentation related options.
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq c-syntactic-indentation nil)

;; Fuzzy completion options
(setq completion-styles '(initials partial-completion flex))
(fido-mode)

;; Make buffer names unique.
(setq uniquify-buffer-name-style 'post-forward)

(set-face-attribute 'default nil :height 110)

;; Matching Parentheses.
(setq show-paren-delay 0)
(show-paren-mode t)

;; CC options.
(setq-default c-default-style "linux"
              c-basic-offset 4
              tab-width 4)

(provide 'init-options)
