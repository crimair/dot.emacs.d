;;model line
;(require 'evil-mode-line)
;(require 'powerline)
(require 'powerline-evil)

(set-face-background 'powerline-evil-normal-face   "lime green")
(set-face-background 'powerline-evil-insert-face   "steel blue")
(set-face-background 'powerline-evil-visual-face   "dark orange")
(set-face-background 'powerline-evil-operator-face "dark cyan")
(set-face-background 'powerline-evil-replace-face  "dark red")
(set-face-background 'powerline-evil-motion-face   "dark magenta")
(set-face-background 'powerline-evil-emacs-face    "dark violet")

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;;bufferの改行コード
(defpowerline powerline-eol_mode
  (case (coding-system-eol-type buffer-file-coding-system)
    (0 "LF")
    (1 "CRLF")
    (2 "CR")
    (otherwise "??")))

;;ime状態
(defpowerline powerline-ime-mode
  (cond (current-input-method "あ")
		(t "Aa"))
)

(defpowerline powerline-filex-mode
  (cond ((buffer-modified-p)  "++")
		(buffer-read-only     "RO")
		(t                    "--")
  )
)


(defun my-powerline-evil-theme ()
  "Powerline's Vim-like mode-line with evil state at the beginning in color."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list 
                                     ;;evil-mode
                                     (let ((evil-face (powerline-evil-face)))
                                      (if evil-mode
                                       (powerline-raw (powerline-evil-tag) evil-face)
                                       (funcall separator-left evil-face mode-line)
                                      )
                                     )
                                     (let ((evil-face (powerline-evil-face)))
                                      (funcall separator-left evil-face mode-line)
                                     )
                                     ;;filename
                                     (powerline-raw (shorten-directory default-directory 15) mode-line 'l)
                                     (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'r)

                                     ;;ime-mode
                                     (funcall separator-left mode-line face1)
                                     (powerline-ime-mode face1 'l)
                                     (powerline-raw " " face1)
                                     ;;file-state
                                     (funcall separator-left face1 face2)
                                     (powerline-filex-mode  face2 `l)
                                     (powerline-raw " " face2)
                                     (funcall separator-left face2 face1)
                                     (powerline-raw " "     face1)
                                     (powerline-raw "%4l:" face1 'l)
                                     (powerline-raw (format-mode-line '(3 "%c")) face1)
                                     (funcall separator-right face1 face2)
                                     ;;file-type
                                     (powerline-raw " %z-" face2)
                                     (powerline-eol_mode   face2)
                                     (powerline-raw " "  face2)
                                     (funcall separator-left face2 mode-line)

                                     ))
                          (rhs (list 
                                     ;;vc-mode
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw "[" mode-line 'l)
                                                   (powerline-raw (format "%s/%s" backend (vc-working-revision buffer-file-name backend)))
                                                   (powerline-raw "]" mode-line)))))
                                     ;;major-mode
                                     (powerline-raw "["    mode-line 'l)
                                     (powerline-major-mode mode-line)
                                     (powerline-process    mode-line)
                                     (powerline-raw "]"    mode-line)
                                     ;;minor-mode
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-minor-modes mode-line)
                                     (powerline-raw "%n" mode-line)
                                     (powerline-raw "]" mode-line)

                                     (funcall separator-right mode-line face1)
                                     (powerline-raw " "     face1)
                                     (powerline-buffer-size face1)
                                     (powerline-raw " "     face1)

                                     (funcall separator-right face1 face2)
                                     (powerline-raw " "  face2)
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) face2 'r)
                                    )
                               ))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(my-powerline-evil-theme)

