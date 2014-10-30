;initilize
(setq auto-mode-alist (cons '("\\.elc?$\\'" . emacs-lisp-mode) auto-mode-alist))
(add-hook 'emacs-lisp-mode-hook
  '(lambda ()
   (font-lock-mode t)
   (setq indent-tabs-mode nil)    ; インデントはspace
