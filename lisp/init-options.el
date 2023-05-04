;; Options affecting things immediately on screen.
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(setq ring-bell-function 'ignore)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tab-bar-mode t)
(add-to-list 'tab-bar-format #'tab-bar-format-menu-bar)

(global-display-line-numbers-mode t)
(global-set-key [remap list-buffers] 'ibuffer)
(global-auto-revert-mode t)

;; File related options.
(setq make-backup-files nil)
(setq backup-by-copying nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq dired-kill-when-opening-new-dired-buffer t
      dired-listing-switches "-agho --group-directories-first")
(setq use-short-answers t)

;; Indentation related global options.
(setq backward-delete-char-untabify-method nil)

;; Indentation related specifics options.
(defun let-mode-handle-indentation ()
  (setq indent-tabs-mode nil)
  (setq backward-delete-char-untabify-method 'hungry))

(setq modes-that-handle-indentation '(c-mode-common-hook
                                      lisp-mode-hook
                                      emacs-lisp-mode-hook))
(dolist (mode modes-that-handle-indentation)
  (add-hook mode 'let-mode-handle-indentation))

(add-hook 'c-mode-hook
          (lambda () (setq indent-tabs-mode t)
            (setq backward-delete-char-untabify-method nil)
            (setq c-syntactic-indentation nil)
            (setq electric-indent-inhibit t)))

;; Fuzzy completion options
(setq completion-styles '(initials partial-completion flex))
(fido-mode)

;; Make buffer names unique.
(setq uniquify-buffer-name-style 'post-forward)

;; Matching Parentheses.
(setq show-paren-delay 0)
(show-paren-mode t)

;; CC options.
(setq-default c-default-style "linux"
              c-basic-offset 4
              tab-width 4)

(provide 'init-options)
