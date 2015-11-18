-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

number([H|T], Cleaned) when H >= $0, H =< $9  -> number(T, Cleaned ++ [H]);
number([_|T], Cleaned)                        -> number(T, Cleaned);
number([], Cleaned)                           ->
  if
    length(Cleaned) == 10                    -> Cleaned;
    length(Cleaned) == 11, hd(Cleaned) == $1 -> tl(Cleaned);
    true                                     -> "0000000000"
  end.
number(Number)                                -> number(Number, []).

number_parts(Number) ->
  Cleaned = number(Number),
  {AreaCode, Tail} = lists:split(3, Cleaned),
  {ExchangeName, Remain} = lists:split(3, Tail),
  {AreaCode, ExchangeName, Remain}.

areacode(Number) ->
  {AreaCode, _, _} = number_parts(Number),
  AreaCode.

pretty_print(Number) ->
  {AreaCode, ExchangeName, Remain} = number_parts(Number),
  "(" ++ AreaCode ++ ")" ++ " " ++ ExchangeName ++ "-" ++ Remain.
