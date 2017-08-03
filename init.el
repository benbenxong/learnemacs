;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(setq ring-bell-function 'ignore)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)

(global-auto-revert-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-indent-mode 1)
(setq inhibit-splash-screen t)
;- turn off tool-bar
;- turn off scroll-bar
;- show linum-mode
;- turn off splash screen
;- save your config
;- define a function to quickly open your config file.

(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(setq-default cursor-type 'bar)

  (require 'org)
  (setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

 (delete-selection-mode t)

(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

 (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(load-theme 'monokai t)

(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Microsoft YaHei" :size 12)))

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(setq make-backup-files nil)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq auto-save-default nil)

(require 'popwin)
(popwin-mode 1)

  (setq-default abbrev-mode t)

  (define-abbrev-table 'global-abbrev-table '(
                                              ;; signature
                                              ("8zl" "zilongshanren")
                                              ;; microsoft
					      ("8ms" "Mircsoft")
                                              
                                              ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 3)
 '(custom-safe-themes
   (quote
    ("9492cf1ac00c8a1f7130a867a97404dfeb6727801c6b2b40b853b91543f7af67" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
