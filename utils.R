# helper function to construct colour columns from coolors url string
parse_coolor_url <- function(data, urls_from = "source", colours_to = "col") {
  url <- rlang::ensym(urls_from)
  data |>
    dplyr::mutate(
      cols = rlang::eval_tidy(url) |>
        stringr::str_remove_all("^.*/") |>
        stringr::str_replace_all("-", "-#"),
      cols = paste0("#", cols)
      ) |>
    tidyr::separate(cols, into = paste0(colours_to, 1:5), sep="-")
}
