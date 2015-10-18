-module(dna).
-export([hamming_distance/2]).

-spec(hamming_distance(list(), list()) -> integer()).
hamming_distance(A, A)           -> 0;
hamming_distance([A|AT], [B|BT]) ->
  if
    A == B -> 0 + hamming_distance(AT, BT);
    true   -> 1 + hamming_distance(AT, BT)
  end.
