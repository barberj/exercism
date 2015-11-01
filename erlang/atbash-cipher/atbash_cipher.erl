-module(atbash_cipher).
-export([encode/1, decode/1]).

e_cipher(A) when A == $a; A == $A -> "z";
e_cipher(B) when B == $b; B == $B -> "y";
e_cipher(C) when C == $c; C == $C -> "x";
e_cipher(D) when D == $d; D == $D -> "w";
e_cipher(E) when E == $e; E == $E -> "v";
e_cipher(F) when F == $f; F == $F -> "u";
e_cipher(G) when G == $g; G == $G -> "t";
e_cipher(H) when H == $h; H == $H -> "s";
e_cipher(I) when I == $i; I == $I -> "r";
e_cipher(J) when J == $j; J == $J -> "q";
e_cipher(K) when K == $k; K == $K -> "p";
e_cipher(L) when L == $l; L == $L -> "o";
e_cipher(M) when M == $m; M == $M -> "n";
e_cipher(N) when N == $n; N == $N -> "m";
e_cipher(O) when O == $o; O == $O -> "l";
e_cipher(P) when P == $p; P == $P -> "k";
e_cipher(Q) when Q == $q; Q == $Q -> "j";
e_cipher(R) when R == $r; R == $R -> "i";
e_cipher(S) when S == $s; S == $S -> "h";
e_cipher(T) when T == $t; T == $T -> "g";
e_cipher(U) when U == $u; U == $U -> "f";
e_cipher(V) when V == $v; V == $V -> "e";
e_cipher(W) when W == $w; W == $W -> "d";
e_cipher(X) when X == $x; X == $X -> "c";
e_cipher(Y) when Y == $y; Y == $Y -> "b";
e_cipher(Z) when Z == $z; Z == $Z -> "a";
e_cipher(" ") -> "";
e_cipher(Num) when Num >= $0, Num =< $9 -> [Num];
e_cipher(_) -> "".

encode([], Acc, _)         -> Acc;
encode([32|T], Acc, Count) -> encode(T, Acc, Count);
encode([C|T], Acc, Count)  ->
  Encoded = e_cipher(C),
  if
    Encoded == "" -> encode(T, Acc, Count);
    Count == 5    -> encode(T, Acc ++ " " ++ Encoded, 1);
    true          -> encode(T, Acc ++ Encoded, Count + 1)
  end.
encode(Str) -> encode(Str, [], 0).
decode(Str) -> Str.
