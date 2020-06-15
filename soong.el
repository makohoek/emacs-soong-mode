(defconst soong-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; " is a string delimiter too
    (modify-syntax-entry ?\" "\"" table)
    ;; // is a comment
    (modify-syntax-entry ?/ "<2" table)
    ;; \n is a comment ender
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode soong-mode prog-mode "Soong build system mode"
  :syntax-table soong-mode-syntax-table
  (font-lock-fontify-buffer))

;; keywords
(font-lock-add-keywords 'soong-mode
                        '(("cc_binary" . font-lock-keyword-face)
                          ("cc_shared" . font-lock-keyword-face)
                          ("confGroup:" . font-lock-keyword-face)
                          ("confType:" . font-lock-keyword-face)
                          ("domain:" . font-lock-keyword-face)
                          ("domainGroup:" . font-lock-keyword-face)
                          ("rule:" . font-lock-keyword-face)
                          ("rule:" . font-lock-keyword-face)
                          ("sequenceAware:" . font-lock-keyword-face)
                          ("supConf:" . font-lock-keyword-face)
                          ("supDomain:" . font-lock-keyword-face)))
;; builtins
;; these are not really builtins, but it's nice to have another
;; color for them (font-lock-builtin-face)
(font-lock-add-keywords 'soong-mode
                        '(("name" . font-lock-type-face)
                          ("ANY" . font-lock-type-face)
                          ("Is" . font-lock-type-face)
                          ("IsNot" . font-lock-type-face)
                          ("Includes" . font-lock-type-face)
                          ("Excludes" . font-lock-type-face)
                          ("ANY" . font-lock-type-face)))

(provide 'soong-mode)
