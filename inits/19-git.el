(when emacs24-p
  (require 'git-gutter)
  (global-git-gutter-mode t)
  (setq git-gutter:lighter "")
  (setq git-gutter:modified-sign "M")
  (setq git-gutter:added-sign "A")
  (setq git-gutter:deleted-sign "D")
)
