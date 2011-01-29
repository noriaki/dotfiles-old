;;;; -*- mode: emacs-lisp; coding: utf-8 -*-
;;;;

;; load-path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
       )
       load-path))

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 起動時の画面を表示しない
(setq inhibit-startup-message t)

(global-font-lock-mode t)

;;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)

;;; ctrl-h is backspace
(global-set-key "\C-h" 'delete-backward-char)

;; auto-delete whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; javascript,css http://webos-goodies.jp/archives/51180523.html
;; javascript-mode
(autoload 'javascript-mode "javascript" nil t)
(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
;; css-mode
(autoload 'css-mode "css-mode" nil t)
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

;; highlight whitespace
;;  http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))

;; auto-update time stamp when buffer saved
;;  http://homepage.mac.com/zenitani/elisp-j.html
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "// @updated        ")
;(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S")
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:00")
(setq time-stamp-end "$")
(setq time-stamp-line-limit 15)

;;
;; http://svn.coderepos.org/share/dotfiles/emacs/tokuhirom-emacs
;;
;; 見た目の設定
(progn
  (load "font-lock")                         ;; 色付ける
  (global-font-lock-mode t)
  (show-paren-mode)                          ;; 対応する括弧をハイライト
  (menu-bar-mode -1)                         ;; メニューバーを消す
  (setq transient-mark-mode t)               ;; 選択領域を色付け
  (line-number-mode t)                       ;; カーソルの位置が何行目かを表示する
  (column-number-mode t)                     ;; カーソルの位置が何桁目かを表示する
  (setq use-dialog-boxes nil)                ;; ダイアログボックスを使わない
  (setq mode-line-frame-identification " ")  ;; フレーム情報を隠す
  (setq visible-bell t)                      ;; visible-bell
  )

;;; ステータスラインに時間を表示する
(progn
  (setq display-time-24hr-format t)
  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
  (setq display-time-day-and-date t)
  (setq display-time-interval 30)
  (display-time))

;; tab width
(setq tab-width 4)

;; .svn は補完対象から外す
(add-to-list 'completion-ignored-extensions ".svn/")
;; 補完は ignore-case で。
(setq completion-ignore-case t)

;; 小括弧 () の色を定義
(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "#88aaff")

;; 中括弧 {} の色を定義
(defvar brace-face 'brace-face)
(make-face 'brace-face)
(set-face-foreground 'brace-face "#ffaa88")

;; 大括弧 [] の色を定義
(defvar bracket-face 'bracket-face)
(make-face 'bracket-face)
(set-face-foreground 'bracket-face "#aaaa00")

;; lisp-mode の色設定に追加
(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
                    lisp-font-lock-keywords-2))

(load "~/.emacs.d/themes/color-theme-library.el")
(require 'color-theme)
(color-theme-dark-laptop)
(global-font-lock-mode t)

;(load "~/.emacs.d/emacs-256color.el")

;; ruby-mode
;; 20090311
;; ruby-mode-init.el
;; Created: 2002-02-01
;;
(if (featurep 'xemacs)
    (setq load-path (cons "/usr/lib/xemacs/xemacs-packages/lisp/ruby-mode" load-path))
  (setq load-path (cons "~/.emacs.d/ruby-mode" load-path)))


(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("ruby" . ruby-mode) interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)))

;; rails-mode
;; 20090311
;; http://dima-exe.ru/rails-on-emacs
(setq load-path (cons "~/.emacs.d/emacs-rails" load-path))
(require 'rails)

;; deep-indent for ruby-mode
;; 20091004
;; http://www.hinet.mydns.jp/tdiary/?date=20060923
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (setq ruby-deep-indent-paren-style nil)))

;; yaml-mode
;; 20090321
;; http://d.hatena.ne.jp/ZOETROPE/20070424
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


(add-hook 'after-save-hook
          (function (lambda ()
                      (if (string= (expand-file-name "~/.emacs.el")
                                   (buffer-file-name))
                          (save-excursion
                            (byte-compile-file "~/.emacs.el"))))))

;; po-mode
;;  http://web.kyoto-inet.or.jp/people/jeanne/linux/wmaker-memo.html#02-1
(setq load-path
      (append '("/usr/share/emacs/site-lisp/")
              load-path))
(setq auto-mode-alist
      (cons '("\\.pox?\\'" . po-mode) auto-mode-alist))
(autoload 'po-mode "po-mode")

;; auto-complete-mode
;;  http://github.com/m2ym/auto-complete/blob/master/doc/manual.ja.txt
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;;;
;;; end of file
;;;

