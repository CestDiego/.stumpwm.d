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

;; 
;; Insertions into top level bindings.
;;

(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight +20")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -20")

(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer -q set Master 5- unmute")
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer -q set Master 5+ unmute")
(define-key *top-map* (kbd "XF86AudioMute") "exec amixer -q sset Master toggle")
(define-key *top-map* (kbd "Print") "exec  sleep 0.2; scrot -s -e 'mv $f /home/io/Pictures/Screenshots/' & mplayer /usr/share/sounds/freedesktop/stereo/screen-capture.oga")

(define-key *top-map* (kbd "XF86AudioPlay")        "exec ncmpcpp toggle")
(define-key *top-map* (kbd "XF86AudioNext")        "exec ncmpcpp next")
(define-key *top-map* (kbd "XF86AudioPrev")        "exec ncmpcpp prev")
(define-key *top-map* (kbd "XF86AudioStop")        "exec ncmpcpp stop")

(define-key *top-map* (kbd "M-ISO_Left_Tab") "prev-in-frame")
(define-key *top-map* (kbd "M-TAB") "next-in-frame")
(define-key *top-map* (kbd "XF86TouchpadToggle") "toggle-mouse")




;;
;; Insertions into root level bindings.
;;
(define-key *root-map* (kbd "Print") "exec  sleep 0.2; scrot -e 'mv $f /home/io/Pictures/Screenshots/' & mplayer /usr/share/sounds/freedesktop/stereo/screen-capture.oga")

(define-key *root-map* (kbd "p") "dmenu")
(define-key *root-map* (kbd "RET") "term")
(define-key *root-map* (kbd "C-.") "gnext")
(define-key *root-map* (kbd "C-,") "gprev")

(define-key *root-map* (kbd "C-s") "swank")
(define-key *root-map* (kbd "b") "mode-line")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Toggling and Enabling the Mouse
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand toggle-mouse ()() (run-shell-command "toggle-mouse"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Basic Appplication Triggers
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand google-chrome ()() (run-or-raise "google-chrome" '(:class "Google-Chrome")))
(defcommand dmenu ()() (run-shell-command "exe=`dmenu_path | dmenu_run -fn xft:Monaco:bold:pixelsize=24` && eval \"exec $exe\""))
(defcommand dmpc ()() (run-shell-command "dmpc"))
;; (defcommand dmenu-work ()() (run-shell-command "dmenu-work"))
;; (defcommand dmenu-tychoish ()() (run-shell-command "dmenu-tychoish"))
;; (defcommand dmenu-stl ()() (run-shell-command "dmenu-stl"))

;; (defcommand emacs ()() (run-shell-command "emacsclient -a emacs -n -c"))
;; (defcommand emacs-tychoish ()() (run-shell-command "emacsclient -a emacs -n -c"))
;; (defcommand emacs-work ()() (run-shell-command "emacsclient -a emacs -n -c"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Terminals and Screen Sessions, elswhere
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand term ()() (run-shell-command "urxvt -title local-term"))
(defcommand ponyterm ()()
  (run-or-raise "urxvt -e alsamixer" '(:title "Terminal")))
(defcommand sterm ()()
  (run-shell-command "urxvtcd -title local-screen -e screen -x tychoish"))

(defcommand remote-term ()() (run-shell-command "urxvtcd -title remote-term -e ssh -t whoami@remote.example.net"))
(defcommand remote-screen ()() (run-shell-command "urxvtcd -title remote-screen -e ssh -t whoami@remote.example.net screen -DRR"))
(defcommand remote-screen-second ()() (run-shell-command "urxvtcd -title remote-screen -e ssh -t whoami@remote.example.net screen -x"))

(defun color (key)
  "erosion colorscheme generated by polychrome"
  (let ((colors '(:foreground   #xBEA492
                  :background-0 #x181512
                  :background-1 #x100E0C
                  :background-2 #x231F1A
                  :background-3 #x695C4F
                  :black        #x352C26
                  :red          #x9B5E3B
                  :green        #xD2C984
                  :yellow       #xCAC286
                  :blue         #x626B6F
                  :magenta      #x6E6774
                  :cyan         #x374A4D
                  :white        #x564333
                  :black-1      #x584231
                  :red-1        #xB16E43
                  :green-1      #xCDD26A
                  :yellow-1     #xFFFFB4
                  :blue-1       #x5E6F78
                  :magenta-1    #x756D7E
                  :cyan-1       #x425052
                  :white-1      #xAA8D50)))
    (getf colors key)))

;; Message window settings
(set-bg-color "Black")
(set-fg-color "White")
(set-border-color "Grey")
(set-msg-border-width 2)
(set-focus-color "DarkGreen")
(setf *message-window-padding* 1)
(setf *maxsize-border-width* 0)
(setf *normal-border-width* 0)
(setf *transient-border-width* 2)       ;
(setf *window-border-style* :thin)
(setf *mouse-focus-policy* :click)

;; Groups
;;; Create groups
(grename "Start")
(gnew "Work")
(gnew "Misc")
(gnew "Mail")
(gnew "Entertainment")
(gnew "Graphics")
(gnew "gimp")
(run-commands "gselect Work")
(run-commands "banish")

(defun is-running (program)
  "Determine if program is running."
  (string= (run-shell-command (concat "is-running " program) t) "1"))

(defcommand exit () ()
  (run-shell-command "pkill Xsession"))

;; layout handling
;; courtesy of Peter Seibel
(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro program-with-layout (name &key (command (string-downcase (string name)))
                                      (props `'(:class ,(string-capitalize command))))
  (with-gensyms (s w h files-path layout rules)
    `(defcommand ,name () ()
       (let* ((,s (current-screen))
              (,w (prin1-to-string (screen-width ,s)))
              (,h (prin1-to-string (screen-height ,s)))
              (,files-path "/home/niels/.stumpwm.d/")
              (,layout (concat ,files-path ,command "-layout-" ,w "x" ,h))
              (,rules (concat ,files-path ,command "-rules")))
         (gnew ,command)
         (restore-from-file ,layout)
         (restore-window-placement-rules ,rules)
         (run-or-raise ,command ,props)
         (place-existing-windows))))) ; needed if command was already run

(program-with-layout gimp)
;;;

;; Window Stufff


;; Window swapping tool
(defvar *swapping-window* nil
  "What window we're swapping out.  Do not customize by hand!")
(defvar *swapping-window-frame* nil
  "What frame we're swapping to.  Do not customize by hand!")

(defcommand swap-window () ()
  "Run first on one window and then the next to swap the two windows"
  (if *swapping-window*
      (let ((this-current-window (current-window)))
        (pull-window *swapping-window*)
        (setf *swapping-window* nil)
        (if *swapping-window-frame*
            (pull-window this-current-window *swapping-window-frame*)
            (setf *swapping-window-frame nil))
        (echo "Swapped!"))
      (progn
        (setf *swapping-window* (current-window))
        (setf *swapping-window-frame* (window-frame (current-window)))
        (echo "Window marked for swapping."))))

(clear-window-placement-rules)

(define-frame-preference "Start"
    (0 nil t :title "stalonetray")
  )

(define-frame-preference "Work"
    (0 t   t :title "Terminal")

  (0 t   t :class "Emacs")
  (0 t   t :class "Conkeror")
  )

(define-frame-preference "Misc"
  (0 t   t :class "Transmission")
  )

(define-frame-preference "Mail"
  (0 t   t :title "Claws Mail")
  )

(define-frame-preference "Entertainment"
  (0 t   t :class "Exaile")
  )

(define-frame-preference "Graphics"
  (0 t   t :class "MyPaint")
  (0 t   t :class "Inkscape")
  )
(setf *mode-line-position* :bottom)
;; Frames
;; (loop for (vi-key name) in '(("k" "up")
;;                              ("j" "down")
;;                              ("h" "left")
;;                              ("l" "right"))
;;    do (let ((key-combo (format nil "~A" vi-key))
;;             (shifted-key-combo (format nil "~A" (string-upcase vi-key))))
;;         (define-key *root-map* (kbd key-combo)
;;           (format nil "move-focus ~A" name))
;;         (define-key *root-map* (kbd shifted-key-combo)
;;           (format nil "move-window ~A" name))))
