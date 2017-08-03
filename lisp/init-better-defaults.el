(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode t)

(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
                                              ("8zl" "zilongshanren")
                                              ;; microsoft
					      ("8ms" "Mircsoft")
                                              
                                              ))

(setq make-backup-files nil)
(setq auto-save-default nil)



(recentf-mode 1)			

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(provide 'init-better-defaults)
