# Tests for individual_pffr_plt()

skip_if_not_installed("refund")
skip_if_not_installed("ggplot2")

# Setting up the data

# in this setting, we have individuals and also have one main effect: which is group (A or B)

set.seed(42)
t_grid <- seq(0, 1, length.out = 10)
sim_df <- data.frame(
  subject_id = factor(paste0("subj_", 1:4)),
  group = factor(c("A", "A", "B", "B"))
)
sim_df$Y <- matrix(rnorm(40), nrow = 4, ncol = 10)

fit <- suppressMessages(suppressWarnings(
  refund::pffr(
    Y ~ group + s(subject_id, bs = "re"),
    yind = t_grid,
    data = sim_df
  )
))
