;;Perl
(add-hook 'perl-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
(when emacs24-p
             (flycheck-mode)			  ; flycheck on
)
			 )
  )
