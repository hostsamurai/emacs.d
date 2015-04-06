(global-linum-mode t)
(setq linum-format "%3d")

(blink-cursor-mode -1)
(hl-line-mode 1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode 1)
(setq show-paren-delay 0)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; soft-wrapped lines
(global-visual-line-mode 1)

;; color themes
(setq colortheme-is-global 1)
(color-theme-initialize)
(load-theme 'odersky t)

(custom-set-faces
 '(default ((t (:family "Ubuntu Mono" :slant normal :weight normal :height 95 :width normal)))))
