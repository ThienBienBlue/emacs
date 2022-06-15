(setq-default indent-tabs-mode nil)
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))
(smart-tabs-insinuate 'c 'javascript)

(provide 'init-smart-tabs)
