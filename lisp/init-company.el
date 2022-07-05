(use-package company
  :requires yasnippet
  :hook global-company-mode
  :config
  (defun setup/company-abort-and-evil-normal ()
    (interactive)
    (company-abort)
    (evil-normal-state))
  (define-key company-active-map (kbd "C-d") 'company-abort)
  (define-key company-active-map (kbd "C-e") 'company-complete-common)
  (define-key company-active-map (kbd "C-y") 'company-complete-selection)
  (define-key company-active-map (kbd "<escape>") 'setup/company-abort-and-evil-normal)
  (define-key company-active-map (kbd "ESC") 'setup/company-abort-and-evil-normal)
  (define-key company-active-map (kbd "RET") 'newline)
  (define-key company-active-map (kbd "<return>") 'newline)
  (define-key company-active-map (kbd "<tab>") 'yas-next-field-or-maybe-expand)
  (define-key company-active-map (kbd "TAB") 'yas-next-field-or-maybe-expand)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0
        company-selection-wrap-around t
        company-dabbrev-ignore-case nil
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend)
        company-backends '((company-capf
                            company-yasnippet
                            company-dabbrev-code))
        company-transformers '(delete-consecutive-dups)))

(provide 'init-company)
