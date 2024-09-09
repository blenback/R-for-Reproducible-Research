source("renv/activate.R")

setHook("rstudio.sessionInit", function(newSession) {
  if (newSession)
    rstudioapi::navigateToFile('RiceFarm_master.R', line = -1L, column = -1L)
}, action = "append")
