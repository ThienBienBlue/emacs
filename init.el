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

;; Allow for accessing other init files. These files should use `use-package`.
(defvar setup/config-dir (concat user-emacs-directory "lisp"))
(push setup/config-dir load-path)

(require 'init-options)
(require 'init-org-mode)
(require 'init-fuzzy-completion)
(require 'init-magit)
(require 'init-languages)
(require 'init-project-management)
(require 'init-snippet)
(require 'init-company)
(require 'init-lsp)
(require 'init-evil)
(require 'init-themes)
