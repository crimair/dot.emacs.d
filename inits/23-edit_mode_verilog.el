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
	verilog-indent-level-behavioral  0   ;;task/function indent
	verilog-indent-level-directive   0
	verilog-case-indent              4
	verilog-cexp-indent				 4	
	verilog-auto-newline             nil
	verilog-auto-indent-on-newline   nil
	verilog-tab-always-indent        nil
	verilog-auto-endcomments         t
	verilog-minimum-comment-distance 40
	verilog-indent-begin-after-if    t
	verilog-auto-lineup              nil
	verilog-indent-lists             t
	verilog-highlight-modules        t
	verilog-highlight-p1800-keywords nil
	verilog-highlight-grouping-keywords t
	verilog-highlight-includes       t
	verilog-date-scientific-format t
	verilog-company (getenv "COMPANY")
)	
