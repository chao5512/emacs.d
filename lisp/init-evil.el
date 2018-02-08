;;; package --- Summary
;;; Code:
;;; Commentary:
;;; esc quits

(use-package evil
  :ensure t
  :demand t
  :init (progn
	  (setq evil-want-C-u-scroll t)
	  )
  :config
  (progn
    (evil-mode t)
    (evil-set-initial-state 'calendar-mode 'emacs)
    (evil-set-initial-state 'pdf-view-mode 'emacs)
    (evil-set-initial-state 'dired-mode 'emacs)
    (evil-set-initial-state 'imenu-list-major-mode 'emacs)
    (evil-set-initial-state 'artist-mode 'emacs)
    (evil-set-initial-state 'eshell-mode 'insert)
    (evil-set-initial-state 'term-mode 'emacs)
    ))

(use-package evil-surround
  :ensure t
  :commands evil-mode
  :init
  (global-evil-surround-mode t)
  )

(use-package evil-nerd-commenter
  :commands (evilnc-comment-operator)
  :ensure t
  )

;; evil keybinding in magit
;; (use-package evil-magit
;;   :ensure t
;;   :after magit
;;   )

;; Vim matchit ported into Emacs
(use-package evil-matchit
  :commands evil-mode
  :ensure t
  :init (global-evil-matchit-mode 1))

(use-package evil-mc
  :ensure t
  :diminish evil-mc-mode
  :commands evil-mode
  :init
  (global-evil-mc-mode t)
  :config (progn
	    (evil-define-key 'normal evil-mc-key-map (kbd "C-n") 'next-line)
	    (evil-define-key 'normal evil-mc-key-map (kbd "C-p") 'previous-line)
	    )
  )


;;; refactor variable within a function
;;; http://blog.binchen.org/posts/how-to-refactorrename-a-variable-name-in-a-function-efficiently.html
(defun samray/evilcvn-change-symbol-in-defun ()
  "Mark the region in defun (definition of function) and use string replacing
UI in evil-mode to replace the symbol under cursor"
  (interactive)
  (let ((old (thing-at-point 'symbol)))
    (mark-defun)
    (unless (evil-visual-state-p)
      (evil-visual-state))
    (evil-ex (concat "'<,'>s/" (if (= 0 (length old)) "" "\<\(") old (if (= 0 (length old)) "" "\)\>/"))))
  )
;;; artist-mode doesn't work fine with evil-mode ,so do this trick
(defun artist-mode-toggle-emacs-state ()
  (if artist-mode
      (evil-emacs-state)
    (evil-exit-emacs-state)))
(unless (eq evil-state 'emacs)
  (add-hook 'artist-mode-hook 'artist-mode-toggle-emacs-state))

;; (define-key evil-insert-state-map [escape] 'evil-normal-state)
;; (evilnc-default-hotkeys)
(provide 'init-evil)
;;; init-evil.el ends here
