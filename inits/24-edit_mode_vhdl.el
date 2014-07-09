;;VHDL mode 
;(require `vhdl-mode)
;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))
      
;;;; Any files in verilog mode shuold have their keywords colorized
;;(add-hook 'vhdl-mode-hook
;;	'(lambda ()
;;			 (font-lock-mode t)
;;			 (setq vhdl-basic-offset  4)        ;indent 4
;;			 (setq vhdl-electric-mode nil)      ;auto template mode off
;;			 (setq vhdl-highlight-case-sensitive t)
;;			 (setq vhdl-highlight-forbidden-words t)
;;			 (setq vhdl-highlight-special-words t)
;;			 (setq vhdl-highlight-translate-off t)
;;			 (setq vhdl-highlight-verilog-keywords t)
;;			 (setq vhdl-indent-tabs-mode t)
;;(when emacs24-p
;;  (when linux-p
;;	(flycheck-mode)			  ; flycheck on for linux only
;;	(git-gutter-mode)
;;	)
;;)
;;			 ))
;;;             (setq indent-tabs-mode t)     ; インデントはTAB
;;;(setq 
;;; (vhdl-indent-tabs-mode t)  ;;indent tab
;;;)	

;;0624 temp
(add-hook 'vhdl-mode-hook
	'(lambda ()
			 (font-lock-mode t)
			 (setq vhdl-basic-offset  2)        ;indent 4
			 (setq vhdl-electric-mode nil)      ;auto template mode off
			 (setq vhdl-highlight-case-sensitive t)
			 (setq vhdl-highlight-forbidden-words t)
			 (setq vhdl-highlight-special-words t)
			 (setq vhdl-highlight-translate-off t)
			 (setq vhdl-highlight-verilog-keywords t)
			 (setq vhdl-indent-tabs-mode nil)
			 (setq end-comment-column nil)
			 (setq vhdl-compiler "Modelsim")
			 (setq time-stamp-start "-- Last update : ")
			 (setq time-stamp-format "%:y/%02m/%02d")
			 (setq time-stamp-end "\\.")
(when emacs24-p
  (when linux-p
	(flycheck-mode)			  ; flycheck on for linux only
	(git-gutter-mode)
	)
)
			 ))
;             (setq indent-tabs-mode t)     ; インデントはTAB
;(setq 
; (vhdl-indent-tabs-mode t)  ;;indent tab
;)	
