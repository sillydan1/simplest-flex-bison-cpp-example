# simplest-flex-bison-cpp-example

<!--toc:start-->
- [simplest-flex-bison-cpp-example](#simplest-flex-bison-cpp-example)
  - [Why create this repo?](#why-create-this-repo)
<!--toc:end-->

The world's simplest example of how to use flex / bison in modern c++ (class based scanner &amp; parser)

The actual "language" implemented here is literally only integer math. No fancy algebra, function calling, or whatevers. This is meant to be an example to get you going with flex / bison so that you can start designing your own language.

There are literally only 4 files in the `src` directory:
 - [`x.l`](src/x.l) file for `flex`
 - [`x.y`](src/x.y) file for `bison`
 - [`expr-scanner.hpp`](src/expr-scanner.hpp) since `flex` cannot provide it by itself
 - [`main.cpp`](src/main.cpp) for you as a convenient entry point to start using this <3
 
## Why create this repo?
There are a lot of (actually very good) resources out there on how to use flex and bison. But they are all for incredibly old flex/bison versions (or even worse `flex++ / bison++` which stalled development in 1995!) or they simply say "use the C parser" instead. The official documentation is a mess to navigate for newcomers. There _does_ exist a couple of somewhat up-to-date examples, but I find that the example language that they recognize is not small enough, and the implementation could be more minimal. Therefore, I made this repo. Mostly for myself, but if you use it for whatever, please let me know :-)

