individual_pffr_plt = function(model,
                               data,
                               id,
                               where_to_save
                               ){

  # Let's check few things before we get to plotting

  # First, let's check if the model is indeed pffr() model
  if (!inherits(model, "pffr")) {
    stop("`model` must be a fitted object from `refund::pffr()`.")
  }

  # Next, let's check if the given id is in the column of data
  if (!id_col %in% names(data)) {
    stop(sprintf("Column '%s' not found in `data`.", id_col))
  }

  # Now, let's extract domain index and actual response variable
  yind = model$pffr$yind
  response_name = all.vars(stats::formula(model))[1]
  y_actual = as.matrix(data[[res_name]])

  # Getting predicted values.




  # Let's make sure that the "where_to_save" path exist, and if it doesn't create one
  if(!dir.exists(where_to_save)){
    dir.create(where_to_save, recursive = TRUE) # Let's put recursive
  }

  # Let's make the data frame that we are going to use to plot



  # Getting name of dependent variable
  res_name = all.vars(formula(model))[1]
  y_actual = as.matrix(data[[res_name]])
  y_pred = stats::fitted(model)
}
