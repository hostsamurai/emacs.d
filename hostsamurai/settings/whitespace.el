;; disable the splash screen
(setq inhibit-startup-message t
			inhibit-startup-echo-area-message t)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq tab-stop-list (number-sequence 4 120 4))
(setq require-final-newline nil)
