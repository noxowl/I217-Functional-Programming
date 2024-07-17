-module(lecture_1).
-import(io,[fwrite/1]).
-export([start/0]).

start() -> 
    factorial_test(),
    oedc_factorial_test(),
    sum_test(),
    oedc_sum_test(),
    ext_fibonacci_test().


% Factorial
factorial(0) -> 1;
factorial(NzX) -> NzX * factorial(NzX-1).

factorial_test() ->
    io:fwrite("Factorial Test~n"),
    io:fwrite("~p~n",[factorial(0)]),
    io:fwrite("~p~n",[factorial(1)]),
    io:fwrite("~p~n",[factorial(10)]).


% Odd-Even Divide and Conquer Factorial
oedc_factorial(0) -> 1;
oedc_factorial(NzX) -> sub_oedc_factorial(NzX,1).

sub_oedc_factorial(X,Y) -> 
    if
        X > Y -> sub_oedc_factorial(X, 2*Y) * sub_oedc_factorial(abs(X-Y), 2*Y);
        true -> X
    end.

oedc_factorial_test() ->
    io:fwrite("Odd-Even Divide and Conquer Factorial Test~n"),
    io:fwrite("~p~n",[oedc_factorial(0)]),
    io:fwrite("~p~n",[oedc_factorial(1)]),
    io:fwrite("~p~n",[oedc_factorial(10)]).


% Summation
sum(X) ->
    case X of
        0 -> 0;
        _ -> X + sum(X-1)
    end.

sum_test() ->
    io:fwrite("Summation Test~n"),
    io:fwrite("~p~n",[sum(1024)]).


% Odd-Even Divide and Conquer Summation
oedc_sum(X) -> 
    case X of
        0 -> 0;
        _ -> sub_oedc_sum(X,1)
    end.

sub_oedc_sum(X,Y) -> 
    if
        X > Y -> sub_oedc_sum(X, 2*Y) + sub_oedc_sum(abs(X-Y), 2*Y);
        true -> X
    end.

oedc_sum_test() ->
    io:fwrite("Odd-Even Divide and Conquer Summation Test~n"),
    io:fwrite("~p~n",[oedc_sum(1024)]).


% Ext-Fibonacci
ext_fibonacci(0) -> 0;
ext_fibonacci(NzX) -> sub1_ext_fibonacci(NzX-1).

sub1_ext_fibonacci(0) -> 1;
sub1_ext_fibonacci(NzX) -> sub2_ext_fibonacci(NzX-1).

sub2_ext_fibonacci(0) -> 2;
sub2_ext_fibonacci(NzX) -> ext_fibonacci(NzX-1) + ext_fibonacci(NzX) + ext_fibonacci(NzX+1).

ext_fibonacci_test() ->
    io:fwrite("Ext-Fibonacci Test~n"),
    io:fwrite("~p~n",[ext_fibonacci(0)]),
    io:fwrite("~p~n",[ext_fibonacci(1)]),
    io:fwrite("~p~n",[ext_fibonacci(2)]),
    io:fwrite("~p~n",[ext_fibonacci(3)]),
    io:fwrite("~p~n",[ext_fibonacci(5)]),
    io:fwrite("~p~n",[ext_fibonacci(7)]).
