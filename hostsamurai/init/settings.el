(defun hostsamurai/load-settings ()
	"Loads all Lisp files in the settings subdirectory of the init directory."
	(dolist (file (directory-files (concat user-emacs-directory "hostsamurai/settings")
																 nil
																 "\\.el$"))
		(hostsamurai/load-init-file (concat "hostsamurai/settings/" file))))

(hostsamurai/load-settings)
