-module(hanoi).
-export([create_towers/1, display_towers/1, move/5, solve/1]).

%% This function creates 3 initial towers.
%% Tower1 with disks list from 1 to N, tower2 and tower3 are empty list.
create_towers(N) ->
	[{tower1, lists:seq(1,N)}, {tower2, []}, {tower3, []}].

%% This function display the Game list for each tuple.
display_towers(Game) ->
	io:format("-------------------- ~n"),

	% For each tuples in Game, display the index and ordered-disks
	lists:foreach(fun(X) ->
		io:format("~w: ~w ~n", [element(1,X), lists:reverse(element(2,X),[])])
		end, Game),

	io:format("-------------------- ~n").

%% This function move the disks from source to target by recursive.
move(1, Game, Source, Target, Aux) ->
	% Split the first disk from source-tower.
	[Head|NewSource] = element(2, lists:keyfind(Source, 1, Game)),

	% Put the split disk of source-tower to the front of target-tower.
	NewTarget = [Head|element(2, lists:keyfind(Target, 1, Game))],

	% Replace target-tower with NewTarget, then replace source-tower with NewSouce.
	NewGame = lists:keyreplace(Source, 1, lists:keyreplace(Target, 1, Game, {Target, NewTarget}), {Source, NewSource}),

	% Display the stage for each move steps.
	display_towers(NewGame),
	NewGame;

move(N, Game, Source, Target, Aux) ->
	% Move n-1 disks from source to auxiliary.
	Round1 = move(N-1, Game, Source, Aux, Target),

	% Move the n-th disk from source to target.
	Round2 = move(1, Round1, Source, Target, Aux),

	% Move the n-1 disks that we left on auxiliary onto target.
	move(N-1, Round2, Aux, Target, Source).

%% This function display the initial tower stage and do the initial move.
solve(Game) ->
	io:format("*****Start Game***** ~n"),
	display_towers(Game),
	move(length(element(2, lists:keyfind(tower1, 1, Game))), Game, tower1, tower3, tower2),
	io:format("*****Complete Game***** ~n").

