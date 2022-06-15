;; Set up package.el to work with various stores.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Packages to install.
(defconst setup/packages
  '(evil
    tree-sitter
    tree-sitter-langs
    go-mode
    lsp-mode
    lsp-ui
    company
    flycheck
    gruvbox-theme))
(defvar setup/missing-packages '())

(dolist (package setup/packages)
  (unless (package-installed-p package)
    (add-to-list 'setup/missing-packages package)))
(when setup/missing-packages
  (package-refresh-contents)
  (dolist (package setup/packages)
    (package-install package))
  (setq setup/missing-packages '()))

(defvar setup/config-dir (concat user-emacs-directory "lisp"))
(push setup/config-dir load-path)

(require 'init-options)
(require 'init-evil)
(require 'init-gruvbox)
(require 'init-tree-sitter)
(require 'init-lsp)
(require 'init-company)
(require 'init-flycheck)

;; End of init file. Anything beyond is automatically added by some other force.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   '("6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
