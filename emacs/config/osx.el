(use-package exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-arguments '("-c"))
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-initialize))

(use-package osx-clipboard
  :ensure t
  :diminish osx-clipboard-mode
  :init
  (osx-clipboard-mode))
