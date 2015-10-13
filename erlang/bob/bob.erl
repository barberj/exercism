-module(bob).
-export([response_for/1]).

-define(QUESTION, "\\?$").
-define(NOTSHOUTING, "[[:lower:]]").
-define(SHOUTING, "[[:upper:]]").
-define(SILENCE, "^[\\p{Xps}]*$").

response_for(Phrase) ->
  case {re:run(Phrase, ?QUESTION, [ucp]), re:run(Phrase, ?NOTSHOUTING, [ucp]), re:run(Phrase, ?SHOUTING, [ucp]), re:run(Phrase, ?SILENCE, [ucp]) } of
    {_, nomatch, {_, _}, nomatch} -> "Whoa, chill out!";
    {{_, _}, _, _, nomatch} -> "Sure.";
    {nomatch, nomatch, nomatch, {_, _}} -> "Fine. Be that way!";
    _ -> "Whatever."
  end.
