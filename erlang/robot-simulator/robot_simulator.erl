-module(robot_simulator).
-export([create/0, direction/1, position/1, place/3]).
%-export([create/0,direction/1,position/1,place/3,left/1,right/1,control/2]).

-record(robot, {direction=undefined, position={undefined, undefined}}).

create() -> #robot{}.

direction(#robot{direction=Direction}) -> Direction.
position(#robot{position=Position}) -> Position.

place(Robot, Direction, Position) ->
  #robot{direction=Direction, position=Position}.
