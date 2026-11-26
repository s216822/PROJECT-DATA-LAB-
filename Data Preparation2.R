raw_data <- readRDS("raw_data.rds")
raw_data$large = "Large"
raw_data$medium = "Mid-Sized"
raw_data$micro = "Micro"
raw_data$small_and_micro = "Small and Micro"
raw_data$total = "Total"
raw_data$small = "Small"

make_slice <- function(df, size_col, v1, v2) {
  out <- df[, c("year", "name", size_col, v1, v2)]
  names(out) <- c("year", "region", "size", "salaries", "employees")
  out
}

result <- rbind(
  make_slice(raw_data, "large",           "val_386700", "val_386699"),
  make_slice(raw_data, "medium",          "val_386705", "val_386704"),
  make_slice(raw_data, "micro",           "val_386710", "val_386709"),
  make_slice(raw_data, "small_and_micro", "val_386715", "val_386714"),
  make_slice(raw_data, "total",           "val_386720", "val_386719"),
  make_slice(raw_data, "small",           "val_498848", "val_498847")
)

result$salaries <- result$salaries*1000

result$level <- ifelse(
  result$region == "POLAND", 0,
  ifelse(
    startsWith(result$region, "MACROREGION"), 1,
    ifelse(
      startsWith(result$region, "REGION"), 3,
      2
    )
  )
)

saveRDS(result, "source_data.rds")

