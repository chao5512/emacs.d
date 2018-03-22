;;; package --- Summary:
;;; Commentary:
;;; Code:
(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :config (progn
	    (defun samray/go-mode-hook ()
	      ;; Use goimports instead of go-fmt
	      (setq gofmt-command "goimports")
	      ;; Customize compile command to run go build
	      (if (not (string-match "go" compile-command))
		  (set (make-local-variable 'compile-command)
		       "go generate && go build -v && go test -v && go vet"))
	      ;; Go oracle
	      ;; (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
	      )
	    (add-hook 'go-mode-hook #'samray/go-mode-hook)
	    ))

(use-package go-eldoc
  :ensure t
  :defer t
  :config (progn
	    (add-hook 'go-mode-hook 'go-eldoc-setup)
	    ))
(provide 'init-go)
;;; init-go.el ends here
