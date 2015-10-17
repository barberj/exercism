-module(strain).
-export([keep/2,discard/2]).

keep(Pred, Ls) -> [X || X <- Ls, Pred(X)].
discard(Pred, Ls) -> [X || X <- Ls, Pred(X) == false].
