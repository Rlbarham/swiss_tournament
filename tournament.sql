-- Drops views and tables if they already exist
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

-- Table definitions for the tournament project, both for players and matches
CREATE TABLE players (  
	id serial PRIMARY KEY,
	name text 
);

CREATE TABLE matches (  
	id serial PRIMARY KEY,
	winner integer REFERENCES players(id),
	loser integer REFERENCES players(id),
	CHECK (winner != loser)
);

-- View definitions for the project, which include the following
----> A view for wins per player
----> A view for matches played per player
----> A view for 'standings' that combines these, i.e. displays wins and matches for each player

CREATE VIEW win_count AS (
	SELECT 
		players.id, 
		players.name, 
		count(matches.winner) 
		AS wins
	FROM players LEFT JOIN matches
	ON players.id = matches.winner
	GROUP BY players.id
	ORDER BY wins DESC
);

CREATE VIEW match_count AS (
	SELECT 
		players.id, 
		players.name, 
		count(matches) 
		AS matches
	FROM players LEFT JOIN matches
	ON players.id = matches.winner OR players.id = matches.loser
	GROUP BY players.id
);
	
CREATE VIEW standings AS (
	SELECT 
		win_count.id, 
		win_count.name, 
		wins, 
		matches 
	FROM win_count join match_count 
	ON win_count.id=match_count.id
	ORDER BY wins DESC
);
