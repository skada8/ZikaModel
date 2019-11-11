## code to prepare `DATASET` dataset goes here

nn_links <- read.table(file.path("data-raw", "nn_links.txt"), check.names = FALSE, header = TRUE)

amplitudes_phases <- read.csv(file.path("data-raw", "amplitudes_phases.csv"))

usethis::use_data(nn_links)
usethis::use_data(amplitudes_phases)