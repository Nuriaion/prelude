;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'eclim)
(global-eclim-mode)
(require 'eclimd)

(custom-set-variables
 '(eclim-eclipse-dirs '("~/Downloads/eclipse_cpp_kepler")))

;;(custom-set-variables
 ;;'eclimd-executable "~/Downloads/eclipse_cpp_kepler/eclimd")

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'eclim-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-emacs-eclim)
            (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;;(require 'company)
;;(require 'company-emacs-eclim)
;;(company-emacs-eclim-setup)
;;(global-company-mode t)

(provide 'eclim)
;;; eclim.el ends here
