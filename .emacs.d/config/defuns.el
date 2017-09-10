;;; defuns --- Summary
;;; Commentary:
;;; Code:

(defun testbed-c ()
  "Insert boilerplate c code for testing."
  (interactive)
  ;(if (member major-mode '(c-mode))
      (create-testfile-c)
   ; (message "Couldn't create testfile") )
  )


(defun create-testfile-c ()
  "."
  (interactive)
  (find-file "~/.emacs.d/testbed/testfile.c")
  (c-mode)
  (insert "testfile")
  (yas-expand)
  )

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

(defun sel () (execute-kbd-macro (kbd "C-<")) )

(defun select-word-and-next ()
  "Select the word the cursor is currently on and expand to the next similar word."
  (interactive)
  (if (and mark-active (/= (point) (mark)))
    (sel)
    (select-word)
    )
  )

(provide 'defuns)
;;; defuns.el ends here
