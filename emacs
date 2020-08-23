(require 'server)
(unless (server-running-p) (server-start))

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(unless (package-installed-p 'doom-themes)
    (package-refresh-contents)
    (package-install 'doom-themes))

(unless (package-installed-p 'doom-modeline)
    (package-refresh-contents)
    (package-install 'doom-modeline))

(unless (package-installed-p 'all-the-icons)
    (package-refresh-contents)
    (package-install 'all-the-icons))

(use-package doom-themes
    :ensure t
    :config
    (load-theme 'doom-vibrant t))

(use-package doom-modeline
    :ensure t
    :init (doom-modeline-mode 1))

(use-package all-the-icons
    :ensure t)

(unless (package-installed-p 'proof-general)
    (package-refresh-contents)
    (package-install 'proof-general))
(unless (package-installed-p 'company-coq)
    (package-refresh-contents)
    (package-install 'company-coq))
(add-hook 'coq-mode-hook #'company-coq-mode)

(setq evil-want-abbrev-expand-on-insert-exit nil)

;; Download Evil
(unless (package-installed-p 'evil)
    (package-refresh-contents)
    (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; Download Evil
(unless (package-installed-p 'nlinum-relative)
    (package-refresh-contents)
    (package-install 'nlinum-relative))
(require 'nlinum-relative)
;; (nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(add-hook 'coq-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "")      ;; or "" for display current line number

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t)

;; Show-paren-mode settings
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Electric-modes settings
(electric-pair-mode    1)
(electric-indent-mode -1)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1)
(tool-bar-mode     -1)
(scroll-bar-mode   -1)
(blink-cursor-mode -1)
(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore) 

;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

(set-language-environment 'UTF-8)
(progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))

;; Display file size/time in mode-line
(setq display-time-24hr-format t)
(display-time-mode             t)
(size-indication-mode          t) ;; размер файла в %-ах

;; Indent settings
(setq-default tab-width          4)
(setq-default standart-indent    4)

;; Scrolling settings
(setq scroll-step   1)
(setq scroll-margin 2)
(setq scroll-conservatively 10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

(use-package proof-general
    :ensure t
    :no-require t
    :custom-face
    (proof-queue-face  ((t (:background "#392C7A"))))
    (proof-locked-face ((t (:background "#212F47")))))
