(use-package company
  :requires yasnippet
  :hook global-company-mode
  :config
  (define-key company-active-map (kbd "C-e") 'company-abort)
  (define-key company-active-map (kbd "C-y") 'company-complete-selection)
  (define-key company-active-map (kbd "<return>") 'company-complete-common)
  (define-key company-active-map (kbd "RET") 'company-complete-common)
  (define-key company-active-map (kbd "<tab>") 'yas-next-field-or-maybe-expand)
  (define-key company-active-map (kbd "TAB") 'yas-next-field-or-maybe-expand)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0
        company-selection-wrap-around t))

(provide 'init-company)
