;;; Appearance.el
;;; Commentary:
;;;
;;; Everything related to the look of the editor:
;;;
;;; 1. Menu Bar
;;; 2. Default Theme
;;; 3. Line/column numbering
;;; 4. Miscellaneous

;; =============================
;; 1. Menu Bar
;; =============================

;; Disable the menu bar
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

;; Disable the tool bar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; Disable the scroll bar
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; =============================
;; Default Theme
;; =============================

(load-theme 'dracula)

;; =============================
;; Line/column numbering
;; =============================

;; Show both line and column number in the bottom of the buffer
(column-number-mode t)

;; Show parenthesis matching the one below the cursor
(show-paren-mode t)

;; Show line numbers to the left of all buffers
(global-linum-mode t)

;; Add padding to line numbers
(setq linum-format "%d ")

;; =============================
;; 4. Miscellaneous
;; =============================

;; Turn off annoying splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; When in doubt, use text-mode
(setq default-major-mode 'text-mode)

;; Show time using Swedish format
;;(setq display-time-day-and-date t
;;      display-time-24hr-format t)
;;(display-time)
