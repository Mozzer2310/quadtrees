%%% @author Sam Morris
%%% @copyright (C) 2024, Sam Morris
%%% @doc 
%%%
%%% @end
%%% Created : 19 May 2024 by Sam Morris
-module(quadtrees).

-export([
    allWhite/1,
    allBlack/1,
    clockwise/4,
    anticlockwise/4,
    is_pixel/1,
    is_quadtree/1,
    reduce/1
]).

-type pixel() :: white | black.
-type quadtree() :: {quadtree() | pixel(), quadtree(), pixel(), quadtree() | pixel(), quadtree() | pixel()} | pixel().

-spec is_pixel(term()) -> boolean().
is_pixel(white) ->
    true;
is_pixel(black) ->
    true;
is_pixel(_) ->
    false.

-spec is_quadtree(term()) -> boolean().
is_quadtree({Q1, Q2, Q3, Q4}) ->
    is_quadtree(Q1) and is_quadtree(Q2) and is_quadtree(Q3) and is_quadtree(Q4);
is_quadtree(Leaf) ->
    is_pixel(Leaf).

-spec reduce(quadtree()) -> quadtree().
reduce(Pixel) when is_atom(Pixel) ->
    Pixel;
reduce({Q, Q, Q, Q}) when is_atom(Q) ->
    Q;
reduce({Q1, Q2, Q3, Q4}) ->
    reduce({reduce(Q1), reduce(Q2), reduce(Q3), reduce(Q4)}).

%%%===================================================================
%%% Exercise 1
%%%===================================================================
-spec allWhite(integer()) -> quadtree().
allWhite(_Integer) ->
    white.

-spec allBlack(integer()) -> quadtree().
allBlack(_Integer) ->
    black.

-spec clockwise(quadtree(), quadtree(), quadtree(), quadtree()) -> quadtree().
clockwise(Quadtree1, Quadtree2, Quadtree3, Quadtree4) ->
    {Quadtree1, Quadtree2, Quadtree4, Quadtree3}.

-spec anticlockwise(quadtree(), quadtree(), quadtree(), quadtree()) -> quadtree().
anticlockwise(Quadtree1, Quadtree2, Quadtree3, Quadtree4) ->
    {Quadtree1, Quadtree4, Quadtree3, Quadtree2}.

%%%===================================================================
%%% Exercise 2
%%%===================================================================

% TODO: implement ndiff for exercise 2
ndiff(Quadtree) ->
    ok.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

%%%===================================================================
%%% Tests
%%%===================================================================

% TODO: convert 'tester.hs' to eunit tests, as well as other tests available here: https://online.manchester.ac.uk/webapps/blackboard/content/listContent.jsp?course_id=_67608_1&content_id=_12772808_1&mode=reset 
allWhite_test() ->
    ?_assertEqual(white, allWhite(1)),
    ?_assertEqual(white, allWhite(4)),
    ?_assertEqual(white, allWhite(16)).

allBlack_test() ->
    ?_assertEqual(white, allBlack(1)),
    ?_assertEqual(white, allBlack(4)),
    ?_assertEqual(white, allBlack(16)).

exercise1_test()  ->
    ?_assertEqual(quadtrees:clockwise(quadtrees:allBlack(1), quadtrees:allBlack(1), quadtrees:allWhite(1), quadtrees:allWhite(1)), quadtrees:anticlockwise(quadtrees:allBlack(1), quadtrees:allWhite(1), quadtrees:allWhite(1), quadtrees:allBlack(1))).

-endif.

