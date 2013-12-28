;;; package -- Summary

;;; Commentary:

;;; Code:
(server-start)

;;(setq mac-option-key-is-meta nil)
;;(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq mac-right-option-modifier 'super)

;;(add-hook 'clojure-mode-hook '(lambda () (define-key clojure-mode-map "\M-[" 'paredit-wrap-square)))
;;(add-hook 'clojure-mode-hook '(lambda () (define-key clojure-mode-map "\M-{" 'paredit-wrap-curly)))

;;(define-key paredit-mode-map (kbd "M-S-5") 'paredit-wrap-square)
(load-theme 'solarized-dark t)

(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

(smartparens-strict-mode)

(provide 'personal)
;;; personal.el ends here
