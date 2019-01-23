;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;; Keyboard related configs      ;; 
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(message "Loading keyboard related configs. My current config path is: %s" *my-config-path*)


;; Key bindings
;;;;;;;;;;;;;;;;;;

(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)

;; 
(global-set-key [C-down] 'search-mod-date-forward)
(global-set-key [C-up] 'search-mod-date-backward)

;;
(global-set-key (kbd "C-c r") 'revert-buffer)


;; Key bindings - functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Search forward modification date.
(defun search-mod-date-forward ()
  (interactive)
  (if (search-forward *default-mod-date* nil t)
      (forward-line 2)
      (message "Modification date %s not found forward in buffer."
        *default-mod-date*)))
 

;;; Search backward modification date.
(defun search-mod-date-backward ()
  (interactive)
  (unless (search-backward *default-mod-date* nil t)
    (message "Modification date %s not found backward in buffer."
      *default-mod-date*)))


;; from: https://gitorious.org/gnu-emacs-config/mainline/blobs/a3fe6e69d9a752ef094448bfdf1794ce39916f4d/dotemacs.el
(defun comment-or-uncomment-region-or-line ()
  "Like comment-or-uncomment-region, but if there's no mark \(that means no 194 region\) apply comment-or-uncomment to the current line"
  (interactive)
  (if (not mark-active)
      (comment-or-uncomment-region
       (line-beginning-position) (line-end-position))
      (if (< (point) (mark))
          (comment-or-uncomment-region (point) (mark))
          (comment-or-uncomment-region (mark) (point)))))

;; from: http://tuxicity.se/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;; from: http://stackoverflow.com/questions/5898448/how-to-add-a-new-line-without-breaking-the-current-line
(defun newline-without-break-of-line ()
  "1. remove to end of the line.
  2. insert newline with index"
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
