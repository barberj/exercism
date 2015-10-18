-module(space_age).
-export([ageOn/2]).

ageOn(Seconds) -> round(Seconds * 100) / 100.

-spec(ageOn(atom(), integer()) -> float()).
ageOn(Planet, Seconds)  ->
  Normalized = case Planet of
    mercury -> Seconds / 0.2408467;
    venus   -> Seconds / 0.61519726;
    mars    -> Seconds / 1.8808158;
    jupiter -> Seconds / 11.862615;
    saturn  -> Seconds / 29.447498;
    uranus  -> Seconds / 84.016846;
    neptune -> Seconds / 164.79132;
    _       -> Seconds
  end,
  EarthSeconds = Normalized / 31557600,
  ageOn(EarthSeconds).
