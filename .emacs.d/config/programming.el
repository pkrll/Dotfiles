;;; programming.el

;; ============
;; Programming
;; ============

;; completion
(add-hook 'after-init-hook 'global-company-mode)

;; =============================
;; 1. Flycheck
;; =============================

;; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Key binding for finding next error
(dolist (hook '(prog-mode-hook))
  (add-hook hook
            (lambda () (interactive)
              (local-set-key (kbd "C-c C-n")
                             'next-error))))

;; Key binding for finding previous error
(dolist (hook '(prog-mode-hook))
  (add-hook hook
            (lambda () (interactive)
              (local-set-key (kbd "C-c C-p")
                             'previous-error))))

;; Display flymake errors in minibuffer

;; =============================
;; 2. YASnippets
;; =============================

;; YASnippets
;; Expand e.g. "for<tab>" to "for(int i = 0; i < N; i++) {}"
(setq yas-snippet-dirs '(
                         "~/.emacs.d/snippets"
                         "~/.emacs.d/ioopm-packages/yasnippet/snippets"))
(require 'yasnippet)
(yas-global-mode 1)

;; =============================
;; 3. GDB
;; =============================

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
