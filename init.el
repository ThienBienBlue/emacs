;; Set up package.el to work with various stores.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Packages to install.
(defconst setup/packages '(evil gruvbox-theme tree-sitter tree-sitter-langs))
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

;; End of init file. Anything beyond is automatically added by some other force.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
