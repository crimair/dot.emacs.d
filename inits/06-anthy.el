;nnで”ん”にする
(setq quail-japanese-use-double-n t)

(when linux-p
;;;  (push "/usr/share/emacs/site-lisp/anthy/" load-path)
;;  (push "~/.emacs.d/elisp/linux_only/anthy/" load-path)
;;  (load-library "anthy")
;;  ;;anthy
;;  ;;leim load
;;  (register-input-method "japanese-anthy" "Japanese"
;;						 'anthy-leim-activate "[anthy]"
;;						 "Anthy Kana Kanji conversion system")
;;  
;;  (autoload 'anthy-leim-activate "anthy")
;;
;;(defun evil-ime-clear ()
;      (interactive)
;;	  (anthy-handle-key 7 "(esc)")
;;)
;;  ;;default input method
;;  (setq default-input-method "japanese-anthy")

;; ;KKC setting
;; (setq default-input-method "japanese")

;Mozc setting
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mozc")
(setq mozc-helper-program-name "/usr/bin/mozc_emacs_helper")
(require 'mozc)
(setq default-input-method "japanese-mozc")
)


;(when windows-p
;;;;**
;(setq default-input-method "W32-IME")
;
;;;;**
;(w32-ime-initialize)
;
;;;;**
;(setq-default w32-ime-mode-line-state-indicator "[--]")
;(setq w32-ime-mode-line-state-indicator-list '("[--]" "[AA]" "[--]"))
;
;;;;**
;(set-cursor-color "red")
;
;;;;**
;(add-hook 'input-method-activate-hook
;          (lambda() (set-cursor-color "green")))
;(add-hook 'input-method-inactivate-hook
;          (lambda() (set-cursor-color "red")))
;
;;;;**
;(setq w32-ime-buffer-switch-p nil)
;
;)

