;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(asdf:defsystem "cl-glfw-vanilla"
  :author "Jens Thiede et al."
  :license "MIT"
  :serial t
  :depends-on ("cffi")
  :components ((:file "package")
               (:file "macros")
               (:file "conditions")
               (:file "glfw")))