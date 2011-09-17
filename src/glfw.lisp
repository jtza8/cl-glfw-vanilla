;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.
;;;
;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Then it was heavily edited by hand.

(in-package #:cl-glfw)

(define-foreign-library glfw
  (:unix (:default "libglfw"))
  (:windows (:default "glfw")))
(use-foreign-library glfw)

(defcenum key-state
  (:release 0)
  (:press 1))

(defcenum key
  (:unknown -1)
  (:space 32)
  (:special 256)
  :esc
  :f1
  :f2
  :f3
  :f4
  :f5
  :f6
  :f7
  :f8
  :f9
  :f10
  :f11
  :f12
  :f13
  :f14
  :f15
  :f16
  :f17
  :f18
  :f19
  :f20
  :f21
  :f22
  :f23
  :f24
  :f25
  :up
  :down
  :left
  :right
  :lshift
  :rshift
  :lctrl
  :rctrl
  :lalt
  :ralt
  :tab
  :enter
  :backspace
  :insert
  :del
  :pageup
  :pagedown
  :home
  :end
  :kp-0
  :kp-1
  :kp-2
  :kp-3
  :kp-4
  :kp-5
  :kp-6
  :kp-7
  :kp-8
  :kp-9
  :kp-divide
  :kp-multiply
  :kp-subtract
  :kp-add
  :kp-decimal
  :kp-equal
  :kp-enter
  :kp-num-lock
  :caps-lock
  :scroll-lock
  :pause
  :lsuper
  :rsuper
  :menu
  :last)

(defcenum mouse-button
  :1
  :2
  :3
  :4
  :5
  :6
  :7
  :8
  (:last 7)
  (:left 0)
  :right
  :middle)

(defcenum joystick
  :joystick-1
  :joystick-2
  :joystick-3
  :joystick-4
  :joystick-5
  :joystick-6
  :joystick-7
  :joystick-8
  :joystick-9
  :joystick-10
  :joystick-11
  :joystick-12
  :joystick-13
  :joystick-14
  :joystick-15
  :joystick-16
  (:joystick-last 15))

(defcenum display-method
  (:window #x00010001)
  :fullscreen)

(defcenum window-param
  (:opened #x00020001)
  :active
  :iconified
  :accelerated
  :red-bits
  :green-bits
  :blue-bits
  :alpha-bits
  :depth-bits
  :stencil-bits
  :refresh-rate
  :accum-red-bits
  :accum-green-bits
  :accum-blue-bits
  :accum-alpha-bits
  :aux-buffers
  :stereo
  :window-no-resize
  :fsaa-samples
  :opengl-version-major
  :opengl-version-minor
  :opengl-forward-compat
  :opengl-debug-context
  :opengl-profile)

;; opengl-core-profile #x00050001
;; opengl-compat-profile #x00050002

(defcenum glfw-param
  (:mouse-cursor #x00030001)
  :sticky-keys
  :sticky-mouse-buttons
  :system-keys
  :key-repeat
  :auto-poll-events)

;; wait #x00040001
;; nowait #x00040002

(defcenum joystick-param
  (:present #x00050001)
  :axes
  :buttons)

;; no-rescale-bit #x00000001
;; origin-ul-bit #x00000002
;; build-mipmaps-bit #x00000004
;; alpha-map-bit #x00000008

;; infinity 100000.0d0

; Probably unintentionally, the order below is RBG not RGB or BGR:
(defcstruct c-video-mode
	(width :int)
	(height :int)
	(red-bits :int)
	(blue-bits :int)
	(green-bits :int))

; "Correct" order:
(defstruct video-mode
  (width 0 :type integer)
  (height 0 :type integer)
  (red-bits 8 :type integer)
  (green-bits 8 :type integer)
  (blue-bits 8 :type integer))

(declaim (inline to-lisp-video-mode))
(defun to-lisp-video-mode (c-video-mode)
  (with-foreign-slots ((width height red-bits green-bits blue-bits)
                       c-video-mode c-video-mode)
    (make-video-mode
      :width width
      :height height
      :red-bits red-bits
      :green-bits green-bits
      :blue-bits blue-bits)))

(declaim (inline to-c-key))
(defun to-c-key (lisp-key)
  (etypecase lisp-key
    (keyword (foreign-enum-value 'key lisp-key))
    (character (char-code lisp-key))))

(declaim (inline to-lisp-key))
(defun to-lisp-key (c-key)
  (if (> c-key 255)
      (foreign-enum-keyword 'key c-key)
      (character (code-char c-key))))


(defcstruct image
	(width :int)
	(height :int)
	(format :int)
	(bytes-per-pixel :int)
	(data :pointer))

(defcfun ("glfwInit" %glfw-init) :boolean)
(defun glfw-init ()
  (unless (%glfw-init)
    (error 'glfw-init-error)))

(defcfun ("glfwTerminate" glfw-terminate) :void)

(defcfun ("glfwGetVersion" get-version) :void
  (major :pointer)
  (minor :pointer)
  (rev :pointer))

(defcfun ("glfwOpenWindow" open-window) :boolean
  (width :int)
  (height :int)
  (red-bits :int)
  (green-bits :int)
  (blue-bits :int)
  (alpha-bits :int)
  (depth-bits :int)
  (stencil-bits :int)
  (mode display-method))

(defcfun ("glfwOpenWindowHint" open-window-hint) :void
  (target :int)
  (hint :int))

(defcfun ("glfwCloseWindow" close-window) :void)

(defcfun ("glfwSetWindowTitle" set-window-title) :void
  (title :string))

(defcfun ("glfwGetWindowSize" %get-window-size) :void
  (width :pointer)
  (height :pointer))

(defun get-window-size ()
  (with-foreign-objects ((width :int) (height :int))
    (%get-window-size width height)
    (values (mem-ref width :int)
            (mem-ref height :int))))

(defcfun ("glfwSetWindowSize" set-window-size) :void
  (width :int)
  (height :int))

(defcfun ("glfwSetWindowPos" set-window-pos) :void
  (x :int)
  (y :int))

(defcfun ("glfwIconifyWindow" iconify-window) :void)

(defcfun ("glfwRestoreWindow" restore-window) :void)

(defcfun ("glfwSwapBuffers" swap-buffers) :void)

(defcfun ("glfwSwapInterval" swap-interval) :void
  (interval :int))

(defcfun ("glfwGetWindowParam" %get-window-param) :int
  (param window-param))

(defun get-window-param (param)
  (let ((return-value (%get-window-param param)))
    (if (find param '(:opened :active :iconified :accelerated :stereo
                      :window-no-resize :opengl-forward-compat
                      :opengl-debug-context))
        (= return-value 1)
        return-value)))

(def-glfw-callback-setter "glfwSetWindowSizeCallback" set-window-size-callback
    :void ((width :int) (height :int))
  width height)

(def-glfw-callback-setter "glfwSetWindowCloseCallback" set-window-close-callback
    :boolean ())

(def-glfw-callback-setter "glfwSetWindowRefreshCallback"
    set-window-refresh-callback :void ())

(defcfun ("glfwGetVideoModes" %get-video-modes) :int
  (list :pointer)
  (maxcount :int))

(declaim (inline get-video-modes))
(defun get-video-modes (&optional (max-count #xFF))
  (with-foreign-object (c-video-modes 'c-video-mode max-count)
    (loop for i below (%get-video-modes c-video-modes max-count)
          collect (to-lisp-video-mode
                   (mem-aref c-video-modes 'c-video-mode i)))))

(defcfun ("glfwGetDesktopMode" %get-desktop-mode) :void
  (mode :pointer))

(declaim (inline get-desktop-mode))
(defun get-desktop-mode ()
  (with-foreign-object (c-video-mode 'c-video-mode)
    (%get-desktop-mode c-video-mode)
    (to-lisp-video-mode c-video-mode)))

(defcfun ("glfwPollEvents" poll-events) :void)

(defcfun ("glfwWaitEvents" wait-events) :void)

(defcfun ("glfwGetKey" %get-key) key-state
  (key :int))

(declaim (inline get-key))
(defun get-key (key)
  (%get-key (to-c-key key)))

(defcfun ("glfwGetMouseButton" get-mouse-button) key-state
  (button mouse-button))

(defcfun ("glfwGetMousePos" %get-mouse-pos) :void
  (xpos :pointer)
  (ypos :pointer))

(defun get-mouse-pos ()
  (with-foreign-objects ((xpos :int) (ypos :int))
    (%get-mouse-pos xpos ypos)
    (values (mem-ref xpos :int) (mem-ref ypos :int))))

(defcfun ("glfwSetMousePos" set-mouse-pos) :void
  (xpos :int)
  (ypos :int))

(defcfun ("glfwGetMouseWheel" get-mouse-wheel) :int)

(defcfun ("glfwSetMouseWheel" set-mouse-wheel) :void
  (pos :int))

(def-glfw-callback-setter "glfwSetKeyCallback" set-key-callback :void
    ((key :int) (state key-state))
  (to-lisp-key key) state)

(def-glfw-callback-setter "glfwSetCharCallback" set-char-callback :void
    ((char :int) (state key-state))
  (code-char char)
  state)

(def-glfw-callback-setter "glfwSetMouseButtonCallback"
    set-mouse-button-callback :void ((button mouse-button) (state key-state))
  button state)

(def-glfw-callback-setter "glfwSetMousePosCallback" set-mouse-pos-callback :void
    ((x :int) (y :int))
  x y)

(def-glfw-callback-setter "glfwSetMouseWheelCallback" set-mouse-wheel-callback
    :void ((pos :int))
  pos)

(defcfun ("glfwGetJoystickParam" %get-joystick-param) :int
  (joy joystick)
  (param joystick-param))

(defun get-joystick-param (joy param)
  (let ((return-value (%get-joystick-param joy param)))
    (if (eq param :present)
        (= return-value 1)
        return-value)))

;; (defcfun ("glfwGetJoystickPos" get-joystick-pos) :int
;;   (joy joystrick)
;;   (pos :pointer)
;;   (numaxes :int))

;; (defcfun ("glfwGetJoystickButtons" get-joystick-buttons) :int
;;   (joy :int)
;;   (buttons :pointer)
;;   (numbuttons :int))

(defcfun ("glfwGetTime" get-time) :double)

(defcfun ("glfwSetTime" set-time) :void
  (time :double))

(defcfun ("glfwSleep" glfw-sleep) :void
  (time :double))

(defcfun ("glfwExtensionSupported" extension-supported) :boolean
  (extension :string))

(defcfun ("glfwGetProcAddress" get-proc-address) :pointer
  (procname :string))

(defcfun ("glfwGetGLVersion" %get-gl-version) :void
  (major :pointer)
  (minor :pointer)
  (rev :pointer))

(defun get-gl-version ()
  (with-foreign-objects ((major :int) (minor :int) (rev :int))
    (%get-gl-version major minor rev)
    (values (mem-ref major :int)
            (mem-ref minor :int)
            (mem-ref rev :int))))

;; (defcfun ("glfwCreateThread" create-thread) :int
;;   (fun :pointer)
;;   (arg :pointer))

;; (defcfun ("glfwDestroyThread" destroy-thread) :void
;;   (ID :int))

;; (defcfun ("glfwWaitThread" wait-thread) :int
;;   (ID :int)
;;   (waitmode :int))

;; (defcfun ("glfwGetThreadID" get-thread-iD) :int)

;; (defcfun ("glfwCreateMutex" create-mutex) :pointer)

;; (defcfun ("glfwDestroyMutex" destroy-mutex) :void
;;   (mutex :pointer))

;; (defcfun ("glfwLockMutex" lock-mutex) :void
;;   (mutex :pointer))

;; (defcfun ("glfwUnlockMutex" unlock-mutex) :void
;;   (mutex :pointer))

;; (defcfun ("glfwCreateCond" create-cond) :pointer)

;; (defcfun ("glfwDestroyCond" destroy-cond) :void
;;   (cond :pointer))

;; (defcfun ("glfwWaitCond" wait-cond) :void
;;   (cond :pointer)
;;   (mutex :pointer)
;;   (timeout :double))

;; (defcfun ("glfwSignalCond" signal-cond) :void
;;   (cond :pointer))

;; (defcfun ("glfwBroadcastCond" broadcast-cond) :void
;;   (cond :pointer))

;; (defcfun ("glfwGetNumberOfProcessors" get-number-of-processors) :int)

(defcfun ("glfwEnable" enable) :void
  (token glfw-param))

(defcfun ("glfwDisable" disable) :void
  (token glfw-param))

;; (defcfun ("glfwReadImage" read-image) :int
;;   (name :string)
;;   (img :pointer)
;;   (flags :int))

;; (defcfun ("glfwReadMemoryImage" read-memory-image) :int
;;   (data :pointer)
;;   (size :long)
;;   (img :pointer)
;;   (flags :int))

;; (defcfun ("glfwFreeImage" free-image) :void
;;   (img :pointer))

;; (defcfun ("glfwLoadTexture2D" load-texture2D) :int
;;   (name :string)
;;   (flags :int))

;; (defcfun ("glfwLoadMemoryTexture2D" load-memory-texture2D) :int
;;   (data :pointer)
;;   (size :long)
;;   (flags :int))

;; (defcfun ("glfwLoadTextureImage2D" load-texture-image2D) :int
;;   (img :pointer)
;;   (flags :int))