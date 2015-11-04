-module(atbash_cipher).
-export([encode/1, decode/1]).

cipher(A) when A == $a; A == $A -> "z";
cipher(B) when B == $b; B == $B -> "y";
cipher(C) when C == $c; C == $C -> "x";
cipher(D) when D == $d; D == $D -> "w";
cipher(E) when E == $e; E == $E -> "v";
cipher(F) when F == $f; F == $F -> "u";
cipher(G) when G == $g; G == $G -> "t";
cipher(H) when H == $h; H == $H -> "s";
cipher(I) when I == $i; I == $I -> "r";
cipher(J) when J == $j; J == $J -> "q";
cipher(K) when K == $k; K == $K -> "p";
cipher(L) when L == $l; L == $L -> "o";
cipher(M) when M == $m; M == $M -> "n";
cipher(N) when N == $n; N == $N -> "m";
cipher(O) when O == $o; O == $O -> "l";
cipher(P) when P == $p; P == $P -> "k";
cipher(Q) when Q == $q; Q == $Q -> "j";
cipher(R) when R == $r; R == $R -> "i";
cipher(S) when S == $s; S == $S -> "h";
cipher(T) when T == $t; T == $T -> "g";
cipher(U) when U == $u; U == $U -> "f";
cipher(V) when V == $v; V == $V -> "e";
cipher(W) when W == $w; W == $W -> "d";
cipher(X) when X == $x; X == $X -> "c";
cipher(Y) when Y == $y; Y == $Y -> "b";
cipher(Z) when Z == $z; Z == $Z -> "a";
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
