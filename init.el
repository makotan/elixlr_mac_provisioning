(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(unless (package-installed-p 'popwin)
  (package-install 'popwin))

(unless (package-installed-p 'direx)
  (package-install 'direx))

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))


(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)
(require 'direx-project)

(defun my/dired-jump ()
  (interactive)
  (cond (current-prefix-arg
         (dired-jump))
        ((not (one-window-p))
         (or (ignore-errors
               (direx-project:jump-to-project-root) t)
             (direx:jump-to-directory)))
        (t
         (or (ignore-errors
               (direx-project:jump-to-project-root-other-window) t)
             (direx:jump-to-directory-other-window)))))

(global-set-key (kbd "C-x C-j") 'my/dired-jump)

;; widthは環境に合わせて調整してください。
(push '(direx:direx-mode :position left :width 40 :dedicated t)
      popwin:special-display-config)

(require 'alchemist)
(setq alchemist-project-compile-when-needed t)


(global-linum-mode t)
(add-hook 'after-init-hook 'global-company-mode)
;(define-key company-mode-map "\M-h" 'company-complete)
(setq company-idle-delay 0.3)
(setq company-minimum-prefix-length 2)

