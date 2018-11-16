(load "~/.emacs.d/elpa/auctex-11.89.7/auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;set up the load-paths and autoloads for installed packages
(package-initialize)

;the following adds ":/usr/texbin" to my PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setq exec-path (append exec-path '("/usr/texbin")))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))




;this lets emacs recognize the path described below.
(add-to-list 'load-path "~/lisp")


(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "\\(" "\\)"))))
;so that when you insert a \(, the corresponding \) will be automatically inserted.



(setq TeX-arg-right-insert-p t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(TeX-arg-right-insert-p nil)
 '(TeX-electric-escape nil)
 '(TeX-electric-sub-and-superscript t)
 '(TeX-insert-braces nil)
 '(TeX-newline-function (quote reindent-then-newline-and-indent))
 '(package-selected-packages (quote (helm-gtags helm ggtags elpy auctex-latexmk))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(setq ispell-program-name "/usr/local/bin/hunspell")
(setq ispell-really-hunspell t)          ;use Hunspell

(setenv "DICTIONARY" "en_US")


(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)
;; AUCTeX will be integrated with RefTeX all the time.

(setenv "TEXINPUTS"
	(concat ".:" (getenv "HOME")
		":~/Library/tex/sty/:"
		(getenv "TEXINPUTS")))

(setenv "BIBINPUTS"
	(concat ".:" (getenv "HOME")
		":~/Library/tex/bib/:"
		(getenv "BIBINPUTS")))

(setenv "BSTINPUTS"
	(concat ".:" (getenv "HOME")
		":~/Library/tex/bst/:"
		(getenv "BSTINPUTS")))
;;If you go into the Shell with the command M-! and evaluate one
;;of these inveronment variables, say TEXINPUTS, you will obtain
;;the paths ":Uers/Owner/"(corresponding to "HOME") and "~/Library/tex/sty"
;;and the paths in "TEXINPUTS". But the last one  doesn't seem to work.

    (defun yank-pop-forwards (arg)
      (interactive "p")
      (yank-pop (- arg)))
(global-set-key "\M-Y" 'yank-pop-forwards) ; M-Y (Meta-Shift-Y)


;; latexmk
(require 'auctex-latexmk)
(auctex-latexmk-setup)


  (add-hook 'TeX-mode-hook
            '(lambda ()
               (setq TeX-command-default "LatexMk")
               (setq TeX-view-program-selection
                     '((output-dvi "Skim")
                       (output-pdf "Skim")))
               (setq TeX-view-program-list
                     '(("Skim" "open -a /Applications/Skim.app %s.pdf")))))


;;Skim has two ways to make itself open a pdf file.
;;First is "open -a /Applications/Skim.app %s.pdf".
;;This is the simplest way to open a file.
;;If you put %b, you can also open a dvi file.
;;Second way is "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %s.pdf %b".
;;This is the way only Skim has to open a pdf file.
;;When we use this hook, we can not only open a pdf file but also
;;highlight the point where the cursor is.



(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;This line forces emacs to open files with full screen on startup.
(set-frame-parameter nil 'fullscreen 'fullboth)

;;This line negates the default welcome screen from appearing on startup.
(setq inhibit-startup-screen t)