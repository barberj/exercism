-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

validate(Number) when length(Number) == 10      -> Number;
validate([$1|Number]) when length(Number) == 10 -> Number;
validate(_) -> lists:duplicate(10, $0).

number(Number) ->
  IsDigit = fun (Digit) -> Digit >= $0 andalso Digit =< $9 end,
  validate(lists:filter(IsDigit, Number)).

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
