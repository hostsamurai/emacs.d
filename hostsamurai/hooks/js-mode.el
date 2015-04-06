(setq js2-basic-offset 2)
(setq js2-use-font-lock-faces t)
(setq js-indent-level 2)

;; use node as our repl
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
			(lambda ()
				(ansi-color-for-comint-mode-on)
				;; deal with some prompt nonsense
				(add-to-list 'comint-preoutput-filter-functions
										 (lambda (output)
											 (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
										 (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

;; scan the file for nested code blocks
(imenu-add-menubar-index)

;; activate the folding mode
(hs-minor-mode)
