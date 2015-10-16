-module(sum_of_multiples).
-export([sumOfMultiplesDefault/1, sumOfMultiples/2]).

sumOfMultiplesDefault(N) -> sumOfMultiples([3,5], N).

sumOfMultiples(_, 0) -> 0;
sumOfMultiples(Multiples, N) ->
  NaturalNumber = N - 1,
  case lists:any(fun(Multiple) -> NaturalNumber rem Multiple == 0 end, Multiples) of
    true  -> NaturalNumber + sumOfMultiples(Multiples, NaturalNumber);
    false -> 0 + sumOfMultiples(Multiples, NaturalNumber)
  end.
