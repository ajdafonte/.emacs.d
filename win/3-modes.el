;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Modes related configs         ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(message "Loading modes related configs (windows). My current config path is: %s" *my-config-path*)

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
(require 'sql)
(setq sql-mysql-program "C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe")
(setq sql-mysql-options '("-C" "-t" "-f" "-n"))
;; (sql-set-product-feature 'mysql :prompt-regexp "^\\(MariaDB\\|mysql\\) \\[[_a-zA-Z]*\\]> ")
;; (use-package sql
;;   :config
;;   (progn
;;     ;; (sql-set-product-feature 'mysql :prompt-regexp 
;;     ;;                          "^\\(MariaDB\\|MySQL\\) \\[[_a-zA-Z]*\\]> ")
    
;;     )
;;   )


;; (setq sql-mysql-login-params
;;       '((user :default "caires")
;;         (password :default "fcporto*10")
;;         (database :default "menagerie")
;;         (server :default "localhost")
;;         (port :default 3306)))

;; (defun sql-add-newline-first (output)
;;    "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
;;   (concat "\n" output))

;; (defun sqli-add-hooks ()
;;   "Add hooks to `sql-interactive-mode-hook'."
;;   ;; (sql-set-product-feature 'mysql :prompt-regexp "^\(?:mysql\\|mariadb\).*> ")
;;   (add-hook 'comint-preoutput-filter-functions
;;             'sql-add-newline-first))

;; (add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

;; ;; (add-hook 'sql-interactive-mode-hook
;; ;;               (function (lambda ()
;; ;;                           (setq comint-output-filter-functions 'comint-truncate-buffer
;; ;;                                 comint-buffer-maximum-size 5000
;; ;;                                 comint-scroll-show-maximum-output t
;; ;;                                 comint-input-ring-size 500))))

;; ;; (defun my-comint-init ()
;; ;;            (setq comint-process-echoes t))
;; ;; (add-hook 'comint-mode-hook 'my-comint-init)


;; ;; (defun sqli-add-hooks () "My hooks for sql-interactive-mode" ) (add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

;; ;; (sql-set-product-feature 'mysql :prompt-regexp "^[mM]y[sS][qQ][lL][^>]*> ")


;; ;; Silence compiler warnings
;; (defvar sql-product)
;; (defvar sql-prompt-regexp)
;; (defvar sql-prompt-cont-regexp)

;; (add-hook 'sql-interactive-mode-hook 'my-sql-interactive-mode-hook)
;; (defun my-sql-interactive-mode-hook ()
;;   "Custom interactive SQL mode behaviours. See `sql-interactive-mode-hook'."
;;   (when (eq sql-product 'mysql)
;;     ;; Allow symbol chars in database names in prompt.
;;     ;; Default postgres pattern was: "^\\w*=[#>] " (see `sql-product-alist').
;;     (setq sql-prompt-regexp "^[mM]y[sS][qQ][lL][^>]*> ")
;;     ;; Ditto for continuation prompt: "^\\w*[-(][#>] "
;;     ;; (setq sql-prompt-cont-regexp "^\\(?:\\sw\\|\\s_\\)*[-(][#>] "))
;;     )

;;   ;; Deal with inline prompts in query output.
;;   ;; Runs after `sql-interactive-remove-continuation-prompt'.
;;   (add-hook 'comint-preoutput-filter-functions
;;             'my-sql-comint-preoutput-filter :append :local))

;; (defun my-sql-comint-preoutput-filter (output)
;;   "Filter prompts out of SQL query output.

;; Runs after `sql-interactive-remove-continuation-prompt' in
;; `comint-preoutput-filter-functions'."
;;   ;; If the entire output is simply the main prompt, return that.
;;   ;; (i.e. When simply typing RET at the sqli prompt.)
;;   (if (string-match (concat "\\`\\(" sql-prompt-regexp "\\)\\'") output)
;;       output
;;     ;; Otherwise filter all leading prompts from the output.
;;     ;; Store the buffer-local prompt patterns before changing buffers.
;;     (let ((main-prompt sql-prompt-regexp)
;;           (any-prompt comint-prompt-regexp) ;; see `sql-interactive-mode'
;;           (prefix-newline nil))
;;       (with-temp-buffer
;;         (insert output)
;;         (goto-char (point-min))
;;         (when (looking-at main-prompt)
;;           (setq prefix-newline t))
;;         (while (looking-at any-prompt)
;;           (replace-match ""))
;;         ;; Prepend a newline to the output, if necessary.
;;         (when prefix-newline
;;           (goto-char (point-min))
;;           (unless (looking-at "\n")
;;             (insert "\n")))
;;         ;; Return the filtered output.
;;         (buffer-substring-no-properties (point-min) (point-max))))))

;; (defadvice sql-send-string (before my-prefix-newline-to-sql-string)
;;   "Force all `sql-send-*' commands to include an initial newline.

;; This is a trivial solution to single-line queries tripping up my
;; custom output filter.  (See `my-sql-comint-preoutput-filter'.)"
;;   (ad-set-arg 0 (concat "\n" (ad-get-arg 0))))
;; (ad-activate 'sql-send-string)
