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

;; Enable ido mode 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Web-mode and jsx configuration 
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'"    . web-mode))       ;; ERB
(add-to-list 'auto-mode-alist '("\\.html?\\'"  . web-mode))       ;; Plain HTML
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))       ;; JS + JSX
(add-to-list 'auto-mode-alist '("\\.es6\\'"    . web-mode))       ;; ES6
(add-to-list 'auto-mode-alist '("\\.css\\'"    . web-mode))       ;; CSS
(add-to-list 'auto-mode-alist '("\\.scss\\'"   . web-mode))       ;; SCSS
(add-to-list 'auto-mode-alist '("\\.php\\'"   . web-mode))        ;; PHP
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))  ;; Blade template

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")
        ("javascript" . "\\.es6?\\'")))

(setq web-mode-engines-alist
      '(("blade"  . "\\.blade\\.")))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-indent-style 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "js")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-enable-auto-pairing t)

(setq web-mode-enable-css-colorization t)
