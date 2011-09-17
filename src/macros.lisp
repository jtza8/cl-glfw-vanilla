;;; Use of this source code is governed by an MIT license that can be
;;; found in the LICENSE.txt file in the root directory of this
;;; project.

(in-package #:cl-glfw)

(defmacro def-glfw-callback-setter (c-name lisp-name cffi-cb-return-value
                                    cffi-cb-args &body cffi-cb-funcall-args)
  (let* ((ducked-lisp-name (intern (format nil "%~s" lisp-name)))
         (cffi-cb-name (gensym "CFFI-CALLBACK-"))
         (cffi-cb-var (intern (format nil "#:*~a*" cffi-cb-name))))
    `(progn
       (defvar ,cffi-cb-var)
       (defcallback ,cffi-cb-name ,cffi-cb-return-value ,cffi-cb-args
         (handler-case
             (when ,cffi-cb-var
               (funcall ,cffi-cb-var ,@cffi-cb-funcall-args))
           (error (var) (error var))))
       (defcfun (,c-name ,ducked-lisp-name) :void
         (,cffi-cb-name :pointer))
       (defun ,lisp-name (lisp-callback)
         (setf ,cffi-cb-var lisp-callback)
         (,ducked-lisp-name
          (if (null lisp-callback)
              (null-pointer)
              (callback ,cffi-cb-name)))))))

(defmacro with-init ((&optional (auto-set-gl-proc-address t)) &body body)
  `(unwind-protect
        (progn
          (glfw-init)
          ,(when (and auto-set-gl-proc-address
                      (find-package 'cl-opengl-bindings))
                 `(setf ,(intern "*GL-GET-PROC-ADDRESS*" :cl-opengl-bindings)
                        #'cl-glfw:get-proc-address))
          ,@body)
     (glfw-terminate)))