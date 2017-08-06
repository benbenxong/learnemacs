  (require 'cl)

  (when (>= emacs-major-version 24)
    ;;(require 'package)
  ;;  (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )


  ;;add whatever packages you want here
  (defvar zilongshanren/packages '(
				   company
				   monokai-theme
				   hungry-delete
				   swiper
				   counsel
				   smartparens
				   js2-mode
				   nodejs-repl
				   popwin
                )  "Default packages")
(setq package-selected-packages zilongshanren/packages)

  (defun zilongshanren/packages-installed-p ()
    (loop for pkg in zilongshanren/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

  (unless (zilongshanren/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg zilongshanren/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

(global-company-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(require 'hungry-delete)
(global-hungry-delete-mode)

(smartparens-global-mode t)
;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(provide 'init-packages)
