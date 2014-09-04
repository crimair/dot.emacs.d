;; フォント
;; abcdefghijklmnopqrstuvwxyz 
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                            │
;; └─────────────────────────────┘
;;

(when linux-p
(set-face-attribute 'default nil
                    :family "Meslo LG M"
                    :height 105)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty" "iso10646-1"))

(setq face-font-rescale-alist
      '(
;("Migu 1M.*" . 1.2)
;("Migu 2M.*" . 1.2)
("Ricty.*" . 1.2)
	))
)

(when windows-p
(set-face-attribute 'default nil
                    :family "Meslo LG M"
                    :height 115)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Migu 1M" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Migu 1M" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Migu 1M" "iso10646-1"))

(setq face-font-rescale-alist
      '(
("Migu 1M.*" . 1.2)
	))
)
(when cygwin-p
(set-face-attribute 'default nil
                    :family "Meslo LG M"
                    :height 105)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "Ricty" "iso10646-1"))

(setq face-font-rescale-alist
      '(
;("Migu 1M.*" . 1.2)
;("Migu 2M.*" . 1.2)
("Ricty.*" . 1.2)
	))
)

