(add-hook 'compilation-mode-hook 'ora-compilation-hook)
(add-hook 'ert-results-mode-hook 'ora-ert-results-hook)
(add-hook 'dired-mode-hook 'ora-dired-hook)
(add-hook 'proced-mode-hook 'ora-proced-hook)
(add-hook 'c-mode-common-hook 'ora-c-common-hook)
(add-hook 'c-mode-hook 'ora-c-hook)
(add-hook 'c++-mode-hook 'ora-c++-hook)
(add-hook 'clojure-mode-hook 'ora-clojure-hook)
(add-hook 'scheme-mode-hook 'ora-scheme-hook)
(add-hook 'python-mode-hook 'ora-python-hook)
(add-hook 'inferior-python-mode-hook 'ora-inferior-python-hook)
(add-hook 'hy-mode-hook 'ora-hy-hook)
(add-hook 'ruby-mode-hook 'ora-ruby-hook)
(add-hook 'j-mode-hook 'ora-j-hook)
(add-hook 'cider-mode-hook 'ora-cider-hook)
(add-hook 'cider-repl-mode-hook 'ora-cider-hook)
(add-hook 'java-mode-hook 'ora-java-hook)
(add-hook 'js-mode-hook 'ora-javascript-hook)
(add-hook 'markdown-mode-hook 'ora-markdown-hook)
(add-hook 'LaTeX-mode-hook 'ora-latex-hook)
(add-hook 'latex-mode-hook 'ora-latex-hook)
(add-hook 'matlab-mode-hook 'ora-matlab-hook)
(add-hook 'matlab-shell-mode-hook 'ora-matlab-shell-hook)
(add-hook 'octave-mode-hook 'ora-octave-hook)
(add-hook 'sml-mode-hook 'ora-sml-hook)
(add-hook 'org-mode-hook 'ora-org-hook)
(add-hook 'org-agenda-mode-hook 'ora-org-agenda-hook)
(add-hook 'emacs-lisp-mode-hook 'ora-emacs-lisp-hook)
(add-hook 'lisp-interaction-mode-hook 'ora-lisp-interaction-hook)
(add-hook 'lisp-mode-hook 'ora-lisp-hook)
(add-hook 'occur-mode-hook 'ora-occur-mode-hook)
(add-hook 'occur-hook 'ora-occur-hook)
(add-hook 'Buffer-menu-mode-hook 'ora-Buffer-menu-hook)
(add-hook 'bookmark-bmenu-mode-hook 'ora-bmenu-hook)
(add-hook 'vc-dir-mode-hook 'ora-vc-dir-hook)
(add-hook 'git-commit-mode-hook 'ora-git-commit-hook)
(eval-after-load 'magit
  '(if (featurep 'magit-utils)
    (require 'ora-nextmagit)
    (add-hook 'magit-status-mode-hook 'ora-magit-status-hook)
    (add-hook 'magit-log-mode-hook 'ora-magit-log-hook)
    (add-hook 'magit-commit-mode-hook 'ora-magit-commit-hook)
    (add-hook 'magit-diff-mode-hook 'ora-magit-diff-hook)
    (add-hook 'magit-branch-manager-mode-hook 'ora-magit-branch-manager-hook)))
(add-hook 'ediff-mode-hook 'ora-ediff-hook)
(add-hook 'diff-mode-hook 'ora-diff-hook)
(add-hook 'package-menu-mode-hook 'ora-package-menu-hook)
(add-hook 'mu4e-headers-mode-hook 'ora-mu4e-headers-hook)
(add-hook 'mu4e-compose-mode-hook 'ora-mu4e-compose-hook)
(add-hook 'gnus-article-mode-hook 'ora-gnus-article-hook)
(add-hook 'gnus-summary-mode-hook 'ora-gnus-summary-hook)
(add-hook 'gnus-group-mode-hook 'ora-gnus-group-hook)
(add-hook 'message-mode-hook 'ora-message-hook)
(add-hook 'text-mode-hook 'ora-text-hook)
(add-hook 'term-exec-hook 'ora-term-exec-hook)
(add-hook 'term-mode-hook 'ora-term-hook)
(add-hook 'makefile-mode-hook 'ora-makefile-hook)
(add-hook 'makefile-gmake-mode-hook 'ora-makefile-hook)
(add-hook 'doc-view-mode-hook 'ora-doc-view-hook)
(add-hook 'pdf-view-mode-hook 'ora-pdf-view-hook)
(add-hook 'help-mode-hook 'ora-help-hook)
(add-hook 'eltex-mode-hook 'ora-eltex-hook)
(add-hook 'Info-mode-hook 'ora-Info-hook)
(add-hook 'sh-mode-hook 'ora-sh-hook)
(add-hook 'eww-mode-hook 'ora-eww-hook)
(add-hook 'nxml-mode-hook 'ora-nxml-hook)
(add-hook 'tar-mode-hook 'ora-tar-hook)
(add-hook 'ibuffer-mode-hook 'ora-ibuffer-hook)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(eval-after-load 'helm '(require 'ora-helm))
(add-hook 'image-mode-hook 'ora-image-hook)
(eval-after-load 'grep
  '(define-key grep-mode-map (kbd "C-x C-q") 'wgrep-change-to-wgrep-mode))
(eval-after-load 'wgrep
  '(define-key grep-mode-map (kbd "C-c C-c") 'wgrep-finish-edit))
(add-hook 'command-history-hook 'lispy-mode)

(require 'ora-elisp-style-guide)
(use-package lispy
    :config
  (progn
    (setq lispy-no-permanent-semantic t)
    (setq lispy-helm-columns '(70 100))
    (lispy-set-key-theme '(oleh special lispy c-digits))
    (setq lispy-avy-style-symbol 'at-full)))

(defun ora-package-symbol ()
  (interactive)
  (let ((prefix (concat (file-name-nondirectory
                         (directory-file-name
                          (file-name-directory (buffer-file-name))))
                        "-")))
    (unless (looking-back prefix (line-beginning-position))
      (insert prefix))
    (counsel-el)))

(define-key lisp-mode-shared-map "β" 'counsel-el)
(define-key lisp-mode-shared-map (kbd "C-β") 'ora-package-symbol)
(define-key lisp-mode-shared-map (kbd "C-c C-z")
  (lambda ()
    (interactive)
    (switch-to-buffer-other-window "*scratch*")))
(define-key lisp-mode-shared-map (kbd "C-c C-l") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-M-i") nil)
(define-key lisp-interaction-mode-map (kbd "C-M-i") nil)

(defun lisp--match-hidden-arg (limit) nil)

(setq prettify-symbols-alist
      '(("lambda" . ?λ)))
(font-lock-add-keywords 'emacs-lisp-mode
                        (ora-fontify-glyph "\\\\\\\\|" "∨"))
(font-lock-add-keywords 'emacs-lisp-mode
                        (ora-fontify-glyph "\\\\\\\\(" "("))
(font-lock-add-keywords 'emacs-lisp-mode
                        (ora-fontify-glyph "\\\\\\\\)" ")"))
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("^;;;###[-a-z]*autoload.*$" 0 'shadow t))
                        'end)
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("=\\([^=\n]+\\)=" 1 font-lock-string-face prepend)))

(when (version< emacs-version "24.4")
  (defun prettify-symbols-mode ()))

(defun ora-emacs-lisp-hook ()
  (ignore-errors
    (prettify-symbols-mode)
    (lispy-mode 1)
    (company-mode)
    (set (make-local-variable 'company-backends)
         '((company-elisp :with company-dabbrev-code)))
    (abel-mode)
    (diminish 'abbrev-mode)
    ;; (yas-minor-mode-on)
    (auto-compile-mode 1)
    (semantic-mode -1)))

(defun conditionally-enable-lispy ()
  (when (eq this-command 'eval-expression)
    (lispy-mode 1)))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

(defun ora-lisp-interaction-hook ()
  (lispy-mode 1)
  (company-mode 1))

(defalias 'tt 'ora-terminal)
(defalias 'sc 'shell-command-to-string)
(defalias 'cal 'calendar)
(provide 'hooks)
