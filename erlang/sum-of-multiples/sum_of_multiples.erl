-module(sum_of_multiples).
-export([sumOfMultiplesDefault/1, sumOfMultiples/2]).

sumOfMultiplesDefault(_, 0) -> 0;
sumOfMultiplesDefault(N, NaturalNumber) ->
  if
    N rem NaturalNumber =:= 0 ->
      io:fwrite("~w is a factor~n", [NaturalNumber]),
      NaturalNumber + sumOfMultiplesDefault(N, NaturalNumber - 1);
    true                      ->
      io:fwrite("~w is not a factor~n", [NaturalNumber]),
      0 + sumOfMultiplesDefault(N, NaturalNumber - 1)
  end.
sumOfMultiplesDefault(N) -> sumOfMultiplesDefault(N, N-1).
sumOfMultiples(_, N) -> N.
