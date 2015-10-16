-module(sum_of_multiples).
-export([sumOfMultiplesDefault/1, sumOfMultiples/2]).

sumOfMultiplesDefault(_, 0) -> 0;
sumOfMultiplesDefault(N, NaturalNumber) ->
  if
    NaturalNumber rem 3 =:= 0 -> NaturalNumber + sumOfMultiplesDefault(N, NaturalNumber - 1);
    NaturalNumber rem 5 =:= 0 -> NaturalNumber + sumOfMultiplesDefault(N, NaturalNumber - 1);
    true                      -> 0 + sumOfMultiplesDefault(N, NaturalNumber - 1)
  end.
sumOfMultiplesDefault(N) -> sumOfMultiplesDefault(N, N-1).

sumOfMultiples(_, 0) -> 0;
sumOfMultiples(Multiples, N) ->
  Big = fun(X) -> if X =:= 0 -> true; true -> false end end,
  J = lists:any(Big, [N rem Multiple || Multiple <- Multiples]),
  if
    J =:= true ->
      N + sumOfMultiples(Multiples, N-1);
    true       ->
      0 + sumOfMultiples(Multiples, N-1)
  end.
