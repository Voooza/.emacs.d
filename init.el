(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(custom-enabled-themes (quote (tango-dark)))
 '(nrepl-sync-request-timeout 60)
 '(org-agenda-files
   (quote
    ("c:/Users/vanisp/org/java_upgrade.org" "c:/Users/vanisp/org/bars.org" "c:/Users/vanisp/org/cobol_rewrite.org" "c:/Users/vanisp/org/general.org")))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (magit counsel swiper multi-term paredit-everywhere paredit ac-cider cider clojure-mode projectile better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; adjusting path for cygwin integration
(setenv "PATH" (concat  "C:\\cygwin64\\bin;" (getenv "PATH")))
;;(setq exec-path (append exec-path '("/sw/bin")))

(setq system-time-locale "C")
(setq org-todo-keywords
  '((sequence "TODO(t)" "WIP(w!)" "FEEDBACK(f!)" "|" "DELEGATED(d!)" "DONE(D!)" "CANCELED(c!)")))


(add-hook 'prog-mode-hook #'custom-prog-hook)

(defun custom-prog-hook ()
  (linum-mode 1)
  (auto-complete-mode 1)
  (paredit-mode 1)
  )

;;(require 'move-lines)
;;(move-lines-binding)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(defvar my-packages '(better-defaults
		      projectile
		      clojure-mode
		      cider
		      ac-cider
		      paredit
		      paredit-everywhere
		      multi-term
                      swiper
		      counsel
                      magit
                      solarized-theme))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(setq org-startup-folded nil)


;; solarized theme settings
;; make the modeline high contrast
(setq solarized-use-variable-pitch nil)
(setq solarized-high-contrast-mode-line t)
;; Use less bolding
(setq solarized-use-less-bold t)
;; Use more italics
;;(setq solarized-use-more-italic t)
;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)
;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)
;; Avoid all font-size changes
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)

(load-theme 'solarized-dark t)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(setq inhibit-startup-message t)   
(find-file "c:/Users/vanisp/org/start.org")


;; projectile settings
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
