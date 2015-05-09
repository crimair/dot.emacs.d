;; C style 
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "stroustrup")
             (setq indent-tabs-mode t)     ; インデントはTAB
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
			 (modify-syntax-entry ?_ "w")
			 (setq-default c-basic-offset 4) ;offset indent 4
			 (setq-default c-tab-always-indent )	;[TAB] tab input
			 (setq-default c-auto-newline nil)	;全自動いんでんと無効
(when emacs24-p
             (flycheck-mode)			  ; flycheck on
)
             ))
