-module(word_count).
-export([count/1]).

count([], Map) -> dict:from_list(maps:to_list(Map));
count([W|T], Map) -> count(T, maps:put(W, maps:get(W, Map, 0) + 1, Map)).
count(String) -> count(string:tokens(String, " "), #{}).
