-module(dna).
-export([count/2]).

-spec(count(string(), string()) -> integer()).
count([], _Nucleotide) -> 0;
count(_,_) -> error("Invalid nucleotide").
