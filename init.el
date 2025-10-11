;; Set up package.el to work with various stores.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Change the custom file to NOT write to this file.
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t
      use-package-expand-minimally t)

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

;; Prefer word wrap.
(global-display-line-numbers-mode t)
(setq-default line-move-visual nil
              word-wrap t)

;; ibuffer mode.
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
(setq-default tab-width 4
              backward-delete-char-untabify-method 'hungry)

;; Indentation related specifics options.
(defun user-manual-indent-tabs ()
  (local-set-key (kbd "TAB") 'c-indent-line-or-region)
  (setq indent-tabs-mode t
        c-syntactic-indentation nil
        indent-line-function 'c-indent-line
        backward-delete-char-untabify-method nil
        electric-indent-inhibit t))
(setq modes-that-use-manual-tabs '(c-mode-hook odin-mode-hook))

(dolist (mode modes-that-use-manual-tabs)
  (add-hook mode 'user-manual-indent-tabs))

(defun let-mode-use-spaces ()
  (setq indent-tabs-mode nil))
(setq modes-that-use-space-indents '(lisp-mode-hook emacs-lisp-mode-hook))

(dolist (mode modes-that-use-space-indents)
  (add-hook mode 'let-mode-use-spaces))

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

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c n t") 'tab-new)
(global-set-key (kbd "C-c n b") 'tab-list)
(global-set-key (kbd "C-c n c") 'tab-close)

(global-set-key (kbd "C-c y y") 'copy-from-above-command)

;; Navigation.
(global-set-key (kbd "C-c n f") 'ffap)
(global-set-key (kbd "C-c n g") 'xref-goto-xref)

;; Package Magit.
(use-package magit
  :config
  (global-set-key (kbd "C-c g") 'magit-status))

;; Package yasnippet.
(use-package yasnippet
  :config (yas-global-mode 1))

;; Package company.
(use-package company
  :requires yasnippet
  :config

  (global-set-key (kbd "C-c c") 'company-mode)

  (define-key company-active-map (kbd "C-d") 'company-abort)
  (define-key company-active-map (kbd "C-e") 'company-complete-common)
  (define-key company-active-map (kbd "C-y") 'company-complete-selection)
  (define-key company-active-map (kbd "<escape>") 'company-abort)
  (define-key company-active-map (kbd "ESC") 'company-abort)
  (define-key company-active-map (kbd "RET") 'newline)
  (define-key company-active-map (kbd "<return>") 'newline)
  (define-key company-active-map (kbd "<tab>") 'yas-next-field-or-maybe-expand)
  (define-key company-active-map (kbd "TAB") 'yas-next-field-or-maybe-expand)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.25
        company-selection-wrap-around t
        company-dabbrev-ignore-case nil
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend)
        company-transformers '(delete-consecutive-dups)))

;; Package eglot.
(use-package eglot
  :config
  ;; Eglot requires its own key mappings.
  (defvar setup/eglot-map (make-sparse-keymap) "Keymap for `<leader>l` prefix.")
  (define-key setup/eglot-map (kbd "a") 'eglot)
  (define-key setup/eglot-map (kbd "A") 'eglot-reconnect)
  (define-key setup/eglot-map (kbd "s") 'eglot-shutdown)
  (define-key setup/eglot-map (kbd "S") 'eglot-shutdown-all)
  (define-key setup/eglot-map (kbd "r") 'eglot-rename)
  (define-key setup/eglot-map (kbd "f") 'eglot-format)
  (define-key setup/eglot-map (kbd "F") 'eglot-format-buffer)
  (define-key setup/eglot-map (kbd "g") 'xref-find-definitions)
  (define-key setup/eglot-map (kbd "G") 'xref-find-references)
  (define-key setup/eglot-map (kbd "h") 'eglot-find-declaration)
  (define-key setup/eglot-map (kbd "H") 'eglot-find-typeDefinition)
  (define-key setup/eglot-map (kbd "d") 'eldoc-doc-buffer)
  (define-key setup/eglot-map (kbd "i") 'eglot-find-implementation)
  (define-key setup/eglot-map (kbd "c") 'eglot-code-actions)

  (global-set-key (kbd "C-c l") setup/eglot-map))

;; Themeing at very end to easily tell if something went wrong earlier.
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

;; Use a hollow cursor when mark is active and a region exists.
(defun th-activate-mark-init ()
  (setq cursor-type 'hollow))
(add-hook 'activate-mark-hook 'th-activate-mark-init)

(defun th-deactivate-mark-init ()
  (setq cursor-type 'box))
(add-hook 'deactivate-mark-hook 'th-deactivate-mark-init)

;; Use one of the prefered fonts.
(setq-default line-spacing 0.1)
(setq font-name (seq-find (lambda (name) (find-font (font-spec :name name)))
                          '("Consolas"
                            "Monospace 10")))
(if font-name
    (set-face-attribute 'default nil :font font-name))

;; Uncomment to use font at random.
;(setq fonts-found (seq-filter (lambda (name) (find-font (font-spec :name name)))
;                              '(
;                                "Consolas"
;                                "Monospace 10"
;                                )))
;(if (< 0 (length fonts-found))
;    (progn (setq chosen-font (seq-random-elt fonts-found))
;           (set-face-attribute 'default nil :font chosen-font)))

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
