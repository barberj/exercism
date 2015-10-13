-module(bob).
-export([response_for/1]).

response_for([]) -> "Fine. Be that way!";
response_for(Phrase) ->
  Question = "\\?$",
  NotShouting = "[[:lower:]]",
  Shouting = "[[:upper:]]",
  Silence = "^[\\p{Xps}]*$",

  case {re:run(Phrase, Question, [ucp]), re:run(Phrase, NotShouting, [ucp]), re:run(Phrase, Shouting, [ucp]), re:run(Phrase, Silence, [ucp]) } of
    {_, nomatch, {_, _}, nomatch} -> "Whoa, chill out!";
    {{_, _}, _, _, nomatch} -> "Sure.";
    {nomatch, nomatch, nomatch, {_, _}} -> "Fine. Be that way!";
    _ -> "Whatever."
  end.
