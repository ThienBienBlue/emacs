(defun setup/org-mode-hook ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . setup/org-mode-hook)
  :config
  (setq org-ellipsis " ▾"))

(provide 'init-org-mode)
