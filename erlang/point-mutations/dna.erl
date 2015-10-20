-module(dna).
-export([hamming_distance/2]).

hamming_distance(A, A, Acc)           -> Acc;
hamming_distance([A|AT], [A|BT], Acc) -> hamming_distance(AT, BT, Acc);
hamming_distance([_|AT], [_|BT], Acc) -> hamming_distance(AT, BT, Acc + 1).

-spec(hamming_distance(list(), list()) -> integer()).
hamming_distance(A, B) -> hamming_distance(A, B, 0).
