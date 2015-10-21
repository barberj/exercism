-module(dna).
-export([count/2, nucleotide_counts/1]).

count([], _Nucleotide, Acc)   -> Acc;
count([$A|T], "A", Acc)       -> count(T, "A", Acc + 1);
count([$T|T], "T", Acc)       -> count(T, "T", Acc + 1);
count([$C|T], "C", Acc)       -> count(T, "C", Acc + 1);
count([$G|T], "G", Acc)       -> count(T, "G", Acc + 1);
count([_|T], Nucleotide, Acc) -> count(T, Nucleotide, Acc).

-spec(count(string(), string()) -> integer()).
count(Dna, Nucleotide) when
  Nucleotide == "A";
  Nucleotide == "T";
  Nucleotide == "C";
  Nucleotide == "G" ->
    count(Dna, Nucleotide, 0);
count(_,_)          -> error("Invalid nucleotide").

-spec(nucleotide_counts(string()) -> list(tuple())).
nucleotide_counts([])  -> [{"A", 0}, {"T", 0}, {"C", 0}, {"G", 0}];
nucleotide_counts(Dna) -> [
  {"A", count(Dna, "A")},
  {"T", count(Dna, "T")},
  {"C", count(Dna, "C")},
  {"G", count(Dna, "G")}
].
