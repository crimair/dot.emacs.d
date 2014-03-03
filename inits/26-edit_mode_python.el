;;python
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq py-indent-offset 4)
			 (flymake-python-pyflakes-load)
			 )
  )
