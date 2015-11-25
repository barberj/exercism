-module(binary_string).
-export([to_decimal/1]).

to_decimal(String) ->
  to_decimal(lists:reverse(String), 0, 0).

to_decimal([], Acc, _)     -> round(Acc);
to_decimal([$0|T], Acc, I) -> to_decimal(T, Acc, I + 1);
to_decimal([$1|T], Acc, I) -> to_decimal(T, Acc + (1 * math:pow(2, I)), I + 1);
to_decimal([_|T], Acc, I)  -> to_decimal(T, Acc, I + 1).
