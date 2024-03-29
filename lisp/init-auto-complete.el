(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-no-match t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.25)
  (corfu-scroll-margin 4)
  (corfu-preview-current nil)
  :config
  (defun setup/abort-into-normal-mode ()
    (interactive)
    (corfu-quit)
    (evil-normal-state))
  (evil-make-overriding-map corfu-map)
  (advice-add 'corfu--setup :after 'evil-normalize-keymaps)
  (advice-add 'corfu--teardown :after 'evil-normalize-keymaps)
  (set-face-foreground 'corfu-default "black")
  (set-face-background 'corfu-default "white")
  :bind
  (:map corfu-map
		("<escape>" . setup/abort-into-normal-mode)
        ("TAB" . nil)
        ("<tab>" . nil)
		("RET" . newline)
		("M-p" . corfu-first)
		("M-n" . corfu-last)
		("C-p" . corfu-previous)
		("C-n" . corfu-next)
		("C-y" . corfu-insert)
		("C-e" . corfu-quit)
		("C-u" . corfu-scroll-up)
		("C-d" . corfu-scroll-down)
		("C-g" . corfu-info-location)
		("C-h" . corfu-into-documentation)))

(provide 'init-auto-complete)
