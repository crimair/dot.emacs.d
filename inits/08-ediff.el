;(load-library "ediff")
(add-hook 'ediff-before-setup-hook 'new-frame)
;(add-hook 'ediff-startup-hook 'new-frame)
(add-hook 'ediff-quit-hook 'delete-frame)
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

