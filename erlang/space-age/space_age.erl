-module(space_age).
-export([ageOn/2]).

-spec(ageOn(atom(), integer()) -> float()).
ageOn(earth,   Seconds) -> ageOn(1,          Seconds);
ageOn(mercury, Seconds) -> ageOn(0.2408467,  Seconds);
ageOn(venus,   Seconds) -> ageOn(0.61519726, Seconds);
ageOn(mars,    Seconds) -> ageOn(1.8808158,  Seconds);
ageOn(jupiter, Seconds) -> ageOn(11.862615,  Seconds);
ageOn(saturn,  Seconds) -> ageOn(29.447498,  Seconds);
ageOn(uranus,  Seconds) -> ageOn(84.016846,  Seconds);
ageOn(neptune, Seconds) -> ageOn(164.79132,  Seconds);
ageOn(Factor,  Seconds) -> Seconds / 31557600 / Factor.
