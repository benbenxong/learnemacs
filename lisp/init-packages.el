  (require 'cl)

  (when (>= emacs-major-version 24)
    ;;(require 'package)
    ;;(package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
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
				   web-mode
				   js2-refactor
				   expand-region
				   iedit
				   org-pomodoro
				   reveal-in-osx-finder
				   exec-path-from-shell
				   helm-ag
				   flycheck
				   auto-yasnippet
				   evil
				   evil-leader
				   window-numbering
				   evil-surround
				   evil-nerd-commenter
				   which-key
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
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; config for web mode
(defun my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
    (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
    )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
    (interactive)
    ;; web development
    (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
        (progn
          (setq js-indent-level (if (= js-indent-level 2) 4 2))
          (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

    (if (eq major-mode 'web-mode)
        (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
               (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
               (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
    (if (eq major-mode 'css-mode)
        (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

    (setq indent-tabs-mode nil))


(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
(global-set-key (kbd "C-c s i") 'counsel-imenu)
;; config for js2-factor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(defun js2-imenu-make-index ()
        (interactive)
        (save-excursion
          ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
          (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                     ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                     ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                     ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
                (lambda ()
                  (setq imenu-create-index-function 'js2-imenu-make-index)))

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c s e") 'iedit-mode) ;;def: "C-;""
(require 'org-pomodoro)

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(add-hook 'js2-mode-hook 'flycheck-mode)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal
  )


  (add-hook 'occur-mode-hook
            (lambda ()
              (evil-add-hjkl-bindings occur-mode-map 'emacs
                (kbd "/")       'evil-search-forward
                (kbd "n")       'evil-search-next
                (kbd "N")       'evil-search-previous
                (kbd "C-d")     'evil-scroll-down
                (kbd "C-u")     'evil-scroll-up
                )))
(window-numbering-mode 1)
;;(require 'powerline)
;;(powerline-default-theme)
(require 'evil-surround)
(global-evil-surround-mode 1)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(evilnc-default-hotkeys)

(which-key-mode)
(provide 'init-packages)
