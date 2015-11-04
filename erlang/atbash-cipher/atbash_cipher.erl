-module(atbash_cipher).
-export([encode/1, decode/1]).

cipher(C) when C >= $a, C =< $z -> [$a + $z - C];
cipher(C) when C >= $A, C =< $Z -> [$A + $Z - C + 32] ;
cipher(" ") -> "";
cipher(Num) when Num >= $0, Num =< $9 -> [Num];
cipher(_) -> "".

encode([], Acc, _)         -> Acc;
encode([32|T], Acc, Count) -> encode(T, Acc, Count);
encode([C|T], Acc, Count)  ->
  Encoded = cipher(C),
  if
    Encoded == "" -> encode(T, Acc, Count);
    Count == 5    -> encode(T, Acc ++ " " ++ Encoded, 1);
    true          -> encode(T, Acc ++ Encoded, Count + 1)
  end.
encode(Str) -> encode(Str, [], 0).

decode([], Acc)         -> Acc;
decode([32|T], Acc) -> decode(T, Acc);
decode([C|T], Acc)  ->
  Decoded = cipher(C),
  if
    Decoded == "" -> decode(T, Acc);
    true          -> decode(T, Acc ++ Decoded)
  end.
decode(Str) -> decode(Str, []).
