;;; package --- Summary -*- lexical-binding: t -*-
;;; code:
;;; Commentary:

(use-package paredit
  :ensure t
  :defer t
  :init (progn
	  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
	  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
	  (add-hook 'scheme-mode-hook 'enable-paredit-mode)
	  )
  :diminish paredit-mode
  )
(provide 'init-elisp)

;;; init-elisp.el ends here
