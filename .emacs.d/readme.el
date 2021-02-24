(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default 1)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(kill-buffer "*scratch*")

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard"
        dashboard-startup-banner "~/dotfiles/assets/banner.png"
        dashboard-center-content nil
        dashboard-show-shortcuts nil
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-items '((bookmarks . 20)
                          (projects . 20)
                          (agenda . 20))
        dashboard-set-navigator t))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Fira Code"))

(use-package fira-code-mode)

(use-package doom-modeline
             :config
             (doom-modeline-mode 1))

(use-package nord-theme
  :config
  (use-package doom-themes)
  (load-theme 'doom-nord 1)
  (load-theme 'nord 1))

(delete-selection-mode t)

(setq vc-handled-backends nil)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(global-auto-revert-mode 1)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p "custom.el") (load "custom"))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(blink-cursor-mode 0)

(defun my-bell-function ())
(setq ring-bell-function 'my-bell-function)
(setq visible-bell nil)

(setq backup-inhibited t
      make-backup-files nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "C-c l o") 'browse-url-at-point)

(global-set-key (kbd "C-c r") 'replace-regexp)

(use-package beacon
  :config
  (beacon-mode 1)
  (setq beacon-blink-delay 0.2
        beacon-blink-duration 0.5
        beacon-blink-when-window-changes nil
        beacon-blink-when-window-scrolls nil
        beacon-color "#ebcb8b"
        beacon-size 50))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq css-indent-offset 2)
(add-hook 'css-mode-hook 'dev-mode)

(use-package magit
  :bind
  ("C-c m s" . magit-status)
  ("C-c m c" . magit-checkout))

(defun my-org-mode ()
  (emojify-mode 1)
  (org-indent-mode 1)
  (olivetti-mode 1)
  (flyspell-mode 1)
  (read-only-mode 1) ;; C-x C-q to toggle
  (setq olivetti-body-width 140))

(add-hook 'org-mode-hook 'my-org-mode)

(setq org-hide-emphasis-markers t)

(setq org-startup-with-inline-images t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("◉" "○")))

(custom-theme-set-faces
 'user
 '(org-link ((t (:overline t :underline t :foreground "#B48EAD" :weight bold)))))

(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-image-actual-width nil)

(setq org-emphasis-alist
      '(("*" bold)
        ("/" italic)
        ("_" underline)
        ("+" (:strike-through t))
        ("=" (:background "#bf616a" :foreground "#eceff4"))
        ("~" (:background "#a3be8c" :foreground "#eceff4"))))

(global-set-key (kbd "C-c o a") 'org-agenda)
(setq org-agenda-files (list "~/dropbox/org/"))

(let ((red "#bf616a")
      (orange "#d08770")
      (yellow "#ebcb8b")
      (green "#a3be8c")
      (purple "#b48ead")
      (blue "#5e81ac")
      (white "#eceff4"))

      (setq org-todo-keyword-faces `(("TODO" . ,yellow)
                                 ("PLAYING" . (:underline t :overline t :foreground ,purple :weight bold))
                                 ("PLANNED" . (:underline t :overline t :foreground ,orange :weight bold))
                                 ("FINISHED" .(:underline t :overline t :foreground ,green :weight bold))
                                 ("WATCHED" . (:underline t :overline t :foreground ,green :weight bold))
                                 ("STOPPED" . (:strike-through t :underline t :overline t :foreground ,red :weight bold))
                                 ("IN-PROGRESS" . ,orange)
                                 ("WAITING" . ,purple)3
                                 ("CANCELED" . ,red)
                                 ("DONE" . ,green))))

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (setq js-indent-level 2)
  (defun my-js-mode-hook ()
    (dev-mode t))
  (add-hook 'rjsx-mode-hook 'my-js-mode-hook))

(setq ruby-insert-encoding-magic-comment nil)
(defun my-ruby-mode-hook ()
  (dev-mode 1))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter
        sqlformat-args '("-s2" "-g")))

(defun my-sql-mode-hook ()
  "Load whenever sql-mode is loaded."
  (dev-mode t)
  (local-set-key (kbd "C-c C-f") 'sqlformat))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

(defun my-term-mode-hook ()
  "Load when term-mode is loaded."
  (define-key term-raw-map (kbd "C-c C-y") 'term-paste)) ;; paste clipboard into terminal

(add-hook 'term-mode-hook 'my-term-mode-hook)

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)

  (defun my-web-mode-hook ()
    (dev-mode t))

  (add-hook 'web-mode-hook  'my-web-mode-hook))

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package emojify)

(use-package git-gutter-fringe)

(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?\·
        highlight-indent-guides-auto-character-face-perc 20))

(use-package yafolding)

(use-package olivetti
  :hook
  (org-mode . olivetti-mode)
  (dashboard-mode . olivetti-mode))

(use-package ace-window
  :config
  (global-set-key (kbd "C-x o") 'ace-window))

(use-package ag
  :bind
  ("C-c s s" . ag)
  ("C-c s p" . ag-project)
  ("C-c s k" . ag-kill-buffers))

(use-package all-the-icons)

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-extra-directories nil)
  (defun eh-ivy-open-current-typed-path ()
    (interactive)
    (when ivy--directory
      (let* ((dir ivy--directory)
             (text-typed ivy-text)
             (path (concat dir text-typed)))
        (delete-minibuffer-contents)
        (ivy--done path))))
  (define-key ivy-minibuffer-map (kbd "<return>") 'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "C-f") 'eh-ivy-open-current-typed-path))

(global-set-key "\C-s" 'swiper)

(use-package counsel
  :requires (ivy)
  :config (counsel-mode 1)
  (global-set-key (kbd "C-c y") 'counsel-yank-pop))

(use-package ivy-rich
  :requires (ivy)
  :config (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :requires (all-the-icons ivy ivy-rich)
  :config (all-the-icons-ivy-rich-mode 1))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))

(use-package counsel-projectile
  :requires (ivy counsel projectile)
  :config (counsel-projectile-mode 1))

(use-package reveal-in-osx-finder
  :bind ("C-c z" . reveal-in-osx-finder))

(use-package which-key
  :config
  (which-key-mode 1))

(use-package expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(defun cleanup-file ()
  (untabify (point-min) (point-max))
  (whitespace-cleanup))

(defun cleanup-file-on-save ()
  (add-hook 'before-save-hook 'cleanup-file nil t))

(defun stop-cleanup-file-on-save ()
  (remove-hook 'before-save-hook 'cleanup-file t))

(defun dev-setup ()
  ;; spell correct in comments
  (flyspell-prog-mode)
  ;; display line numbers
  (display-line-numbers-mode 1)
  ;; It change all cursor movement/edit commands to stop in-between the “camelCase” words.
  (subword-mode 1)
  ;; highlight current line/row
  (hl-line-mode 1)
  ;; show symbols in a neat way =>, >=, ==, ...
  (fira-code-mode 1)
  ;; highlight indents with dots.
  (highlight-indent-guides-mode 1)
  ;; show git changes on the side.
  (git-gutter-mode 1)
  ;; do not wrap!
  (setq truncate-lines t)
  ;; remove trailing white space and turn tabs into spaces
  (cleanup-file-on-save)
  ;; code folding.
  (yafolding-mode 1)
  (local-set-key (kbd "C-M-return") 'yafolding-toggle-all)
  (local-set-key (kbd "C-return") 'yafolding-toggle-element))

(defun dev-teardown ()
  (flyspell-mode -1) ;; disable flyspell-prog-mode
  (display-line-numbers-mode -1)
  (subword-mode -1)
  (hl-line-mode -1)
  (fira-code-mode -1)
  (yafolding-mode -1)
  (highlight-indent-guides-mode -1)
  (git-gutter-mode -1)
  (setq truncate-lines nil)
  (stop-cleanup-file-on-save))

(define-minor-mode dev-mode
  "Hammer time!."
  :lighter " dev"
  (if dev-mode
      (dev-setup)
    (dev-teardown)))

(defun named-term (name)
  "Create a terminal with given name."
  (interactive "sName: ")
  (ansi-term "/bin/zsh" name))

(defun open-named-term (name)
  "Create or open a named terminal buffer"
  (interactive "sName:")
  (let ((buffer (concat "*" name "*")))
    (if (get-buffer buffer) (switch-to-buffer buffer) (named-term name))))

(defun open-console ()
  "Create or open terminal buffer."
  (interactive)
  (open-named-term "console"))

(global-set-key (kbd "C-c t") 'open-console)
(global-set-key (kbd "C-c T") 'open-named-term)
