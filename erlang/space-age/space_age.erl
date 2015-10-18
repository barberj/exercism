-module(space_age).
-export([ageOn/2]).


ageOn(Seconds) -> round(Seconds * 100) / 100.

-spec(ageOn(atom(), integer()) -> float()).
ageOn(earth, Seconds)   -> ageOn(Seconds / 31557600);
ageOn(mercury, Seconds) -> ageOn(ageOn(earth, Seconds) / 0.2408467);
ageOn(venus, Seconds)   -> ageOn(ageOn(earth, Seconds) / 0.61519726);
ageOn(mars, Seconds)    -> ageOn(ageOn(earth, Seconds) / 1.8808158);
ageOn(jupiter, Seconds) -> ageOn(ageOn(earth, Seconds) / 11.862615);
ageOn(saturn, Seconds)  -> ageOn(ageOn(earth, Seconds) / 29.447498);
ageOn(uranus, Seconds)  -> ageOn(ageOn(earth, Seconds) / 84.016846);
ageOn(neptune, Seconds) -> ageOn(ageOn(earth, Seconds) / 164.79132).
