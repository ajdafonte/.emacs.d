;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Modes related configs         ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(message "Loading modes related configs. My current config path is: %s" *my-config-path*)

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


;; ORG-MODE
;; from: http://orgmode.org/elpa.html
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib
  :config
  (progn
    ;; REF: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
    (setq org-log-done t)
    
    ;; Example of org-agenda-files
    ;; REF:: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
    ;; (setq org-agenda-files (list "~/dtec-aux/notes.org/work.org"))
    
    ;; Catching invisible edits
    ;; REF:: http://orgmode.org/manual/Catching-invisible-edits.html#Catching-invisible-edits
    (setq org-catch-invisible-edits t)

    ;; In Emacs 23, shift-selection-mode is on by default, meaning that cursor motions combined with the shift key should start or enlarge regions. This conflicts with the use of S-<cursor> commands in Org to change timestamps, TODO keywords, priorities, and item bullet types if the cursor is at such a location. 
;; from: http://orgmode.org/manual/Conflicts.html
    (setq org-support-shift-select t)
    ))

;; IDO-MODE
;; from: http://www.emacswiki.org/emacs/InteractivelyDoThings
(use-package ido
             :config
             (ido-mode t))

;; UNIQUIFY - unique name buffers
;; from: http://www.emacswiki.org/emacs/uniquify
;; from: http://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(use-package uniquify
  :config
  (progn
    ;; (setq uniquify-buffer-name-style 'post-forward
    ;;       uniquify-separator ":")
               (setq uniquify-buffer-name-style 'reverse)
               (setq uniquify-separator "/")
               (setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
               (setq uniquify-ignore-buffers-re "^\\*")))

;; Request.el -- Easy HTTP request for Emacs Lisp
;; from: https://github.com/tkf/emacs-request
(use-package request)
