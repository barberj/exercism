-module(etl).
-export([transform/1]).

map_letters(_, [], Acc)            -> Acc;
map_letters(Score, [Letter|Tail], Acc) ->
  map_letters(Score, Tail, Acc ++ [{string:to_lower(Letter), Score}]).



transform([], Acc) -> Acc;
transform([{Score,Letters}|Tail], Acc) ->
  LetterMap = map_letters(Score, Letters, []),
  transform(Tail, Acc ++ LetterMap).
transform(ScrabbleData) -> transform(ScrabbleData, []).
