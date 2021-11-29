;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;     .emacs definition         ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup MELPA
;; from: http://melpa.milkbox.net/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; added for flycheck
(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; exec-path-from-shell
;; A GNU Emacs library to ensure environment variables inside Emacs look the same as in the user's shell.
;; used for flycheck configuration
;; from: https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; 1) System-specific configuration ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; variables
(defconst *root-config-path* "~/.emacs.d/")
(defconst *all-configs* (list :common (list :dir "common/" :files '("f-common.el"))
			      :win (list :dir "win/" :files '("f-win.el"))
			      :mac (list :dir "mac/" :files '("f-mac.el"))
                              :linux (list :dir "unix/" :files '("f-linux.el"))))
(defvar *my-config-path* nil)

;; helper functions

(defun create-path (path file-or-dir)
  (concat (file-name-as-directory path) file-or-dir))

;; Splitting your configuration up into separate files
(defun load-path-and-files (path files)
  (add-to-list 'load-path path)
  (dolist (file files)
    (let ((file-path (create-path path file)))
      (unless (file-directory-p file-path)
        (load-library file)))))

(defun process-system-configs (config-type)
  (let ((config (plist-get *all-configs* config-type))
	)
    (message ">> Start loading %s configs..." config-type)
    (setf *my-config-path* (create-path *root-config-path* (plist-get config :dir)))
    ;; (load-path-and-files *my-config-path* (plist-get win-config :files))
    (load-path-and-files *my-config-path*
			 ;; use this regexp to remove . and .. that are returned by the 'directory-files'
			 (directory-files *my-config-path* nil "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)"))
    (message ">> End loading %s configs..." config-type)
    ))

(defun get-os-type ()
  (cond ((eq system-type 'windows-nt) :win)
	((eq system-type 'gnu/linux) :linux)
        ((eq system-type 'darwin) :mac)
	(t ;; Other-system code
	 (error "Undefined system detected. Unable to load emacs configurations."))))

(defun load-system-configs ()
  ;; load common configs
  (process-system-configs :common)
  ;; load system specific configs
  (process-system-configs (get-os-type))
  )

;; main functionality
(load-system-configs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                             ;;
;; 2) Using variables to turn sections on and off ;; 
;;                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Example
;; (defvar *paredit-enabled* nil)  ;; paredit-mode
;; (when *paredit-enabled*
;;   (autoload 'enable-paredit-mode "paredit" 
;;             "Turns on pseudo-structural editing of Lisp code." t)
;;   (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;;   (add-hook 'scheme-mode-hook 'enable-paredit-mode))



;; SQL
;; (setq sql-mysql-program "C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe")

;; Remarks:
;; - For more details about .emacs tips about structure see https://www.emacswiki.org/emacs/DotEmacsStructuring

;; SRC: http://wikemacs.org/wiki/Emacs_server
;; To start a server in an existing Emacs session
(server-start)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xml-format exec-path-from-shell flycheck-plantuml flycheck-yamllint indent-tools yaml-mode json-mode sqlup-mode request use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
