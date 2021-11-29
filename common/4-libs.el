;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Libs related configs          ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Indent-tools
;; from: https://gitlab.com/emacs-stuff/indent-tools/

(require 'indent-tools)
(global-set-key (kbd "C-c >") 'indent-tools-hydra/body)


;; Flycheck
;; from: https://www.flycheck.org/en/latest/user/installation.html#distribution-packages

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Flycheck-yaml
;; from: https://github.com/krzysztof-magosa/flycheck-yamllint

(require 'flycheck-yamllint)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))


;; xml-format
;; from: https://github.com/wbolster/emacs-xml-format

(add-hook 'nxml-mode-hook
          (lambda () (local-set-key (kbd "C-c C-f") #'xml-format-region)))
