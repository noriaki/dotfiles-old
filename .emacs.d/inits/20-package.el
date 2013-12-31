(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    markdown-mode
    css-mode
    scss-mode
    ruby-block
    motion-mode
    google-c-style
    yaml-mode
    flymake-easy
    flymake-ruby
    exec-path-from-shell
    yasnippet
    auto-complete
    apache-mode
    ssh-config-mode
    key-combo
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
