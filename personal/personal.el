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
;;(load-theme 'solarized-dark t)

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
(global-auto-complete-mode 1)

(guru-global-mode -1)

(setq pretty-symbol-categories '(lambda relational logical))
(require 'pretty-symbols)
(add-hook 'clojure-mode-hook 'pretty-symbols-mode)
(add-hook 'cider-repl-mode-hook 'pretty-symbols-mode)
(add-hook 'extempore-mode-hook 'pretty-symbols-mode)
(add-hook 'prog-mode-hook 'pretty-symbols-mode)
(setq pretty-symbol-categories '(lambda relational logical))
(add-to-list 'pretty-symbol-patterns
             '(?ƒ lambda "(\\(fn\\)\\>" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?λ lambda "(\\(lambda\\)\\>" (clojure-mode cider-repl-mode extempore-mode prog-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?λ lambda "\\(#\\)(" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?∈ lambda "\\(#\\){" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≠ lambda "!=" (clojure-mode cider-repl-mode) 1))
(add-to-list 'pretty-symbol-patterns
             '(?≠ lambda "<>" (clojure-mode cider-repl-mode extempore-mode prog-mode) 1))
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
             '(?∑ lambda "sum" (clojure-mode cider-repl-mode extempore-mode) 1))

(setq visible-bell t)
(setq inhibit-startup-message t)

(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(defadvice isearch-repeat (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)))

(setq user-extempore-directory "/usr/local/Cellar/extempore/0.51/")

(autoload 'extempore-mode (concat user-extempore-directory "extras/extempore.el") "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

(autoload #'llvm-mode (concat user-extempore-directory "extras/llvm-mode.el")
  "Major mode for editing LLVM IR files" t)

(add-to-list 'auto-mode-alist '("\\.ir$" . llvm-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . llvm-mode))

(setq prelude-guru nil)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)

(key-chord-define-global "ff" 'ace-jump-word-mode)
(key-chord-define-global "fd" 'ace-jump-line-mode)
(key-chord-define-global "fs" 'ace-jump-char-mode)
(key-chord-define-global "JJ" 'prelude-switch-to-previous-buffer)
(key-chord-define-global "uu" 'undo-tree-visualize)
(key-chord-define-global "ww" 'execute-extended-command)
(key-chord-define-global "yy" 'browse-kill-ring)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'personal)
;;; personal.el ends here
