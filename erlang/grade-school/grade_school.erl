-module(grade_school).
-export([new/0, add/3, get/2, sort/1]).

new() -> orddict:new().

get(Grade, School) ->
  case orddict:find(Grade, School) of
    error          -> [];
    {ok, Students} -> Students
  end.

add(Name, Grade, School) ->
  Students = get(Grade, School),
  orddict:store(Grade, [Name| Students], School).

sort(School) -> School.
