# CL-GLFW Vanilla #

## Why Another Binding? ##

CL-GLFW ___Vanilla___ aims to be a simple binding for [GLFW][]. It aims
to be a consistent, easy to use API with a clear abstraction barrier
between Common Lisp and C.

In contrast to [CL-GLFW][], _Vanilla_ follows the philosophy that one
should never write a large system. That is, one should always strive
to do ___one___ thing well, rather than several poorly. [CL-GLFW][]
was messy and not something I wanted to write my software on or
maintain.

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
