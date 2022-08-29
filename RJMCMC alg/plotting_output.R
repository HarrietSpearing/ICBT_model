plot_output_A = function(output, save_output=F, folder, model_name){
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_phi_1.pdf")) 
    
  }
  matplot(t(output$RJMCMC$model1$postPhi), type = "l", lty = 1,main = "model1: Phi", 
          ylab = "Strength levels")
  if(save_output == T){
    dev.off() 
  }
  
  
  if(sum(output$RJMCMC$model1$postTheta^2) !=0){
    readline(prompt = "Pause. Press <Enter> to continue...")
    if(save_output == T){
      pdf(paste0(folder,"/",model_name,"_theta_1.pdf")) 
      
    }
    matplot(t(output$RJMCMC$model1$postTheta), type = "l", lty = 1, main = "model1: theta",
            ylab = "intransitivity levels")
  }
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_postd_1.pdf")) 
  }
  plot(output$RJMCMC$model1$postd,type = "l", main = "model1: postd", ylab = "post density")
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_llh_1.pdf")) 
  }
  plot(output$RJMCMC$model1$llh,type = "l", main = "model1: llh", ylab = "log likelihood")
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_phi_2.pdf")) 
  }
  matplot(t(output$RJMCMC$model2$postPhi), type = "l", lty = 1, main = "model2: Phi", ylab = "strength levels")
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  plot(output$RJMCMC$model2$postAllocation_A[1,],type = "l", 
       ylim = c(1,output$input_model$postCl_df_A+1), main = "model2: alloc _A", 
       ylab = "strength allocation(examples)")
  lines(output$RJMCMC$model2$postAllocation_A[2,], type = "l",col=2)
  lines(output$RJMCMC$model2$postAllocation_A[5,], type = "l",col=3)
  
  if(sum(output$RJMCMC$model1$postTheta^2) !=0){
    readline(prompt = "Pause. Press <Enter> to continue...")
    if(save_output == T){
      pdf(paste0(folder,"/",model_name,"_theta_2.pdf")) 
    }
    matplot(t(output$RJMCMC$model2$postTheta), type = "l", lty = 1, main = "model2: theta",
            ylab = "intransitivity levels")
    if(save_output == T){
      dev.off() 
    }
  }
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  plot(output$RJMCMC$model2$postAllocation[1,],type = "l", 
       ylim = c(-output$input_model$postCl_df,output$input_model$postCl_df), main = "model2: alloc")
  lines(output$RJMCMC$model2$postAllocation[2,], type = "l",col=2)
  lines(output$RJMCMC$model2$postAllocation[5,], type = "l",col=3)
  lines(output$RJMCMC$model2$postAllocation[11,], type = "l",col=4)
  lines(output$RJMCMC$model2$postAllocation[12,], type = "l",col=5)
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_postd_2.pdf")) 
  }
  plot(output$RJMCMC$model2$postd,type = "l", main = "model2: postd", ylab = "log posterior density")
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_llh_2.pdf")) 
  }
  plot(output$RJMCMC$model2$llh,type = "l", main = "model2: llh", ylab = "llh")
  if(save_output == T){
    dev.off() 
  }
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_phi_3.pdf")) 
  }
  matplot(t(output$RJMCMC$model3$postPhi), type = "l", lty = 1, main = "model3: Phi")
  if(save_output == T){
    dev.off() 
  }
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_theta_3.pdf")) 
  }
  matplot(t(output$RJMCMC$model3$postTheta), type = "l", lty = 1, main = "model3: theta", 
          ylim = c(0,max(output$RJMCMC$model3$postTheta,na.rm = T)))
  if(save_output == T){
    dev.off() 
  }
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_postd_3.pdf")) 
  }
  plot(c(output$RJMCMC$model1$postd,
         output$RJMCMC$model2$postd,
         output$RJMCMC$model3$postd),type = "l", main = "model_all: postd", ylab = "log posterior density")
  len1 = length(output$RJMCMC$model1$n_empty)
  len2 = length(output$RJMCMC$model1$n_empty)+length(output$RJMCMC$model2$n_empty)
  abline(v = len1,lwd = 2)
  abline(v = len2,lwd = 2)
  abline(v = length(output$RJMCMC$model1$n_empty)+length(output$RJMCMC$model2$n_empty) + 
           which(output$RJMCMC$model3$add==1), col = 2, lty = 3)
  abline(v = length(output$RJMCMC$model1$n_empty)+length(output$RJMCMC$model2$n_empty) + 
           which(output$RJMCMC$model3$delete==1), col = 3, lty = 2)
  if(save_output == T){
    dev.off() 
  }
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_llh_3.pdf")) 
  }
  llh_p = c(output$RJMCMC$model1$llh,
            output$RJMCMC$model2$llh,
            output$RJMCMC$model3$llh)
  plot(llh_p,type = "l", main = "model_all: llh", ylab = "log likelihood")
  abline(v = len1,lwd = 2)
  abline(v = len2,lwd = 2)
  abline(v = length(output$RJMCMC$model1$n_empty)+length(output$RJMCMC$model2$n_empty) + 
           which(output$RJMCMC$model3$add==1), col = 2, lty = 3)
  abline(v = length(output$RJMCMC$model1$n_empty)+length(output$RJMCMC$model2$n_empty) + 
           which(output$RJMCMC$model3$delete==1), col = 3, lty = 2)
  if(save_output == T){
    dev.off() 
  }
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  if(save_output == T){
    pdf(paste0(folder,"/",model_name,"_aic.pdf")) 
  }
  n_pars = c(output$RJMCMC$model1$postCl_df + output$RJMCMC$model1$postCl_df_A,
             output$RJMCMC$model2$postCl_df + output$RJMCMC$model2$postCl_df_A,
             output$RJMCMC$model3$postCl_df + output$RJMCMC$model3$postCl_df_A)
  aic = 2*(n_pars - llh_p)
  plot(aic, type = "l", main = "model_all: aic", ylab = "aic")
  abline(v = len1,lwd = 2)
  abline(v = len2,lwd = 2)
  if(save_output == T){
    dev.off() 
  }
  readline(prompt = "Pause. Press <Enter> to continue...")
  plot(output$RJMCMC$model3$postCl_df, type ="l", main = "model3: n.clusters")
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  plot(output$RJMCMC$model3$postCl_df_A, type ="l", main = "model3: n.clusters_A")
  
  readline(prompt = "Pause. Press <Enter> to continue to prior density plots...")
  
  priors_cl_df = c(sapply(1:length(output$RJMCMC$model1$postd), 
                          function(a) prior_cl_df(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                   sapply(1:length(output$RJMCMC$model2$postd), 
                          function(a) prior_cl_df(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                   sapply(1:length(output$RJMCMC$model3$postd), 
                          function(a) prior_cl_df(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_cl_df, type = "l", main = "n_cluster density")
  abline(v = c(len1,len2))
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  priors_cl_dfA = c(sapply(1:length(output$RJMCMC$model1$postd), 
                           function(a) prior_cl_df_A(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                    sapply(1:length(output$RJMCMC$model2$postd), 
                           function(a) prior_cl_df_A(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                    sapply(1:length(output$RJMCMC$model3$postd), 
                           function(a) prior_cl_df_A(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_cl_dfA, type = "l", main = "n_strength cluster density")
  abline(v = c(len1,len2))
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  priors_cl_means = c(sapply(1:length(output$RJMCMC$model1$postd), 
                             function(a) prior_cl_means(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                      sapply(1:length(output$RJMCMC$model2$postd), 
                             function(a) prior_cl_means(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                      sapply(1:length(output$RJMCMC$model3$postd), 
                             function(a) prior_cl_means(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_cl_means, type = "l", main = "intrans level density")
  abline(v = c(len1,len2))
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  priors_cl_meansA = c(sapply(1:length(output$RJMCMC$model1$postd), 
                              function(a) prior_cl_means_A(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                       sapply(1:length(output$RJMCMC$model2$postd), 
                              function(a) prior_cl_means_A(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                       sapply(1:length(output$RJMCMC$model3$postd), 
                              function(a) prior_cl_means_A(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_cl_meansA, type = "l", main = "strength level density")
  abline(v = c(len1,len2))
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  priors_dma = c(sapply(1:length(output$RJMCMC$model1$postd), 
                        function(a) prior_DMA(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                 sapply(1:length(output$RJMCMC$model2$postd), 
                        function(a) prior_DMA(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                 sapply(1:length(output$RJMCMC$model3$postd), 
                        function(a) prior_DMA(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_dma, type = "l", main = "dma denstiy")
  abline(v = c(len1,len2))
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  priors_dma_A = c(sapply(1:length(output$RJMCMC$model1$postd), 
                          function(a) prior_DMA_A(model_instance_s_A(model = output$RJMCMC$model1, s = a))),
                   sapply(1:length(output$RJMCMC$model2$postd), 
                          function(a) prior_DMA_A(model_instance_s_A(model = output$RJMCMC$model2, s = a))),
                   sapply(1:length(output$RJMCMC$model3$postd), 
                          function(a) prior_DMA_A(model_instance_s_A(model = output$RJMCMC$model3, s = a))))
  plot(priors_dma_A, type = "l", main = "dma_A density")
  abline(v = c(len1,len2))
  
  
  readline(prompt = "Pause. Press <Enter> to continue...")
  plot(density(output$RJMCMC$model3$postd), main = "compare postd")
  abline(v = max(output$RJMCMC$model3$postd),lty = 2)
  lines(density(output$RJMCMC$model2$postd),col = 2)
  abline(v = max(output$RJMCMC$model2$postd),lty = 2, col=2)
  lines(density(output$RJMCMC$model1$postd),col = 3)
  abline(v = max(output$RJMCMC$model1$postd),lty = 3, col=3)
  
  
  # return(llh_trace)
  
}


