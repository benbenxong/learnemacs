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

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)

(setq dired-dwim-target t)
(provide 'init-better-defaults)

