;;;共通 key map
;exit unset
(global-unset-key (kbd "C-x C-c"))
;suspend unset
(global-unset-key (kbd "C-x C-z"))
;C-x C-c exit
(defalias 'exit 'save-buffers-kill-emacs)

;;Ctrl-q key map
(defvar ctl-q-map (make-keymap))  
(define-key global-map (kbd "C-q") ctl-q-map) 
(define-key ctl-q-map (kbd "2") (lambda () (interactive) (set-aurora-tab-width 2 t t)))
(define-key ctl-q-map (kbd "4") (lambda () (interactive) (set-aurora-tab-width 4 t t)))
(define-key ctl-q-map (kbd "8") (lambda () (interactive) (set-aurora-tab-width 8 t t)))

;;quickrun
(global-set-key (kbd "<f5>") 'quickrun)

;;Japanese input
(when linux-p
  ;;anthy
  (global-set-key (kbd "C-\\") 'anthy-mode)
)

