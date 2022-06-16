(use-package company
  :hook global-company-mode
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0
        company-selection-wrap-around t)
  (define-key company-active-map (kbd "C-e") 'company-abort)
  (define-key company-active-map (kbd "C-y") 'company-complete-selection)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)

  ;; From CompanyMode's guide for Yasnippet integration.
  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))
  
  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))
  
  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))
  
  (global-set-key [tab] 'tab-indent-or-complete))

(provide 'init-company)
