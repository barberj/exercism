-module(grains).
-export([square/1, total/0]).

square(N) -> trunc(math:pow(2, N-1)).

total(64, Acc) -> square(64)+Acc;
total(N, Acc)  -> total(N+1, square(N)+Acc).
total()        -> total(1, 0).
