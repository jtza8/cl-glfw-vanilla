;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(asdf:defsystem "cl-glfw-vanilla-examples"
  :author "Jens Thiede"
  :license "MIT"
  :serial t
  :depends-on ("cl-glfw-vanilla" "cl-opengl" "cl-glu")
  :components ((:file "package")
               (:file "callbacks")
               (:file "triangle")))