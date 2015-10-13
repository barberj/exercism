-module(bob).
-export([response_for/1]).

response_for([]) -> "Fine. Be that way!";
response_for(Conversation) ->
  case re:run(Conversation, "(.+!$)|i([A-Z]{2,})") of
    nomatch ->
      case re:run(Conversation, ".*?.*") of
        {match, _} -> "Sure.";
        nomatch ->  "Whatever."
      end;
    {match, _} -> "Whoa, chill out!"
  end.
