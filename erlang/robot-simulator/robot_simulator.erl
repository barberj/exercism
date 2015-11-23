-module(robot_simulator).
-export([create/0, direction/1, position/1, place/3, simulate_robot/1]).
%-export([create/0,direction/1,position/1,place/3,left/1,right/1,control/2]).

-record(robot, {direction=undefined, position={undefined, undefined}}).

create() ->
  spawn(?MODULE, simulate_robot, [#robot{}]).

direction(Robot) ->
  Robot ! {self(), {direction}},
  receive
    {Robot, Direction} -> Direction
  end.

position(Robot) ->
  Robot ! {self(), {position}},
  receive
    {Robot, Position} -> Position
  end.

place(Robot, Direction, Position) ->
  Robot ! {self(), {Direction, Position}},
  receive
    {Robot, ok} -> ok
  end.

simulate_robot(Robot) ->
  receive
    {From, {hi}} ->
      From ! {self(), yello};
    {From, {Direction, Position}} ->
      NewRobot = #robot{direction=Direction, position=Position},
      From ! {self(), ok},
      simulate_robot(NewRobot);
    {From, {direction}} ->
      From ! {self(), Robot#robot.direction},
      simulate_robot(Robot);
    {From, {position}} ->
      From ! {self(), Robot#robot.position},
      simulate_robot(Robot)
  end.
