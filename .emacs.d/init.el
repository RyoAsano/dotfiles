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
(add-to-list 'load-path "/Users/Owner/dotfiles/.emacs.d/lisp")


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
 '(package-selected-packages
   (quote
    (smartparens irony company-c-headers company sr-speedbar helm-gtags helm ggtags elpy auctex-latexmk))))
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




					;-----------------------setup for helm and helm-gtags---------------------------
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
					;-----------------------setup for helm and helm-gtags---------------------------

;;Sets company for auto completion.
(require 'cc-mode) 
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)


;;Set company-c-headers
(add-to-list 'company-backends 'company-c-headers)


;;CEBET
(load-file (concat user-emacs-directory "cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "cedet/contrib/cedet-contrib-load.el"))

;;semantic
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;;smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
