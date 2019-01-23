;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Style related configs         ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(message "Loading keyboard related configs. My current config path is: %s" *my-config-path*)

;; Setup themes and load a specific theme
(add-to-list 'custom-theme-load-path (create-path *my-config-path* "themes/"))
(load-theme 'ample-zen t)

;; Define generic settings
(defalias 'yes-or-no-p 'y-or-n-p)
(setq display-time-24hr-format t)
(display-time)
(delete-selection-mode nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 1)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(show-paren-mode)

(blink-cursor-mode 0)
(line-number-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)

;; from: http://www.linux-pages.com/2012/06/how-to-enabledisable-word-wrap-in-emacs/
;; (setq-default truncate-lines nil) 
