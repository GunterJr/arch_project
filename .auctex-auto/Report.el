;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "Report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("report" "") ("inputenc" "utf8") ("fontenc" "T1") ("hyperref" "colorlinks=true" "linkcolor=black" "citecolor=blue" "urlcolor=blue") ("url" "") ("booktabs" "") ("amsfonts" "") ("nicefrac" "") ("microtype" "") ("lipsum" "") ("graphicx" "") ("natbib" "") ("doi" "") ("listings" "") ("xcolor" "") ("float" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "report"
    "inputenc"
    "fontenc"
    "hyperref"
    "url"
    "booktabs"
    "amsfonts"
    "nicefrac"
    "microtype"
    "lipsum"
    "graphicx"
    "natbib"
    "doi"
    "listings"
    "xcolor"
    "float")
   (LaTeX-add-labels
    "sec:headings")
   (LaTeX-add-listings-lstdefinestyles
    "mystyle")
   (LaTeX-add-xcolor-definecolors
    "codegreen"
    "codegray"
    "codepurple"
    "backcolour"))
 :latex)

