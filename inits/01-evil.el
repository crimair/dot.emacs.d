;;******************* setting for evil start
(setq
 evil-cross-lines t
 evil-ex-search-vim-style-regexp t
 evil-search-module `evil-search
; evil-search-module `isearch ;search module isearch
 evil-regexp-search t    ;search regexp use
 evil-search-wrap   t    ;search wrap
)

;; enable evil(setq c-tab-always-indent nil)
(require 'undo-tree)
(require 'evil)
(evil-mode 1)

;(setq evil-normal-state-msg "NORMAL")

;number updown
(define-key evil-normal-state-map (kbd "C-c +") #'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") #'evil-numbers/dec-at-pt)

;C-r register paste
(require 'evil-ex-registers)
(define-key evil-ex-search-keymap (kbd "C-r") #'evil-ex-paste-from-register)
(define-key evil-ex-completion-map (kbd "C-r") #'evil-ex-paste-from-register)

;;keymap
;;normal mode C-* undefine
(define-key evil-normal-state-map (kbd "C-H") #'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "C-J") #'evil-window-move-very-bottom)
(define-key evil-normal-state-map (kbd "C-K") #'evil-window-move-very-top)
(define-key evil-normal-state-map (kbd "C-L") #'evil-window-move-far-right)
(define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)
(define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)

;;normal state backspace key 
(define-key evil-normal-state-map [backspace] 'evil-backward-char)
(define-key evil-normal-state-map [delete] 'evil-backward-char)

;;input-method toggle for evil 
;; normal-state       not-toggle
;; exit-insert-state  force-off
(defun evil-toggle-input-method ()
      (interactive)
	  (if (not (string= evil-state "insert"))
		  ;;normal nado
		  (if (not current-input-method)
			  ()
			  (toggle-input-method)
			)
		;;insert mode
		(toggle-input-method)
		)
)
(global-set-key (kbd "C-\\") 'evil-toggle-input-method)

(defun evil-force-normal-state-imeoff ()
      (interactive)
	  (if (not current-input-method)
			  ()
		  (toggle-input-method)
		)
	  (evil-normal-state)
)

(define-key evil-normal-state-map [escape]  'evil-force-normal-state-imeoff)
(define-key evil-insert-state-map [escape]  'evil-force-normal-state-imeoff)
(define-key evil-replace-state-map [escape] 'evil-force-normal-state-imeoff)


;;mark マークジャンプする場合に現在行を０にマークする。
(defun evil-goto-mark-ex(char &optional noerror)
      "goto-mark current line remember 0"
      (interactive (list (read-char)))
	  (if (/= char ?0)
		  (evil-set-marker ?0)
		)
	  (evil-goto-mark char noerror)
)
(defun evil-goto-mark-line-ex(char &optional noerror)
      "goto-mark current line remember 0"
      (interactive (list (read-char)))
	  (if (/= char ?0)
		  (evil-set-marker ?0)
		) 
	  (evil-goto-mark-line char noerror)
)
(define-key evil-motion-state-map "`" 'evil-goto-mark-ex)
(define-key evil-motion-state-map "'" 'evil-goto-mark-line-ex)

;;検索語を画面中央に
; vim nzz Nzz
; search-moduleはevilにのみ対応
(evil-define-motion evil-ex-search-next-zz (count)
  :type exclusive
  (evil-ex-search-next count)
  (recenter)
)
(evil-define-motion evil-ex-search-previous-zz (count)
  :type exclusive
  (evil-ex-search-previous count)
  (recenter)
)

(define-key evil-motion-state-map "n" 'evil-ex-search-next-zz)
(define-key evil-motion-state-map "N" 'evil-ex-search-previous-zz)

(defun t1 ()
  (interactive)
  (message "current-state:%s" evil-state)
)
(defun t2 ()
  (interactive)
  (message "current-input:%s" current-input-method)
)
(defun t3 ()
  (interactive)
  (message "current-input-method-title:%s" current-input-method-title)
)

;;Dired拡張
(eval-after-load 'dired
  '(progn
     ;; use the standard Dired bindings as a base
     (defvar dired-mode-map)
     (evil-make-overriding-map dired-mode-map 'normal)
     (evil-add-hjkl-bindings dired-mode-map 'normal
       "J" 'dired-goto-file                   ; "j"
       "K" 'dired-do-kill-lines               ; "k"
       "r" 'dired-do-redisplay                ; "l"
;;extend start
       "y" 'evil-yank         ; "for yank"
       "G" 'evil-goto-line    ; "for 1G"
;;extend end
       ;; ":d", ":v", ":s", ":e"
       ";" (lookup-key dired-mode-map ":"))))

;*******************  setting for evi end
