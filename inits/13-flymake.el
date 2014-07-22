(when emacs24-p
  (require 'flycheck)
;  (require 'flycheck-pyflakes)
  
  (define-key evil-normal-state-map "zn" 'flycheck-next-error)
  
  ;;**** custom flycheck ****
  ;; VHDL
  (flycheck-define-checker vhdl-vcom
	"VHDL syntax check using auto_vcom."
	
	:command ("auto_vcom" temporary-directory "-quiet" source)
	:error-patterns
	((warning line-start "** Warning: "
			  (file-name) "(" line "):" (message) line-end)
	 (error line-start "** Error: "
            (file-name) "(" line "):" (message) line-end))
	:modes vhdl-mode)
  
  ;; Verilog
  (flycheck-define-checker verilog-vlog
	"Verilog syntax check using auto_vlog."
	
	:command ("auto_vlog" temporary-directory "-sv" "-quiet" source)
	:error-patterns
	((warning line-start "** Warning: "
			  (file-name) "(" line "):" (message) line-end)
	 (error line-start "** Error: "
            (file-name) "(" line "):" (message) line-end))
	:modes verilog-mode)
  
  (add-to-list 'flycheck-checkers 'vhdl-vcom)
  (add-to-list 'flycheck-checkers 'verilog-vlog)
  )
