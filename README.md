# ICBT_model
The RJMCMC sampler for the Intransitive Clustered Bradley-Terry model.
 
dir. RJMCMC alg contains all the scripts required to run the RJMCMC algorithm
dir. baseball_example contains an example applied to baseball.

to test:
run through script "baseball_example/Baseball_example.R"
 
Data must be in paired comparison format with: "gameId", "player1", "score1", "player2", "score2", where "gameId" is the index of the specific comparison, "player1" is a numeric which uniquely identifies the 1st player, "score1" is the result of player1 which is 2 if player1 won, 0 if player1 lost, and 1 in the case of draws (draws not yet supported). "player2" is a numeric which uniquely identifies the 2st player in the comparison, and "score2" is the result of player 2 (which is just 2-"score1").
