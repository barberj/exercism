-module(dna).
-export([count/2]).

-spec(count(string(), string()) -> integer()).

count([], _Nucleotide, Acc)   -> Acc;
count([$A|T], "A", Acc)       -> count(T, "A", Acc + 1);
count([$T|T], "T", Acc)       -> count(T, "T", Acc + 1);
count([$C|T], "C", Acc)       -> count(T, "C", Acc + 1);
count([$G|T], "G", Acc)       -> count(T, "G", Acc + 1);
count([_|T], Nucleotide, Acc) -> count(T, Nucleotide, Acc).

count(Dna, Nucleotide) when
  Nucleotide == "A";
  Nucleotide == "T";
  Nucleotide == "C";
  Nucleotide == "G" ->
    count(Dna, Nucleotide, 0);
count(_,_)            -> error("Invalid nucleotide").
