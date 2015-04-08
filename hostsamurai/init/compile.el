(defun hostsamurai/byte-recompile-init ()
  "Recompile the files I use to setup Emacs."
  (byte-recompile-directory (expand-file-name "hostsamurai" user-emacs-directory) 0)
  ;; don't recompile init.el because it's too late to freshen on load
  ;; loaddefs.el cannot be compiled
  (let ((log (get-buffer "*Compile-Log*")))
    (if (and log (= (buffer-size log) 0))
        (kill-buffer "*Compile-Log*"))))

(hostsamurai/byte-recompile-init)
