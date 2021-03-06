#' @export
#' @importFrom utils read.csv
#' @importFrom dplyr mutate_at arrange %>%
#' @importFrom tibble as_tibble
#' @importFrom lubridate as_date

getdata <- function(data) {

  # 01_patient ----------------------------------------------------------------
  if (data == "patient") {
    patient <-
      utils::read.csv(
        "https://github.com/jihoo-kim/Data-Science-for-COVID-19/raw/master/dataset/Patient/PatientInfo.csv",
        stringsAsFactors = F,
        na.strings = "",
        fileEncoding = "UTF-8"
      )

    # modify column type
    patient <- patient %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at(c("symptom_onset_date",
                         "confirmed_date",
                         "released_date",
                         "deceased_date"),
                       lubridate::as_date)

    return(patient)
  }


  # 02_route ----------------------------------------------------------------
  else if (data == "route") {
    route <-
      utils::read.csv (
        "https://github.com/jihoo-kim/Data-Science-for-COVID-19/raw/master/dataset/Patient/PatientRoute.csv",
        stringsAsFactors = F,
        na.strings = "",
        fileEncoding = "UTF-8"
      )

    # modify colum type
    route <- route %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at("date", lubridate::as_date) %>%
      dplyr::arrange(desc(date))

    return(route)
  }

  # 03_time --------------------------------------------------------------------
  else if (data == "time") {
    time <-
      utils::read.csv (
        "https://github.com/jihoo-kim/Data-Science-for-COVID-19/raw/master/dataset/Time/Time.csv",
        stringsAsFactors = F,
        na.strings = "",
        fileEncoding = "UTF-8"
        )

    # modify column type
    time <- time %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at("date", lubridate::as_date) %>%
      dplyr::arrange(desc(date))

    return(time)
  }
  stop(paste0("Object '", data, "' not found. Check dataset name."))
}
