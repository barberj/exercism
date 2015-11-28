-module(circular_buffer).
-export([create/1, size/1, read/1, circulate/1, write/2, write_attempt/2]).

-record(buffer, {elements=[], size=undefined}).

create(Size) ->
  spawn(?MODULE, circulate, [#buffer{size=Size}]).

size(Buffer) ->
  Buffer ! {self(), {size}},
  receive
    {ok, Size} -> {ok, Size}
  end.

read(Buffer) ->
  Buffer ! {self(), {read}},
  receive
    {ok, Element} -> {ok, Element};
    {error, empty} -> {error, empty}
  end.

write(Buffer, Element) ->
  Buffer ! {self(), {write, Element}},
  receive
    {ok, Element} -> {ok, Element}
  end.

write_attempt(Buffer, Element) ->
  Buffer ! {self(), {write_attempt, Element}},
  receive
    ok -> ok;
    {error, full} -> {error, full}
  end.

circulate(Buffer) ->
  receive
    {From, {size}} ->
      From ! {ok, Buffer#buffer.size},
      circulate(Buffer);

    {From, {read}} ->
      case Buffer#buffer.elements of
        [] ->
          From ! {error, empty},
          circulate(Buffer);
        [H|T] ->
          From ! {ok, H},
          circulate(Buffer#buffer{elements=T, size=Buffer#buffer.size})
        end;

    {From, {write, Element}} ->
      CurrentSize = length(Buffer#buffer.elements),
      NewBuffer = if
        CurrentSize < Buffer#buffer.size ->
          Buffer#buffer.elements ++ [Element];
        true ->
          [_|T] = Buffer#buffer.elements,
          T ++ [Element]
      end,
      From ! {ok, Element},
      circulate(Buffer#buffer{
        elements = NewBuffer,
        size = Buffer#buffer.size
      });

    {From, {write_attempt, Element}} ->
      CurrentSize = length(Buffer#buffer.elements),
      NewBuffer = if
        CurrentSize < Buffer#buffer.size ->
          From ! ok,
          Buffer#buffer{
            elements = Buffer#buffer.elements ++ [Element],
            size = Buffer#buffer.size
          };
        true ->
          From ! {error, full},
          Buffer
      end,
      circulate(NewBuffer)
  end.
