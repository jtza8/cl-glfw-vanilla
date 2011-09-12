;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(defpackage #:cl-glfw
  (:use #:cl #:cl-user #:cffi)
  (:nicknames #:glfw)
  (:export #:video-mode
           #:image
           #:glfw-init
           #:glfw-terminate
           #:get-version
           #:open-window
           #:open-window-hint
           #:close-window
           #:set-window-title
           #:get-window-size
           #:set-window-size
           #:set-window-pos
           #:iconify-window
           #:restore-window
           #:swap-buffers
           #:swap-interval
           #:get-window-param
           #:set-window-size-callback
           #:get-video-modes
           #:get-desktop-mode
           #:poll-events
           #:wait-events
           #:get-key
           #:get-mouse-button
           #:get-mouse-pos
           #:get-mouse-wheel
           #:set-mouse-wheel
           #:set-window-close-callback
           #:set-window-refresh-callback
           #:set-mouse-pos
           #:set-key-callback
           #:set-char-callback
           #:set-mouse-button-callback
           #:set-mouse-pos-callback
           #:set-mouse-wheel-callback
           #:get-joystick-param
           #:get-time
           #:set-time
           #:glfw-sleep
           #:get-proc-address
           #:with-init
           #:disable
           #:enable))
