;;Verilog mode 
;; Any files that end in .v should be in verilog mode
(setq auto-mode-alist (cons '("\\.s?vh?$\\'" . verilog-mode) auto-mode-alist))
      
;			 (local-set-key (kbd [tab]) (kbd "M-i"))
;; Any files in verilog mode shuold have their keywords colorized
(add-hook 'verilog-mode-hook
		  '(lambda ()
			 (font-lock-mode t)
             (setq indent-tabs-mode nil)    ; インデントはspace
(when emacs24-p
  (when linux-p
	(flycheck-mode)			  ; flycheck on for linux only
	)
)
			 ))
(setq 
	verilog-indent-level             4
	verilog-indent-level-module      0
	verilog-indent-level-declaration 0
	verilog-indent-level-behavioral  4   ;;function indent
	verilog-indent-level-directive   0
	verilog-case-indent              4
	verilog-cexp-indent				 0	
	verilog-auto-newline             nil
	verilog-auto-indent-on-newline   nil
	verilog-tab-always-indent        t
	verilog-auto-endcomments         t
;;begin-endが何行はなれていたらendコメントを付加するか
	verilog-minimum-comment-distance 10
	verilog-indent-begin-after-if    t
	verilog-auto-lineup              `all
	verilog-indent-lists             t
	verilog-highlight-modules        t
	verilog-highlight-p1800-keywords nil
	verilog-highlight-grouping-keywords t
	verilog-highlight-includes       t
	verilog-date-scientific-format   t
;;
    ;;tabしたときに自動でコメントアウトを付加 要tab-mode t
	verilog-tab-to-comment nil
    ;;
	verilog-align-ifelse nil
	verilog-auto-declare-nettype nil
	verilog-auto-wire-type t
	verilog-assignment-delay "#(2)"
	verilog-auto-inst-param-value nil
	verilog-auto-inst-column 40
	verilog-auto-inst-interfaced-ports nil
	verilog-auto-input-ignore-regexp nil
	verilog-auto-inout-ignore-regexp nil
	verilog-auto-template-warn-unused nil
	verilog-auto-tieoff-declaration "wire"
;;
	verilog-company (getenv "COMPANY")
)	
