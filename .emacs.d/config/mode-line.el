;;; Mode-line.el
;;; Commentary:
;;; Customized mode-line

;;; Changes how the directory is displayed
;;;(setq-default mode-line-buffer-identification
;;;              '(:eval (abbreviate-file-name default-directory)))

(setq-default mode-line-format
              '(
                (:eval (propertize " ❯ " 'face '(:foreground "white" :weight: normal)))
               ;;mode-line-buffer-identification
                (:eval (propertize "%b" 'face '(:foreground "#6FADC0" :weight bold)))
                " [%*] "
                (:eval (concat "[" (concat (propertize (substring vc-mode 1) 'face '(:foreground "#C06F98" :weight bold)) "] " )))
                (:eval (propertize "(Line: %l, Col: %c) " 'face '(:foreground "green" )))
                ))
