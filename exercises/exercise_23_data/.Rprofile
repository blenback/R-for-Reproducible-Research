source("renv/activate.R")

setHook("rstudio.sessionInit", function(newSession) {
  if (newSession)
    rstudioapi::navigateToFile('scripts/LULCC_CH_master.R', line = -1L, column = -1L)
}, action = "append")
