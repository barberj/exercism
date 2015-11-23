-module(robot_simulator).
-export([create/0, direction/1, position/1, place/3, simulate_robot/1, left/1, right/1, advance/1, control/2]).

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

left(Robot) ->
  Robot ! {self(), {left}},
  receive
    {Robot, ok} -> ok
  end.

right(Robot) ->
  Robot ! {self(), {right}},
  receive
    {Robot, ok} -> ok
  end.

advance(Robot) ->
  Robot ! {self(), {advance}},
  receive
    {Robot, Direction} -> Direction
  end.

control(Robot, [$A| Tail]) ->
  advance(Robot),
  control(Robot, Tail);
control(Robot, [$L| Tail]) ->
  left(Robot),
  control(Robot, Tail);
control(Robot, [$R| Tail]) ->
  right(Robot),
  control(Robot, Tail);
control(Robot, _) -> Robot.

turn(north, left) -> west;
turn(north, right) -> east;
turn(west, right) -> north;
turn(west, left) -> south;
turn(east, left) -> north;
turn(east, right) -> south;
turn(south, left) -> east;
turn(south, right) -> west.

move(north, {X, Y}) -> {X, Y + 1};
move(west, {X, Y}) -> {X - 1, Y};
move(east, {X, Y}) -> {X + 1, Y};
move(south, {X, Y}) -> {X, Y - 1}.

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
      simulate_robot(Robot);
    {From, {left}} ->
      NewRobot = Robot#robot{direction=turn(Robot#robot.direction,left), position=Robot#robot.position},
      From ! {self(), ok},
      simulate_robot(NewRobot);
    {From, {right}} ->
      NewRobot = Robot#robot{direction=turn(Robot#robot.direction,right), position=Robot#robot.position},
      From ! {self(), ok},
      simulate_robot(NewRobot);
    {From, {advance}} ->
      NewRobot = Robot#robot{direction=Robot#robot.direction, position=move(Robot#robot.direction, Robot#robot.position)},
      From ! {self(), ok},
      simulate_robot(NewRobot)
  end.
