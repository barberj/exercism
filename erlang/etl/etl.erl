-module(etl).
-export([transform/1]).

transform({Score, Letters}, Acc) ->
  Mapper = fun(Letter, Map) -> [{string:to_lower(Letter), Score} | Map] end,
  lists:foldl(Mapper, Acc, Letters).

transform(ScrabbleData) when is_list(ScrabbleData) ->
  lists:foldl(fun transform/2, [], ScrabbleData).
