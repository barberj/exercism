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
e_cipher(_) -> "".

encode([], Acc) -> Acc;
encode([C|T], Acc) ->  encode(T, Acc ++ e_cipher(C)).
encode(Str) -> encode(Str, []).
decode(Str) -> Str.
