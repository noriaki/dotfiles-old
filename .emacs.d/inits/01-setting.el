;; 対応する括弧をハイライト
(setq show-paren-delay 0)
(show-paren-mode t)

;; 編集時 buffer 再読み込み
(global-auto-revert-mode 1)

;; save-buffer 時，buffer 末尾に空行が常にあるように
(setq require-final-newline t)

;; auto-delete whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Emacs の質問を y/n に
(fset 'yes-or-no-p 'y-or-n-p)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

;; linum-mode をいじって Emacs を高速化
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; .svn は補完対象から外す
(add-to-list 'completion-ignored-extensions ".svn/")
;; .git は補完対象から外す
(add-to-list 'completion-ignored-extensions ".git/")
;; 補完は ignore-case で。
(setq completion-ignore-case t)

;; hide menu-bar
(menu-bar-mode -1)

;; ステータスラインに時間を表示する
(progn
  (setq display-time-24hr-format t)
  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
  (setq display-time-day-and-date t)
  (setq display-time-interval 30)
  (display-time))
