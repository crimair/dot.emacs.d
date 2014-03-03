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

;(define-key evil-motion-state-map (kbd "n")
;  (lambda()
;	 ('evil-search-next)
;	 ('evil-scroll-line-to-center)
;	 )
;)
;(define-key evil-motion-state-map (kbd "N")
;  (lambda()
;	 ('evil-search-previous)
;	 ('evil-scroll-line-to-center)
;	 )
;)
;;*******************  setting for evil end
