;;; bindings.el
;;; Documentary:
;;; Code:

;;; Shortcut for finding a recently used file
(global-set-key "\C-x\C-r" 'recentf-ido-find-file)

;;; I-menu
(global-set-key (kbd "C-.") 'imenu-anywhere)

;; Select which window to switch to, rather than shuffling through them all
(global-set-key (kbd "C-x o") 'ace-window)

;;; sr-speedbar
(global-set-key "\M-s\M-s" 'sr-speedbar-toggle)

;; Window
(global-set-key (kbd "s-<") 'next-multiframe-window)
(global-set-key (kbd "s-t") 'split-window-right)

;; terminal
(global-set-key (kbd "M-s-t") 'shell)

;; Hide/show code block
(global-set-key (kbd "s-H") 'hs-toggle-hiding)

;;; Create a .c testing file
(global-set-key (kbd "C-c C-t") 'testbed-c)

;;; delete a file and the buffer
(global-set-key (kbd "C-c C-f") 'delete-file-and-buffer)

;;; Kills the current buffer (instead of having to choose one)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;; ggtags
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;;; multiple cursors
(global-set-key (kbd "C-<") 'mc/mark-next-word-like-this)
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-c") 'mc/edit-lines)

;; Replace normal query-replace with a better one
(global-set-key "\M-%" 'vr/query-replace)

;; Select the thing I'm currently inside
(global-set-key (kbd "M-h") 'er/expand-region)

;; Teach Emacs Swedish keyboard layout
(define-key key-translation-map (kbd "M-8") (kbd "["))
(define-key key-translation-map (kbd "M-9") (kbd "]"))
(define-key key-translation-map (kbd "M-(") (kbd "{"))
(define-key key-translation-map (kbd "M-)") (kbd "}"))
(define-key key-translation-map (kbd "M-7") (kbd "|"))
(define-key key-translation-map (kbd "M-/") (kbd "\\"))
(define-key key-translation-map (kbd "M-2") (kbd "@"))
(define-key key-translation-map (kbd "M-4") (kbd "$"))


;; select this word (and the next if repeated)    
(global-set-key (kbd "s-d") 'select-word-and-next)

(provide 'bindings)
;;; bindings.el ends here
