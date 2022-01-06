# ICBT_model
 The RJMCMC sampler for the Intransitivity Clustered Bradley-Terry model.
 
 "MH" contains the Metropolis Hastings updates.
 "Split_merge" contains the split-merge moves.
 "step" dictates the ordering of the updates and the associated probabilities.
 "calcs" contains all likelihood calculations, posterior, priors, Jacobians etc..
 "main" contains wrappers for updating model instances at each step. All hyperparameters and algorithm parameters are defined here also.
 
 Data must be in paired comparison format with: "gameId", "player1", "score1", "player2", "score2", where "gameId" is the index of the specific comparison, "player1" is a numeric which uniquely identifies the 1st player, "score1" is the result of player1 which is 2 if player1 won, 0 if player1 lost, and 1 in the case of draws. "player2" is a numeric which uniquely identifies the 2st player in the comparison, and "score2" is the result of player 2 (which is just 2-"score1").
