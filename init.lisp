;; See:
;; - http://stumpwm.svkt.org/cgi-bin/wiki.pl/Tips_and_Tricks
;; - http://www.mygooglest.com/fni/stumpwm.html
;; - http://aperturefever.wordpress.com/tag/stumpwm/
;; - http://paste.lisp.org/display/73174
;; - http://www.emacswiki.org/emacs/StumpWM
;; (defcommand wanderlust () ()
;; 	    (emacs)
;; 	    (send-meta-key (current-screen) (kbd "M-x"))
;; 	    (window-send-string "wl")
;; 	    (send-meta-key (current-screen) (kbd "RET")))
;; For a the slime REPL eval the following in Emacs
;; (autopair-global-mode nil) ;post command hook issues
;; (slime-connect 127.0.0.1 4005)

(in-package :stumpwm)

(set-prefix-key (kbd "F20"))

;; Create an empty keymap.  If you want to create a new list of
;; bindings in the key binding tree, this is where you start.  To hang
;; frame related bindings off 'C-t C-f' one might use the following
;; code:
;; (defvar *my-frame-bindings*
;;   (let ((m (make-sparse-keymap)))
;;     (define-key m (kbd "f") "curframe")
;;     (define-key m (kbd "M-b") "move-focus left")
;;     m ; NOTE: this is important
;;     ))

;; (stumpwm:define-key *root-map* (kbd "C-f") '*my-frame-bindings*)

(define-keysym #x1008ff11 "XF86AudioLowerVolume")
(define-keysym #x1008ff12 "XF86AudioMute")
(define-keysym #x1008ff13 "XF86AudioRaiseVolume")

(redirect-all-output (data-dir-file "debug-output" "txt"))


;; (defvar *stumpwm-config-dir* "~/.stumpwm.d/"
;;   "StumpWM configuration directory.")

;; (defvar *stumpwm-source-dir* (concat *stumpwm-config-dir* "source/")
;;   "StumpWM source directory.")

;; (defvar *stumpwm-contrib-dir* (concat *stumpwm-source-dir* "contrib/")
;;   "StumpWM contrib directory.")

;; ;; Use Super as default modifier, need to be before the loading of
;; ;; sarcasm-keys.
;; ;; (setf *sarcasm-prefix-modifier* "s-")

;; ;; Contrib directory
;; (set-contrib-dir *stumpwm-contrib-dir*)

;; ;; User modules loading
;; (load (concat *stumpwm-config-dir* "user-module.lisp"))
;; (add-user-module-directory *stumpwm-config-dir*)
;; (load-user-module "utils" "sarcasm-keys" "sarcasm-theme" ;; "swank"
;; 		  "sarcasm-mpd")

;; (sarcasm-global-keys
;;  '(("c"         . "run-shell-command chromium-browser")
;;    ("e"         . "run-shell-command emacsclient -c")
;;    ("RET"       . "run-shell-command urxvtc")
;;    ("l"         . "run-shell-command xtrlock")
;;    ("r"         . "run-shell-command")
;;    ("Left"      . "gprev")
;;    ("Right"     . "gnext")
;;    ("b"         . "mode-line")
;;    ("C"         . "delete")
;;    (":"         . "eval")
;;    (";"         . "colon")
;;    ("S-Up"      . "move-focus up")
;;    ("S-Down"    . "move-focus down")
;;    ("S-Left"    . "move-focus left")
;;    ("S-Right"   . "move-focus right")
;;    ("C-S-Up"    . "move-window up")
;;    ("C-S-Down"  . "move-window down")
;;    ("C-S-Left"  . "move-window left")
;;    ("C-S-Right" . "move-window right")
;;    ("n"         . "next")
;;    ("N"         . "pull-hidden-next")
;;    ;; ("h"         . "banish");; *help-map*
;;    ("g"         . "abort")
;;    ("m"         . "lastmsg")
;;    ("1"         . "gselect 1")
;;    ("2"         . "gselect 1")
;;    ("3"         . "gselect 3")
;;    ("4"         . "gselect 4")
;;    ("5"         . "gselect 5")
;;    ("6"         . "gselect 6")
;;    ("7"         . "gselect 7")
;;    ("8"         . "gselect 8")
;;    ("9"         . "gselect 9")
;;    ("\\"        . "windowlist")
;;    ;; ("SPC"       . "time")
;;    ("SPC"       . "grouplist")
;;    ("C-SPC"     . "windowlist")
;;    ("F2"        . "grename")
;;    ("'"         . "select")
;;    ("u"         . "next-urgent")
;;    ("K"         . "kill")
;;    ("f"         . "fullscreen")
;;    ("N"         . "number")
;;    ("#"         . "mark")
;;    ("F11"       . "fullscreen")
;;    ("t"         . "title")
;;    ("0"         . "remove")
;;    ("TAB"       . "other-in-frame")
;;    ("q"         . "quit")))

;; ;; Change the prefix key to something else
;; ;; I don't like default keybind, forget it :)
;; ;; The *root-map* will be bound in order to be similar to ctrl-x-map in Emacs
;; (set-prefix-key (kbd "F20"))
;; ;; TODO: use push-top-map for my keybinding
;; ;; (push-top-map *root-map*)

;; (set-resize-increment 50)
;; (sarcasm-prefixed-keys
;;  '(("0"   . "remove")
;;    ("1"   . "only")
;;    ("2"   . "vsplit")
;;    ("3"   . "hsplit")
;;    ("r"   . "iresize")
;;    ("k"   . "gkill")
;;    ("s-w" . "grename")
;;    ("s-f" . "gnew")
;;    ("+"   . "balance-frames")
;;    ("-"   . "fclear")))

;; ;; FIXME:
;; (sarcasm-global-key "h" '*help-map*)

;; Run a list of commands when StumpWM start
(run-shell-command "~/.stumpwm.d/startup-hook")
