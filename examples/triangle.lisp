;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

;; The following comments are as they appear in triangle.c of the GLFW examples:

(in-package #:cl-glfw-examples)

(defun update-opengl ()
  ; Get window size (may be different than the requested size)
  (multiple-value-bind (width height) (get-window-size)
    ; Special case: avoid division by zero below
    (when (zerop height) (setf height 1))
    (gl:viewport 0 0 width height)
    ; Clear colour buffer to black
    (gl:clear-color 0.0 0.0 0.0 1.0)
    ; Select and setup the projection matrix
    (gl:matrix-mode :projection)
    (gl:load-identity)
    (glu:perspective 65.0 (/ (float width) (float height)) 1.0 100.0)))

(defun draw-triangle ()
  ; Select and setup the projection matrix
  (gl:clear :color-buffer-bit)
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (glu:look-at 0.0 1.0 0.0
               0.0 20.0 0.0
               0.0 0.0 1.0)
  ; Draw a rotating, colourful triangle
  (gl:translate 0.0 14.0 0.0)
  (gl:rotate (+ (* 0.3 (get-mouse-pos)) (* (get-time) 100.0))
             0.0 0.0 1.0)
  (gl:with-primitive :triangles
    (gl:color 1.0 0.0 0.0)
    (gl:vertex -5.0 0.0 -4.0)
    (gl:color 0.0 1.0 0.0)
    (gl:vertex 5.0 0.0 -4.0)
    (gl:color 0.0 0.0 1.0)
    (gl:vertex 0.0 0.0 6.0)))

(defun triangle ()
  ; Initalise GLFW
  (with-init ()
    ; Open window and create its OpenGL context
    (assert (open-window 640 480 0 0 0 0 0 0 :window) ()
            "Couldn't open window!")
    (set-window-title "Spinning Triangle")
    ; Ensure we can capture the escape key being pressed below
    (enable :sticky-keys)
    ; Enable vertical sync (on cards that support it)
    (swap-interval 1)
    ; Set-up an OpenGL viewport and settings
    (update-opengl)
    (loop while (and (eq (get-key :esc) :release)
                     (get-window-param :opened))
          do (progn (draw-triangle)
                    ; Swap buffers
                    (swap-buffers)))))