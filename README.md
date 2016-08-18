# Tournament Database

## 1) Overview

This is a simple project to manage a swiss-system tournament, a non-eliminating tournament format where players accumulate points in each round in order to determine an overall winner. The project is built with PostgreSQL, and contains database tables for both players and matches. It pairs players of similar points standing in matches before arriving at an overall tournament winner.


## 2) Steps to run application

You should begin by running tournament.sql in the PostgreSQL console to create the 'tournament' database with relevant tables and views: 

	\i tournament.sql;

Note that if a 'tournament' database already exists, it will be dropped before the script executes. This script can therefore be used to create a 'clean' database for a swiss-system tournament, if you want to begin from scratch. 

Second, run functions as desired from tournament.py, which connects to the database tables you have just created.


## 3) Details of functions

Tournament.py contains the below functions. Note that tournament_test.py provides a few test cases for these functions, illustrating how they may be used in practice.

####### registerPlayer(name)

Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different IDs.


####### countPlayers()

Returns the number of currently registered players.


####### deletePlayers()

Clear out all the player records from the database.


####### reportMatch(winner, loser)

Stores the outcome of a single match between two players in the database. The arguments should match the IDs of the 'winner' and 'loser'.


####### deleteMatches()

Clears out all the match records from the database.


####### playerStandings()

Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.


####### swissPairings()

Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function will typically be used after a tournament round, in order to re-allocate players for the next set of matches. 
