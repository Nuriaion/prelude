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

(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#emacs" "#overtone")))

(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"

                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))


(require 'clj-refactor)

(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ;; insert keybinding setup here
                               (cljr-add-keybindings-with-prefix "M-r")
                               ))

;;(add-hook 'clojure-mode-hook 'esk-pretty-fn)
;;(add-hook 'prog-mode-hook 'esk-pretty-lambdas)
;;(add-hook 'clojure-mode-hook 'esk-pretty-lambdas)

(auto-complete-mode)
(setq pretty-symbol-categories '(lambda relational logical))
(require 'pretty-symbols)
(add-hook 'clojure-mode-hook 'pretty-symbols-mode)
(add-hook 'cider-repl-mode-hook 'pretty-symbols-mode)
(setq pretty-symbol-categories '(lambda relational logical))
(add-to-list 'pretty-symbol-patterns
             '(?ƒ lambda "(\\(fn\\)\\>" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?λ lambda "\\(#\\)(" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∈ lambda "\\(#\\){" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≠ lambda "!=" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≠ lambda "/=" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≥ lambda ">=" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≤ lambda "<=" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∧ lambda "&&" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∧ lambda "\\<and\\>" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∨ lambda "||" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∨ lambda "\\<or\\>" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?¬ lambda "\\<not\\>" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∅ lambda "nil" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?√ lambda "sqrt" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∑ lambda "sum" (clojure-mode cider-repl-mode) 1))



(provide 'personal)
;;; personal.el ends here
