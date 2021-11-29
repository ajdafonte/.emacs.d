;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Modes related configs         ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(message "Loading modes related configs (mac os). My current config path is: %s" *my-config-path*)

;; Remarks: Organizing package-related configuration with 'use-package'
;; install UsePackage and use it to group together commands and keybindings related to a package. If you would like to optimize your Emacs startup, you can use UsePackage to time how long packages take to load and define your own autoloads so that Emacs doesn’t load packages until you call those commands.

;; (use-package color-moccur
;;       :commands (isearch-moccur isearch-all)
;;       :bind ("M-s O" . moccur)
;;       :init
;;       (bind-key "M-o" 'isearch-moccur isearch-mode-map)
;;       (bind-key "M-O" 'isearch-moccur-all isearch-mode-map)
;;       :config
;;       (use-package moccur-edit))


;; SQL
;; to be defined (if needed)
