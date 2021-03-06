-module(anagram).
-export([find/2]).

is_anagram(W,W) -> false;
is_anagram(W,C) -> lists:sort(W) == lists:sort(C).

find(_,[],Acc)          -> lists:reverse(Acc);
find(Word,[Word|T],Acc) -> find(Word,T,Acc);
find(Word,[H|T],Acc)    ->
  case is_anagram(string:to_lower(Word), string:to_lower(H)) of
    true  -> find(Word, T, [H|Acc]);
    false -> find(Word, T, Acc)
  end.

-spec(find(list(), list()) -> list()).
find(Word,Possible) -> find(Word,Possible,[]).
