;;flymake
;(require `flymake)
(require 'flycheck)
(require 'flycheck-pyflakes)

(define-key evil-normal-state-map "zn" 'flycheck-next-error)
