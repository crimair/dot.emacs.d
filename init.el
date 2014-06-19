;;;Last Change:2014/06/19 10:34.

(require 'cl)

(setq user-full-name (getenv "FULLNAME"))
(setq user-mail-address (getenv "MAILADDRESS"))
(setq system-name (getenv "COMPANY"))

;; system-type predicates
(setq 
	  emacs23-p (<= emacs-major-version 23)
	  emacs24-p (>= emacs-major-version 24)
	  darwin-p (eq system-type 'darwin)
      ns-p (featurep 'ns)
      carbon-p (eq window-system 'mac)
      linux-p (eq system-type 'gnu/linux)
;      colinux-p (when linux-p
;                  (let ((file "/proc/modules"))
;                    (and
;                     (file-readable-p file)
;                     (x->bool
;                      (with-temp-buffer
;                        (insert-file-contents file)
;                        (goto-char (point-min))
;                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p (eq system-type 'cygwin)
      nt-p (eq system-type 'windows-nt)
      meadow-p (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;;Load-path
(setq load-path (cons   "~/.emacs.d/elisp" load-path)) 

;;ELPA
;; package.el
(when emacs23-p
  (setq load-path (cons   "~/.emacs.d/elisp/u23" load-path)) 
)

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa") 
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; install if not installed
(defvar my-package-list
  '(
	auto-async-byte-compile
    auto-complete
    cperl-mode
;;微妙	crosshairs
    direx
	evil
	evil-indent-textobject
	evil-leader
	evil-matchit
	evil-nerd-commenter
	evil-numbers
	evil-paredit
	evil-tabs
    helm
    helm
    helm-ag
    helm-descbinds
    helm-ls-git
	powerline-evil
    init-loader
    open-junk-file
    recentf-ext
	quickrun
	w3m
	web-mode
    yasnippet
	))

(let ((not-installed
       (loop for package in my-package-list
             when (not (package-installed-p package))
             collect package)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))

;;u23 error package
(when emacs24-p
(defvar my-package-list2
  '(
	flycheck
	jedi
    js2-mode
    magit
    markdown-mode
    ruby-mode
	))

(let ((not-installed
       (loop for package in my-package-list2
             when (not (package-installed-p package))
             collect package)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))
)

;;init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-boring-file-regexp-list (quote ("~$" "\\.elc$")))
 '(helm-buffer-max-length 35)
 '(helm-command-prefix-key "C-x p")
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mini-default-sources (quote (helm-source-buffers-list helm-source-ls-git helm-source-recentf helm-source-buffer-not-found)))
 '(helm-truncate-lines t)
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
