;;;; Timestamp自動更新
;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "[lL]ast[ -][cC]hanged?[ \t]*:[ \t]*")
(setq time-stamp-format "%:y/%02m/%02d %02H:%02M")
(setq time-stamp-end "\\.")
(setq time-stamp-line-limit 20000)
