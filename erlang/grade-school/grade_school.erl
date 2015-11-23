-module(grade_school).
-export([new/0, add/3, get/2, sort/1]).

new() -> orddict:new().

get(Grade, School) ->
  case orddict:find(Grade, School) of
    error          -> [];
    {ok, Students} -> Students
  end.

add(Name, Grade, School) ->
  orddict:append(Grade, Name, School).

sort(School) -> [{Grade, lists:sort(Students)} || {Grade, Students} <- School].
