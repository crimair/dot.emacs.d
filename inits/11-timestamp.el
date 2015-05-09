;;;; Timestamp自動更新
;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
;;正規表現の\(\)を行いたい場合などは\\\(のように記述する
;(setq time-stamp-start "[lL]ast[ -_]\\\([cC]hanged?\\\|[uU]pdated?\\\|[mM]odified? *:")
;(setq time-stamp-format "%y/%02m/%02d %02H:%02M:%02S (%u)")
(setq time-stamp-start "[lL]ast[ -]\\\([cC]hanged?\\\|[uU]pdated?\\\)[ \t]*:[ \t]*")
(setq time-stamp-format "%:y/%02m/%02d %02H:%02M:%02S (%u)")
(setq time-stamp-end "\n")
(setq time-stamp-line-limit 20000)

