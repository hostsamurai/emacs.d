(defun hostsamurai/autohooks ()
	"Autoload everything in the hooks directory as a hook for the named mode."
	(interactive)
	(dolist (path (directory-files (concat user-emacs-directory "hostsamurai/hooks")
																 t
																 "\\.el$"))
		(let* ((mode (file-name-nondirectory
									(file-name-sans-extension path)))
					 (hook-name (intern (concat mode "-hook")))
					 (defun-name (intern (concat "hostsamurai/" mode "-hook")))
					 (lisp (hostsamurai/read-file-to-string path)))
			(eval (read (concat "(defun " (symbol-name defun-name) " () " lisp ")")))
			(and (functionp defun-name)
					 (remove-hook hook-name defun-name))
			(add-hook hook-name defun-name))))

(hostsamurai/autohooks)
