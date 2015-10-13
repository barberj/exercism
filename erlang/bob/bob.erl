-module(bob).
-export([response_for/1]).

response_for([]) -> "Fine. Be that way!";
response_for(_) -> "Whatever.".
