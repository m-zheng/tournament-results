-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- This one will create a new database called tournament.
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;


-- Connect to the database.
\c tournament;


-- This one will create a new table called players.
-- It stores a unique id for each player and player's name.
DROP TABLE IF EXISTS players;
CREATE TABLE players (id SERIAL PRIMARY KEY,
                      name TEXT);


-- This one will create a new table called matches.
-- It stores winner's id and loser's id for each match.
DROP TABLE IF EXISTS matches;
CREATE TABLE matches (id SERIAL PRIMARY KEY,
                      winner INTEGER REFERENCES players (id),
                      loser INTEGER REFERENCES players (id));


-- This one will create a temporary view called total_wins. 
-- It stores the total number of games the player has won.
DROP VIEW IF EXISTS total_wins;
CREATE VIEW total_wins AS
SELECT players.id, players.name, COUNT(matches.winner) AS wins
FROM players
LEFT JOIN matches
ON players.id = matches.winner
GROUP BY players.id
ORDER BY players.id;


-- This one will create a temporary view called total_matches. 
-- It stores the total number of matches the player has played.
DROP VIEW IF EXISTS total_matches;
CREATE VIEW total_matches AS 
SELECT players.id, players.name, (SELECT COUNT(id) 
                                  FROM matches
                                  WHERE winner = players.id OR loser = players.id) AS matches
FROM players; 
