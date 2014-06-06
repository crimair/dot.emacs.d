;;;;見た目
;(when linux-p
;  (custom-set-faces
;   '(default ((t (:family "Migu 1M" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
;)

(when linux-p
	(set-face-attribute 'default nil :family "Inconsolata" :height 160)
	(set-fontset-font
		 nil 'japanese-jisx0208
		 (font-spec :family "Migu 1M"))

)
