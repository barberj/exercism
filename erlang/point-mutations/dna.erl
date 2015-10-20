-module(dna).
-export([hamming_distance/2]).

hamming_distance(A, A, Acc)           -> Acc;
hamming_distance([A|AT], [B|BT], Acc) ->
  if
    A == B -> hamming_distance(AT, BT, Acc);
    true   -> hamming_distance(AT, BT, Acc + 1)
  end.

-spec(hamming_distance(list(), list()) -> integer()).
hamming_distance(A, B) -> hamming_distance(A, B, 0).
