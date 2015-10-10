-module(rna_transcription).
-export([to_rna/1, dna_rna_map/1]).

dna_rna_map($G) -> "C";
dna_rna_map($C) -> "G";
dna_rna_map($T) -> "A";
dna_rna_map($A) -> "U";
dna_rna_map(_)  -> "".

to_rna([])                  -> "";
to_rna([Nucleotide|Strand]) ->
  lists:concat([dna_rna_map(Nucleotide), to_rna(Strand)]).
