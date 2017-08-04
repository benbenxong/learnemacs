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

(electric-indent-mode 1)

(setq recentf-max-menu-items 25)

(delete-selection-mode t)

(load-theme 'monokai t)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'popwin)
(popwin-mode 1)

(setq-default abbrev-mode t)
