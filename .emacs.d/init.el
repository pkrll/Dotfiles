;;; Commentary:
;;;

;;; Code:
;; ==================
;; Autogenerated stuff
;; =================

;; This must at the top, otherwise Emacs will cry.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3053a26bd890b4fe16aa0aaadcf64d53c5b37a684f51dc45f218324f7cca580a" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "d2918b4a8764af42fdb0b415c150d39ea3dbf8cb969c94059f27591fa594b453" "e668d1ca957ed96d1ead0761f8b8f49a6a883d97dbf8ac4c5592a70765fa4b4a" "8bbe8f115fe57b6bd515a0a00347de77322cb5d7471f6a3c7c7b4a267bd55a1a" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(flycheck-clang-include-path (quote ("/usr/local/include/")))
 '(flycheck-gcc-includes (quote ("/usr/local/include")))
 '(indent-tabs-mode nil)
 '(linum-format "%d ")
 '(package-selected-packages
   (quote
    (swift-mode flycheck sublime-themes dracula-theme sr-speedbar with-editor rich-minority ggtags dash company-irony)))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 100)
 '(semantic-c-dependency-system-include-path (quote ("/usr/local/include/" "/usr/include")))
 '(smooth-scroll-mode nil)
 '(speedbar-default-position (quote left))
 '(standard-indent 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)
(setq package-enable-at-startup nil) (package-initialize)

;; =============================
;; Path
;; =============================

;; This sets the Emacs "PATH" environment variable and the `exec-path`
;; variable to the same value your login shell sees. The reason this
;; is necessary is because of this:
;;
;; http://developer.apple.com/library/mac/#qa/qa1067/_index.html
;;
;; Basically apps launched from Finder inherit their environment from
;; a .plist file rather than the shell environment.

(defvar extra-path
     (concat ":/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
             ":/opt/local/bin"))

(defun set-exec-path-from-shell-PATH ()
 "Sets the exec-path to the same value used by the user shell"
 (let ((path-from-shell
        (replace-regexp-in-string
         "[[:space:]\n]*$" ""
         (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
   (setenv "PATH" (concat path-from-shell extra-path))
   (setq exec-path (split-string path-from-shell path-separator))))

;; call function now
(set-exec-path-from-shell-PATH)

;; =============================
;; Packages
;; =============================

;; Use more package-archives (M-x list-packages)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Tell Emacs where to look for packages
(let ((default-directory "~/.emacs.d/ioopm-packages/"))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

;; theme
(load-theme 'dracula)

;;(font-lock-add-keywords
;; 'c-mode '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))

;; Ace window
(require 'ace-window)

;; imenu
;; Language-aware navigation
(require 'imenu-anywhere)
(setq imenu-auto-rescan t)

;; speedbar
(setq speedbar-show-unknown-files t)

;; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

;; Mark malloc
(add-hook 'c-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)
                                    ;;("\\<\\(\\sw+\\) ?->" 1 'font-lock-variable-name-face)
                                    ("\\<\\(FIXME\\|TODO\\):" 1 font-lock-warning-face prepend)
                                    ("\\<\\(//malloc\\|calloc\\|free\\|realloc\\)\\>" . font-lock-warning-face)))))

;; Multiple cursors
;; What it sounds like
(require 'multiple-cursors)

;; Visual Regexp
;; Replace normal query-replace with a better one
(require 'visual-regexp)

;; Expand region
;; Select the thing I'm currently inside
(require 'expand-region)

;; use y = yes, n = no
(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode t)))

(load "~/.emacs.d/config/load-directory")
(load-directory "~/.emacs.d/config")

;;(set-frame-font "Menlo:pixelsize=13")
(set-face-attribute 'default nil :family "Menlo" :height 144 :weight 'normal)
