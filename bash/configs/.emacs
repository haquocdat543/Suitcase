(require 'package)

;; Add MELPA to the list of package repositories
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system
(package-initialize)

;; Refresh the package list if needed
(unless package-archive-contents
  (package-refresh-contents))
;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Install and load the Dracula theme
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
