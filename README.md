# CL-GLFW Vanilla #

## Why Another Binding? ##

CL-GLFW ___Vanilla___ aims to be a simple binding for [GLFW][]. It aims
to be a consistent, easy to use API with a clear abstraction barrier
between Common Lisp and C.

This binding was written from scratch because the author found the
existing [CL-GLFW][] binding to be lacking in elegance. He does,
however, appreciate the work that went into the pre-existing binding
and respects the respective authors for their efforts.

## Installation ##

Depends on:

* [CFFI][]

Examples depend on:

* [CL-OpenGL][]

Generic *nix instructions:

    cd asdf-systems-path
    find ../path/to/cl-glfw-vanilla -iname '*.asd' -exec ln -s '{}' . \;

[GLFW]: http://www.glfw.org/ "GLFW"
[CL-GLFW]: http://repo.or.cz/w/cl-glfw.git "CL-GLFW"
[CFFI]: http://common-lisp.net/project/cffi/ "CFFI"
[CL-OpenGL]: https://github.com/3b/cl-opengl "CL-OpenGL"
