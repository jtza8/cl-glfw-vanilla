;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(in-package #:cl-glfw)

(pushnew (asdf:system-relative-pathname :cl-glfw-vanilla "bridge/")
         *foreign-library-directories*
         :test #'equal)

(define-foreign-library bridge
  (:darwin (:default "bridge")))
(use-foreign-library bridge)

(defcfun ("clearMainMenu" clear-main-menu) :void)
(defcfun ("clearWindowsMenu" clear-windows-menu) :void)
(defcfun ("sharedApplication" shared-application) :void)