individual_pffr_plt = function(model,
                               data,
                               id_col,
                               id,
                               include_re = TRUE,
                               where_to_save = NULL){

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
  y_actual = as.matrix(data[[response_name]])

  # Getting predicted values.
  # We can do two things here as i did in my code!
  # 1. predict ignoring the random effect of individual subject
  # 2. predict including the random effect of individual subject
  # By default, let's include random effect of individual
  if(include_re == TRUE){
    y_pred <- stats::predict(model, newdata = data, reformat = TRUE)
  }else{
    # We are getting the smooth label of given individual.(To have an exact expression to exclude in predict funtion)
    smooth_labels <- vapply(model$smooth, function(x) x$label, character(1))
    re_terms <- unname(grep(paste0("\\b", id_col, "\\b"), smooth_labels, value = TRUE))
    y_pred <- stats::predict(model, newdata = data, exclude = re_terms, reformat = TRUE)
  }

  # We are going to also get rid of predictions that the actual values do not exist
  y_pred[is.na(y_actual)] <- NA


############### Daata Preparation for plotting

n_obs = nrow(y_actual)
n_window = length(yind)

base_df = data.frame(
  id = rep(data[[id_col]], n_window),
  yind = rep(yind, each = n_obs),
  Actual = as.vector(y_actual),
  Predicted = as.vector(y_pred),
  stringsAsFactors = FALSE
)

# id is given when a user want specific individual!
    if (!is.null(id)) {
      # filtering base_df to have only id that user specified
      base_df <- base_df[base_df$id %in% id, , drop = FALSE]
    }

    base_df <- base_df[!is.na(base_df$Actual) | !is.na(base_df$Predicted), , drop = FALSE]







  # Let's make sure that the "where_to_save" path exist, and if it doesn't create one
  if(!dir.exists(where_to_save)){
    dir.create(where_to_save, recursive = TRUE) # Let's put recursive
  }

  # Let's make the data frame that we are going to use to plot

}
