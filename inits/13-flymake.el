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


  ;; My-php
  (flycheck-define-checker my-php
	"A PHP syntax checker using the PHP command line interpreter.

	See URL `http://php.net/manual/en/features.commandline.php'."
	:command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
			  "-d" "log_errors=0" source)
	:error-patterns
	((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
			(message) " in " (file-name) " on line " line line-end))
	:modes (php-mode php+-mode web-mode))
  (add-to-list 'flycheck-checkers 'my-php)

  )

  ;C/C++ gcc modify
(flycheck-define-checker c/c++-gcc
  "A C/C++ syntax checker using GCC.

Requires GCC 4.8 or newer.  See URL `https://gcc.gnu.org/'."
  :command ("g++"
            "-Wall"
            "-Wextra"
;            "-fshow-column"
;            "-fno-diagnostics-show-caret" ; Do not visually indicate the source location
;            "-fno-diagnostics-show-option" ; Do not show the corresponding
                                        ; warning group
            "-iquote" (eval (flycheck-c/c++-quoted-include-directory))
            (option "-std=" flycheck-gcc-language-standard concat)
            (option-flag "-fno-exceptions" flycheck-gcc-no-exceptions)
            (option-flag "-fno-rtti" flycheck-gcc-no-rtti)
            (option-list "-include" flycheck-gcc-includes)
;            (option-list "-W" flycheck-gcc-warnings concat)
            (option-list "-D" flycheck-gcc-definitions concat)
            (option-list "-I" flycheck-gcc-include-path)
;            "-x" (eval
;                  (pcase major-mode
;                    (`c++-mode "c++")
;                    (`c-mode "c")))
            source
            ;; GCC performs full checking only when actually compiling, so
            ;; `-fsyntax-only' is not enough. Just let it generate assembly
            ;; code.
            "-S" "-o" null-device)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" (or " fatal error: " " エラー: " " error: ") (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" (or " 警告: " " warning: ") (message)
                           line-end)
                    (info line-start
                           (file-name) ":" line ":" (or " note: " " note: ") (message)
                           line-end)
					)
  :modes (c-mode c++-mode))
