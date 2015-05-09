;initilize
(setq auto-mode-alist (cons '("\\.org$\\'" . org-mode) auto-mode-alist))
(add-hook 'org-mode-hook
  '(lambda ()
   (font-lock-mode t)
   (setq indent-tabs-mode nil)    ; インデントはspace
))

(setq  org-export-latex-classes '())
(add-to-list 'org-export-latex-classes
             '("report" "
\\documentclass[10pt]{jsarticle}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage[dvipdfmx]{color}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{t1enc}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{ascmac}
\\usepackage{setspace}
"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


(setq org-ditaa-jar-path
  "~/.emacs.d/modified/jditaa.jar")

(add-hook 'picture-mode-hook 'picture-mode-init)
(autoload 'picture-mode-init "picture-init")

(require 'org-latex)
(setq org-latex-to-pdf-process '("platexpdf %f" "platexpdf %f"))

;#+LATEX_CLASS: jsarticle
;#+LATEX_CLASS_OPTIONS: [a4j]

