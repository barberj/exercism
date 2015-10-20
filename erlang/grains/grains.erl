-module(grains).
-export([square/1, total/0]).

square(N) -> trunc(math:pow(2, N-1)).
total() -> lists:foldl(fun(N, Sum) -> square(N) + Sum end, 0,  lists:seq(1, 64)).
