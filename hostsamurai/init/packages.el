(require 'package)

(dolist (repo '(("elpa" . "http://tromey.com/elpa/")
								("marmalade" . "http://marmalade-repo.org/packages/")
								("melpa" . "http://melpa.milkbox.net/packages/")))
	(add-to-list 'package-archives repo))

(defun hostsamurai/package-refresh-and-install (name)
	"Ensure we have a fresh package list, then install."
	(package-refresh-contents)
	(package-install name))

(defun hostsamurai/package-install-unless-installed (name)
	"Install a package by name unless it is already installed."
	(or (package-installed-p name) (hostsamurai/package-refresh-and-install name)))

(defun hostsamurai/package-details-for (name)
  "Safely pull out package details across Emacs versions."
  (let ((v (cdr (assoc name package-archive-contents))))
    (and v (if (consp v)
	       (car v) ; for Emacs 24.4+
	     v))))

(defun hostsamurai/package-version-for (package)
	"Get the version of a loaded package."
	(package-desc-version (hostsamurai/package-details-for package)))

(defun hostsamurai/package-delete-by-name (package)
  (package-delete (package-desc-full-name (symbol-name package))))

(defun hostsamurai/package-delete-unless-listed (packages)
	"Remove packages not explicitly declared."
	(let ((packages-and-dependencies (hostsamurai/packages-requirements packages)))
		(dolist (package (mapcar 'car package-alist))
			(unless (memq package packages-and-dependencies)
				(hostsamurai/package-delete-by-name package)))))

(defun hostsamurai/packages-requirements (packages)
  "List of dependencies for packages."
  (delete-dups (apply 'append (mapcar 'hostsamurai/package-requirements packages))))

(defun hostsamurai/package-requirements (package)
	"List of dependencies for packages."
	(let ((package-info (hostsamurai/package-details-for package)))
		(cond ((null package-info) (list package))
					(t
					 (hostsamurai/flatten
						(cons package
									(mapcar 'hostsamurai/package-requirements
													(mapcar 'car (package-desc-reqs package-info)))))))))

(defun hostsamurai/package-install-and-remove-to-match-list (&rest packages)
	"Sync packages so the installed list matches the passed list."
	(package-initialize)
	(condition-case nil ;; added to handle no-network situations
			(mapc 'hostsamurai/package-install-unless-installed packages)
		(error (message "Couldn't install package. No network connection?")))
	(hostsamurai/package-delete-unless-listed packages))

(hostsamurai/package-install-and-remove-to-match-list
  ;; language support
  'emmet-mode
  'sass-mode
  'js2-mode
  'skewer-mode
  'lua-mode
  'markdown-mode
  'mustache-mode
  'processing-mode
  'clojure-mode
  'clojurescript-mode
  'racket-mode
  'highlight-defined
  'paredit

  ;; shells and repls
  'geiser
  'multi-term
  'nodejs-repl
  'slime
  'slime-ritz

  ;; utilities
  'ace-jump-mode
  'ag
  'color-theme
  'company
  'ido-ubiquitous
  'magit
  'rainbow-mode
  'smart-tab
  'undo-tree

  ;; themes
  'solarized-theme
  'sublime-themes
  'base16-theme
  )
