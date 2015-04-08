(require 'find-lisp)

(setq hostsamurai-autoload-file (concat user-emacs-directory "loaddefs.el"))

(defun hostsamurai/autoload-directories (directories)
  "Regenerate the autoload definitions file if necessary and load it."
  (let ((autoload-file hostsamurai-autoload-file))
    (if (or (not (file-exists-p autoload-file))
            (catch 'newer
              (dolist (directory directories)
                (dolist (file (find-lisp-find-files directory "\\.el$"))
                  (if (file-newer-than-file-p file autoload-file)
                      (throw 'newer file))))))
        (let ((generated-autoload-file autoload-file)
              (subdirectories (apply
                               'nconc
                               (mapcar
                                (lambda (directory)
                                  (find-lisp-find-files-internal
                                   directory
                                   'find-lisp-file-predicate-is-directory
                                   'find-lisp-default-directory-predicate))
                                directories))))
          (apply 'update-directory-autoloads (append directories
                                                     subdirectories))))))

(defun hostsamurai/prepare-autoloads ()
  "Sets up and triggers autoload file."
  (hostsamurai/autoload-directories
   (mapcar (lambda (directory) (concat user-emacs-directory directory "/"))
           '("hostsamurai/functions" "hostsamurai/commands")))
  (add-to-list 'load-path user-emacs-directory t)
  (load hostsamurai-autoload-file))

(hostsamurai/prepare-autoloads)
