-module(grains).
-export([square/1, total/0]).

square(N, N, Acc) -> Acc;
square(N, C, Acc) -> square(N, C+1, Acc*2).
square(N)         -> square(N, 1, 1).

total(64, Acc) -> square(64)+Acc;
total(N, Acc)  -> total(N+1, square(N)+Acc).
total()        -> total(1, 0).
