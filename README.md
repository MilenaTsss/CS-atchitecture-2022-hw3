# CS-atchitecture-2022-hw3

В отчёте была упущена опция компиляции -lm которая нужна, чтобы можно было использовать math.h, в частности функцию pow:

gcc -O0 -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c -o old.s -lm
gcc main.s func.s -lm
