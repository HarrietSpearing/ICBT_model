library("BradleyTerry2")
library("dplyr")
library("ggplot2")
library("reshape2")
library("purrr")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

list.files("../RJMCMC alg/", full.names = TRUE) %>% map(source)
list.files("scripts/", full.names = TRUE) %>% map(source)


year = 2016 ## choose which year from 2010 - 2019
  
df_raw = read.csv(paste0("data/GL", year, ".TXT"), header = F)
df = format_baseball_data(df_raw)
n = length(unique(c(df[,'player1'], df[,'player2']))) # number of players

inference_data = main_A(df=df, n,
                        nsteps1 = 10, nsteps2 = 10, nSteps = 30,
                        rho = 1, s_m_step = 0.8, alloc_step = 0.5, rho_A = 1, alloc_step_A = 0.5,
                        sigma_s_m = 3, sigma_s_m_A = 2, tau_A = 0.5, tau = 1, i_v_st = 0.3,
                        alpha = 1.5, beta = 2, gamma = 1, lambda = 3, gamma_A = 1,lambda_A = 10, nu_A = 1
                        
)

## plot the RJMCMC data (log likelihood, log posterior, prior densities for each stage of the algorithm)
plot_output_A(inference_data)


rankings_plot(idata = inference_data, method = "pij", raw_data =df_raw)

pairwise_inference_plot(idata = inference_data, raw_data = df_raw)