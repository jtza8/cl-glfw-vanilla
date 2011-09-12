;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(in-package :cl-glfw)

(define-condition glfw-init-error (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream "Couldn't initialize GLFW."))))