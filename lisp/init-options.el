;; Options affecting things immediately on screen.
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(setq ring-bell-function 'ignore)
(setq scroll-step 1)
(setq scroll-error-top-bottom t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode t)
(setq-default line-move-visual nil)
(setq-default word-wrap t)

(global-set-key [remap list-buffers] 'ibuffer)
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)

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
(setq-default backward-delete-char-untabify-method nil
              indent-tabs-mode nil
              tab-width 4)

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

;; Fuzzy completion options.
(fido-mode)
(setq completion-styles '(initials partial-completion flex))

;; I-search options.
(setq isearch-lazy-count t)

;; Make buffer names unique.
(setq-default uniquify-buffer-name-style 'post-forward)

;; Matching Parentheses.
(setq show-paren-delay 0)
(show-paren-mode t)

;; CC options.
(setq-default c-default-style "linux"
              c-basic-offset 4)

;; Window management.
(tab-bar-mode t)

(global-set-key (kbd "M-o") 'tab-next)  ; Same as `C-x o'.
(global-set-key (kbd "C-c n t") 'tab-new)
(global-set-key (kbd "C-c n b") 'tab-list)
(global-set-key (kbd "C-c n c") 'tab-close)

(global-set-key (kbd "C-c v v") 'set-mark-command)
(global-set-key (kbd "C-c V") 'rectangle-mark-mode)
(global-set-key (kbd "C-c C-v") 'rectangle-mark-mode)
(global-set-key (kbd "C-c v g") 'mark-whole-buffer)

(global-set-key (kbd "C-c y y") 'copy-from-above-command)

;; Navigation.
(global-set-key (kbd "C-c n f") 'ffap)
(global-set-key (kbd "C-c n g") 'xref-goto-xref)

(provide 'init-options)
