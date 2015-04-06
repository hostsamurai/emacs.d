;; always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; type y/n instead of 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; no backups
(setq make-backup-files nil)
(setq auto-save-default nil)

;; keep a list of recently opened files
(recentf-mode 1)

;; soft-wrapped lines
(global-visual-line-mode 1)

(setq require-final-newline nil)

;; autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)
