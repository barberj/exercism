-module(sum_of_multiples).
-export([sumOfMultiplesDefault/1, sumOfMultiples/2]).

sumOfMultiplesDefault(N) -> sumOfMultiples([3,5], N).

sumOfMultiples(_, 0) -> 0;
sumOfMultiples(Multiples, N) ->
  NaturalNumber = N - 1,
  IsFactor = fun(X) -> if X =:= 0 -> true; true -> false end end,
  MultipleIsFactor = lists:any(IsFactor, [NaturalNumber rem Multiple || Multiple <- Multiples]),
  if
    MultipleIsFactor =:= true ->
      NaturalNumber + sumOfMultiples(Multiples, NaturalNumber);
    true       ->
      0 + sumOfMultiples(Multiples, NaturalNumber)
  end.
