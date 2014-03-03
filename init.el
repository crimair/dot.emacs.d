;;;Last Change:2014/03/03 13:36.

(require 'cl)

(setq user-full-name (getenv "FULLNAME"))
(setq user-mail-address (getenv "MAILADDRESS"))
(setq system-name (getenv "COMPANY"))

;;Load-path
(setq load-path (cons   "~/.emacs.d/elisp" load-path)) 

;;ELPA
;; package.el
;;(setq load-path (cons   "~/.emacs.d/elisp/u23" load-path)) 

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
    direx
	evil
	evil-indent-textobject
	evil-leader
	evil-matchit
	evil-nerd-commenter
	evil-numbers
	evil-paredit
	evil-tabs
	flycheck
    helm
    helm-ag
    helm-descbinds
    helm-ls-git
    init-loader
	jedi
    js2-mode
    magit
    markdown-mode
    open-junk-file
    recentf-ext
    ruby-mode
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

;; system-type predicates
(setq darwin-p (eq system-type 'darwin)
      ns-p (featurep 'ns)
      carbon-p (eq window-system 'mac)
      linux-p (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p (eq system-type 'cygwin)
      nt-p (eq system-type 'windows-nt)
      meadow-p (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;;init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
