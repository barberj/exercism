-module(word_count).
-export([count/1]).

count([], Map) ->
  dict:from_list(maps:to_list(Map));
count([W|T], Map) ->
  count(T, maps:put(W, maps:get(W, Map, 0) + 1, Map)).
count(String) ->
  Cleaned = re:replace(String,"[^A-Za-z0-9]+", " ", [{return, list}]),
  Stripped = string:strip(Cleaned),
  Normed = string:to_lower(Stripped),
  Tokens = re:split(Normed, "[^a-z0-9]+", [trim,{return, list}]),
  count(Tokens, #{}).
