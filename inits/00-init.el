;;;Last Change:2014/09/04 13:22.
(setq debug-on-error nil)
;(setq debug-on-error t)

;;;;;共通設定
;;;日本語環境の設定
;(set-language-environment "Japanese")
;;;UTF-8 only
;(setq default-buffer-file-coding-system 'utf-8-unix)
;(set-buffer-file-coding-system 'utf-8-unix)
;(set-terminal-coding-system 'utf-8-unix)
;(set-keyboard-coding-system 'utf-8-unix)
;(set-clipboard-coding-system 'utf-8-unix)
;(prefer-coding-system 'utf-8-unix)
;;(set-language-environment 'utf-8)
;(set-default-coding-systems 'utf-8-unix)
;(setq locale-coding-system 'utf-8)

;;日本語入力環境
(set-input-method "japanese")

;;;;backup setting
(setq make-backup-files t)
(when linux-p
  (setq backup-directory "~/vim_tmp")
)
(when nt-p
  (setq backup-directory "~/")
)
(when cygwin-p
  (setq backup-directory "~/.back")
)

(if (and (boundp 'backup-directory)
         (not (fboundp 'make-backup-file-name-original)))
    (progn
      (fset 'make-backup-file-name-original
            (symbol-function 'make-backup-file-name))
      (defun make-backup-file-name (filename)
        (if (file-directory-p (expand-file-name backup-directory))
            (concat (expand-file-name backup-directory)
                    "/" (file-name-nondirectory filename) "~"
		    (format-time-string "%y%m%d-%T") "~")
          (make-backup-file-name-original filename)))))

;;透明化
;;(add-to-list 'default-frame-alist '(alpha , 85))

;;バッファ自動再読み込み
(global-auto-revert-mode 1)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f" (system-name)))

;;右端で折り返さない
;;通常のウィンドウ用の設定
(setq-default truncate-lines t)
;;ウィンドウを左右に分割したとき用の設定
(setq-default truncate-partial-width-windows t)

; _を単語に含める vim compatible
(modify-syntax-entry ?_ "w" (standard-syntax-table))
(modify-syntax-entry ?_ "w")

;;複数ウィンドウを開かないようにする
(setq ns-pop-up-frames nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

; インデントはspace
(setq indent-tabs-mode nil)

;;emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))
