;; -*- lexical-binding: t; -*-

;; General Config
;; Used daviwil emacs-from-scratch sample config as the basis
;; https://github.com/daviwil/emacs-from-scratch/blob/43c0401355c7971cb4491690ee4b8449505a5d58/init.el
;;

(setq user-mail-address "babos.csaba@yourweb.hu")

;; Default Font
(add-to-list 'default-frame-alist
	     '(font . "Space Mono for Powerline-18"))
(set-face-attribute 'mode-line nil :font "Space Mono for Powerline-10")

;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Zoom Text if needed
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c e") 'eshell)

;; Screen settings
(scroll-bar-mode -1)  ; No Scrollbar
(tool-bar-mode -1)    ; No Toolbar 
(tooltip-mode -1)     ; No tooltip (nowhere to show so why have it...)
(menu-bar-mode -1)    ; Disable menus
(set-fringe-mode 10)  ; How much space on the sides for symbols
(setq visible-bell t) ; Try to flicker screen if there's error

(set-frame-parameter nil 'fullscreen 'fullboth) ; Set fullscreen on Mac

;; Editor settings
(global-display-line-numbers-mode t)

(load-theme 'wombat)  ; Until something better comes

;; Mode line
(column-number-mode)

;; Package control
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Fetch repos if they aren't loaded yet
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; All The icons
(use-package all-the-icons)
(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook 'dired-mode-hook 'text-scale-decrease 2)

;; Dired sidebar
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :bind (("C-x C-d" . dired-sidebar-toggle-sidebar)))

;; Doom Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Show keybindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; Org Settings
(setq org-directory "~/Work/OrgRoam")
(setq org-agenda-files '("~/Work/OrgRoam"))
(setq org-agenda-prefix-format '(
 (agenda . " %i %-12:c%?-12t% s")
 (timeline . "  % s")
 (todo . " %i %-12:c")
 (tags . " %i %-12:c")
 (search . " %i %-12:c")))
(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "CANCELLED")))
(setq org-capture-templates '(
      ("t" "TODO Entry" entry (file "~/Work/OrgRoam/Tasks.org")
       "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
      ("d" "Developer (personal) Task" entry (file "~/Work/OrgRoam/developer_tasks.org")
       "* TODO %?\n%u\n")
      ("u" "Uplezz Task" entry (file "~/Work/OrgRoam/uplezz_tasks.org")
       "* TODO %?\n%u\n")
      ("h" "Home Task" entry (file "~/Work/OrgRoam/home_tasks.org")
       "* TODO %?")
      ("m" "EPAM DMS Task" entry (file "~/Work/OrgRoam/epam_dms_tasks.org")
       "* TODO %?\n%u\n")
      ("l" "EPAM PTL Task" entry (file "~/Work/OrgRoam/epam_ptl_tasks.org")
       "* TODO %?\n%u\n")
      ("p" "EPAM Project Task" entry (file "~/Work/OrgRoam/epam_project_tasks.org")
       "* TODO %?\n%u\n")
      ))
(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 0)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t)
  :bind (
	 ("C-c t" . org-capture)
	)
  )

;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                          (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Org Roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Work/OrgRoam")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("a" "Article" plain
      "%?"
      :if-new (file+head "${slug}.org" "#+title: ${title}\n\n")
      :unnarrowed t)
     ("p" "PTL Team Member" entry
      "* Bio\n- LVL: D?\n- LVL Since: yyyy-hh-dd\n- Project: __addProjectHere__\n- UPSA: https://upsa.epam.com/workload/employeeView.do?employeeId=__emplId__\n- People: https://people.epam.com/profile/__emplId__\n- Telescope: https://telescope.epam.com/who/key/upsaId/__emplId__\n\n* Future Plans\n\n* Personal/Professional treats\n- \n\n* Trainings\n- \n\n"
      :if-new (file+head "${slug}.org" "#+title: ${title}\n\n")
      :unarrowed t)))
  
  (org-roam-complete-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c a" . org-agenda)
	 :map org-mode-map
         ("C-M-i" . completion-at-point-functions))
  :config
  (org-roam-setup))

(require 'org-roam)
(setq org-roam-graph-executable "/opt/homebrew/bin/dot")
(setq org-roam-graph-viewer "/usr/bin/open") ; Open with default SVG viewer on MacOS

; Mode specific changes
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Make sure org-indent face is available
(require 'org-indent)

(setq
 org-html-validation-link nil
 org-html-head-include-default-style nil
 org-html-head-include-scripts nil
 org-export-with-section-numbers nil
 org-export-with-author nil
 org-export-time-stamp-file nil
)

(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
           (path (concat dir "style.css"))
           (homestyle (or (null dir) (null (file-exists-p path))))
           (final (if homestyle "~/Work/emacs-exp-styles.css" path))) ;; <- set your own style file path
      (setq org-html-head (concat
                           "<style type=\"text/css\">\n"
                           "<!--/*--><![CDATA[/*><!--*/\n"
                           (with-temp-buffer
                             (insert-file-contents final)
                             (buffer-string))
                           "/*]]>*/-->\n"
                           "</style>\n")))))

(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons-dired org-static-blog org-bullets org-roam which-key rainbow-delimiters doom-modeline use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
