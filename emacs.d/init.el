(server-start)

;; We don't want to type yes and no all the time so, do y and n
(defalias 'yes-or-no-p 'y-or-n-p)
;; Disable the horrid auto-save
(setq auto-save-default nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set packages to install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; You might already have this line
(package-initialize)
;; list the packages you want
(defvar package-list)
(setq package-list '(elpy autopair solarized-theme))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Elpy activation and configuration
(elpy-enable)
(setq elpy-rpc-python-command "python3.6")
(setq python-shell-interpreter "python3.6")
(setq python-shell-completion-native-enable nil)

;; Set python tab width...
(setq-default tab-width 2)
(setq-default python-indent 2)
;; (setq-default python-indent-offset 0)
(add-hook 'python-mode-hook
          (lambda ()
            (setq tab-width 2)))

;; We want to be able to see if there is a tab character vs a space.
;; global-whitespace-mode allows us to do just that.
;; Set whitespace mode to only show tabs, not newlines/spaces.
(require 'whitespace)
(setq whitespace-style '(tabs tab-mark))
;; Turn on whitespace mode globally.
(global-whitespace-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Tweaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; Overwrite region selected
(delete-selection-mode t)
;; Show column numbers by default
(setq column-number-mode t)
;; Use CUA to delete selections
(setq cua-mode t)
(setq cua-enable-cua-keys nil)
;; Prevent emacs from creating a bckup file filename~
(setq make-backup-files nil)
;; Show date and time in modeline
(display-time)
;; Settings for searching
(setq-default case-fold-search nil ;case sensitive searches by default
              search-highlight t) ;hilit matches when searching
;; Highlight the line we are currently on
(global-hl-line-mode 0)
;; Disable the toolbar at the top since it's useless
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))
;; Automatically at closing brace, bracket and quote
(require 'autopair)
(autopair-global-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The deeper blue theme is loaded but the resulting text
;; appears black in Aquamacs. This can be fixed by setting
;; the font color under Menu Bar->Options->Appearance->Font For...
;; and then setting "Adopt Face and Frame Parameter as Frame Default"
(if window-system
    (load-theme 'deeper-blue t)
  (load-theme 'wheatgrass t))
