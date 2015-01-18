(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

;--------------------;
;;; User Interface ;;;
;--------------------;

;; No splash screen ...
(setq inhibit-startup-message t)

;; Disable menubar
(menu-bar-mode -1)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbar
(scroll-bar-mode -1)

;; always use spaces, not tabs, when indenting
(setq indent-tabs-mode nil)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;----------;
;;; Repo ;;;
;----------;

;; load marmalade repo
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;-----------------------;
;;; Some other stuffs ;;;
;-----------------------;

;; Auto-enabled ido-mode
(require 'ido)
(ido-mode t)

;; aliasing yes or no to y or n only
(defalias 'yes-or-no-p 'y-or-n-p)

;-------------------------;
;;; Custom Key Bindinds ;;;
;-------------------------;

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x g") 'magit-status)

;; make cursor movement keys under right hand's home-row
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

;------------------------------;
;;; org-html-publisher setup ;;;
;------------------------------;

(require 'org-publish)
(setq org-publish-project-alist
      '(
	("org-notes"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/org/public_html/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 2             ; Just the default for this project.
	 :auto-preamble t
	 )

	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/org/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("pdf"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/org/exports"
	 :publishing-function org-publish-org-to-pdf)

	("all" :components ("org-notes" "org-static pdf"))

	)
      )
