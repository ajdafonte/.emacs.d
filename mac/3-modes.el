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




;; Add sound support
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; For MacOS, fix "This Emacs binary lacks sound support"
;; 
;; source info:
;; - https://github.com/leoliu/play-sound-osx/blob/master/play-sound.el
;; - update according to https://github.com/leoliu/play-sound-osx/issues/2#issuecomment-1088360638
;; - https://www.charlbotha.com/til/fix-emacs-sound-on-macos
(when (eq system-type 'darwin)
  (unless (and (fboundp 'play-sound-internal)
               (subrp (symbol-function 'play-sound-internal)))
    (defun play-sound-internal (sound)
      "Internal function for `play-sound' (which see)."
      (or (eq (car-safe sound) 'sound)
          (signal 'wrong-type-argument (list sound)))
 
      (cl-destructuring-bind (&key file data volume device)
          (cdr sound)
 
        (and (or data device)
             (error "DATA and DEVICE arg not supported"))
 
        (apply #'start-process "afplay" nil
               "afplay" (append (and volume (list "-v" volume))
                                (list (expand-file-name file data-directory))))))))

;; ORG mode - add default clock sound
(setq org-clock-sound "~/Downloads/ding.wav")



