(define-key project-prefix-map (kbd "s") nil)
(define-key project-prefix-map (kbd "x") nil)
(define-key project-prefix-map (kbd "xs") 'project-shell)
(define-key project-prefix-map (kbd "xe") 'project-eshell)
(define-key project-prefix-map (kbd "xx") 'project-execute-extended-command)

(use-package rg
  :config
    (define-key project-prefix-map (kbd "sr") 'rg-project))

(provide 'init-project-management)
