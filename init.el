;; hostsamurai's Emacs configuration

(defun hostsamurai/load-init-file (path &optional noerror)
	"This loads a file from inside the .emacs.d directory"
	(let ((file (file-name-sans-extension
							 (expand-file-name path user-emacs-directory))))
		(load file noerror)))

;; load configuration settings by type
(hostsamurai/load-init-file "hostsamurai/init/freshen")
(hostsamurai/load-init-file "hostsamurai/init/system")
(hostsamurai/load-init-file "hostsamurai/init/autoloads")
(hostsamurai/load-init-file "hostsamurai/init/packages")
(hostsamurai/load-init-file "hostsamurai/init/compile")
(hostsamurai/load-init-file "hostsamurai/init/autohooks")
(hostsamurai/load-init-file "hostsamurai/init/settings")
