(setq completion-styles '(initials partial-completion flex))
(setq completion-cycle-threshold 10)

(condition-case err
    (fido-vertical-mode)
  (error (fido-mode)))

(provide 'init-fuzzy-completion)
