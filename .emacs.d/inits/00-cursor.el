;; スクロール時の移動量を1に
(setq scroll-step 1)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; highlight whitespace
;;  http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))
