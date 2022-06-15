(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0
      company-selection-wrap-around t)

(define-key evil-insert-state-map (kbd "C-e") 'company-abort)
(define-key evil-insert-state-map (kbd "C-y") 'company-complete-selection)

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

(global-set-key [tab] 'tab-indent-or-complete)

(provide 'init-company)
