;; Package Manager
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; C-Mode Configuration
(setq c-default-style "linux"
      c-basic-offset 4)

;; Wombat Theme
(load-theme 'wombat t)

;; Set larger font size for OS X 
(set-face-attribute 'default nil :height 130)

;; Show matching parantheses when hovered
(show-paren-mode 1)

;; Enable line number directly
(global-linum-mode t)

;; Enable js2 mode and js2-jsx mode
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; Enable js2 mode for json file
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

;; Enable ido mode 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
