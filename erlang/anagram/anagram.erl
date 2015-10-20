-module(anagram).
-export([find/2]).

-spec(find(list(), list()) -> list()).
find(_,[],Acc) -> Acc;
find(Word,[Word|T],Acc) -> find(Word,T,Acc);
find(Word,[H|T],Acc) ->
  case lists:sum(Word) == lists:sum(H) of
    true  -> find(Word, T, [H|Acc]);
    false -> find(Word, T, Acc)
  end.
find(Word,Possible) -> find(Word,Possible,[]).

