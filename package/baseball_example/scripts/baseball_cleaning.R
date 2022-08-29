format_baseball_data = function(df){ ## selecting only "AL" league matches
  
  
  index = which(df$V5 == "AL" & df$V8 == "AL")
  df_ = matrix(1:length(index), ncol = 1, nrow = length(index))
  
  df_ = cbind(df_, as.numeric(droplevels(df[index,c(7)])))
  df_ = cbind(df_, 2*(df[index,c(11)]>df[index,c(10)]))
  df_ = cbind(df_, as.numeric(droplevels(df[index,c(4)])))
  df_ = cbind(df_, 2-df_[,3])
  df_ = cbind(df_, df[index,1])
  
  colnames(df_) = c("gameId", "player1", "score1", "player2", "score2", "date")
  return(df_)
}