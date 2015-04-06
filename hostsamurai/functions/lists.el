;;;###autoload
(defun hostsamurai/flatten (x)
	"Flatten a list."
	(cond ((null x) nil)
				((listp x) (append (hostsamurai/flatten (car x)) (hostsamurai/flatten (cdr x))))
				(t (list x))))
