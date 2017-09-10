(defun testbed-c ()
  "Insert boilerplate c code for testing"
  (interactive)
  (find-file "~/.emacs.d/testbed/testfile.c")
  (c-mode)
  (insert "testfile")
  (yas-expand)
  )
(global-set-key (kbd "C-c C-t") 'testbed-c)

;;; From http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
