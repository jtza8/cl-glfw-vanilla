;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(in-package #:cl-glfw-examples)

(defparameter *quit-state* nil)

(defun set-callbacks ()
  (labels ((key-callback (key state)
             (format t "KEY-CALLBACK~25tKey~30t~s~40tState~45t~s~%" key state)
             (finish-output)
             (when (and (eq key #\B) (eq state :press)
                        (eq (get-key #\M) :press))
               (set-mouse-button-callback
                (if (eq (get-key :lshift) :press)
                    (progn (write-line "*** Enabling MOUSE-BUTTON-CALLBACK ***")
                           (finish-output)
                           #'mouse-button-callback)
                    (progn
                      (write-line "*** Disabling MOUSE-BUTTON-CALLBACK ***")
                      (finish-output)
                      nil)))))
           (char-callback (char state)
             (format t "CHAR-CALLBACK~25tChar~30t~s~40tState~45t~s~%"
                     char state)
             (finish-output))
           (mouse-button-callback (button state)
             (format t "MOUSE-BUTTON-CALLBACK~25tButton~30t~s~40tState~45t~s~%"
                     button state)
             (finish-output))
           (mouse-pos-callback (x y)
             (format t "MOUSE-POS-CALLBACK~25tX~30t~s~40tY~45t~s~%" x y)
             (finish-output))
           (mouse-wheel-callback (pos)
             (format t "MOUSE-WHEEL-CALLBACK~25tPos~30t~s~%" pos)
             (finish-output))
           (window-size-callback (width height)
             (format t "WINDOW-SIZE-CALLBACK~25tWidth~30t~s~40tHeight~45t~s~%"
                     width height)
             (finish-output))
           (window-refresh-callback ()
             (format t "WINDOW-REFRESH-CALLBACK~%")
             (finish-output))
           (window-close-callback ()
             (format t "WINDOW-CLOSE-CALLBACK~%")
             (finish-output)
             t))
    (set-key-callback #'key-callback)
    (set-char-callback #'char-callback)
    (set-mouse-button-callback #'mouse-button-callback)
    (set-mouse-pos-callback #'mouse-pos-callback)
    (set-mouse-wheel-callback #'mouse-wheel-callback)
    (set-window-size-callback #'window-size-callback)
    (set-window-refresh-callback #'window-refresh-callback)
    (set-window-close-callback #'window-close-callback)))

(defun basic-event-handler ()
  (when (or (eq (get-key :esc) :press)
            (not (get-window-param :opened)))
    (setf *quit-state* t)))

(defun callbacks ()
  (with-init ()
    (open-window 640 480 0 0 0 0 0 0 :window)
    (set-window-title "Callbacks Example")
    (setf *quit-state* nil)
    (set-callbacks)
    (loop until *quit-state*
          do (progn (poll-events)
                    (basic-event-handler)
                    (glfw-sleep 0.01d0)))))
