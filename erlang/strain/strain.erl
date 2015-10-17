-module(strain).
-export([keep/2,discard/2]).

-spec keep(fun((term()) -> boolean()), list()) -> list().
keep(Pred, Ls) -> [X || X <- Ls, Pred(X)].

-spec discard(fun((term()) -> boolean()), list()) -> list().
discard(Pred, Ls) -> [X || X <- Ls, not Pred(X)].
