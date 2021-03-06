% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{SRF_simulate}
\alias{SRF_simulate}
\alias{show_sensor_names}
\title{Simulation of hyperspectral data by spectral response function (SRF)}
\usage{
SRF_simulate(
  Rrs,
  select_sensor = "All",
  input_wv_as_column = FALSE,
  output_wavelength = "MED",
  save_as_csv = FALSE,
  save_csv_dir = ".",
  na.rm = TRUE,
  output_wv_as_column = TRUE,
  verbose = FALSE
)

show_sensor_names()
}
\arguments{
\item{Rrs}{A data.frame with colnames like "Wavelength and SampleNames" of which
the first column is wavelength vector (such as \code{400:900}).}

\item{select_sensor}{Character. Select sensors. Use \code{show_sensor_names()} to print
all supported sensors. Default as \code{All}}

\item{input_wv_as_column}{Logical. If \code{FALSE} (default), the input data.frame has
wavelength as its column names.}

\item{output_wavelength}{Character. \code{MED} (default) or \code{MAX}.
Define the center wavelength. \code{MED} means the center wavelength is 
middle position of half maximun of max peak. While \code{MAX} means the 
position at the maximun of SRF peak.}

\item{save_as_csv}{Logical. Choose to save the simulation results as single csv for each
sensor. Default with \code{FALSE}}

\item{save_csv_dir}{The directory used for saving ouput csv files. Default as current working
directory (\code{"."}).}

\item{na.rm}{Logical. Should NA values be removed? Default as \code{TRUE}}

\item{output_wv_as_column}{Logical. If \code{TRUE} (default), the output result is a dataframe
with wavelength as column names.}

\item{verbose}{Whether to print information to console. Default as \code{FALSE}.}
}
\value{
A \code{list} with names as all selected sensors from parameters \code{select_sensor}.
For each list, including five elements:
  \itemize{
    \item \strong{sensor} Sensor name
    \item \strong{srf} Spectral response function of the sensor
    \item \strong{cw_med} Center wavelength by method \code{MED}
    \item \strong{cw_max} Center wavelength by method \code{MAX}
    \item \strong{Rrs_simu} The simulation of Rrs by supported SRF
  }
}
\description{
Simulate hyperspectral Rrs to multispectral bands
  via sensors SRF (Spectral response function).
}
\examples{
library(FCMm)
nm <- seq(400, 900)
Rrs <- data.frame(nm=nm, Site1=exp(nm/1000)+runif(501))
# save simulations in the variable `result` 
result <- SRF_simulate(Rrs,select_sensor=c("OLCI","MODIS"))
# save simulations in the disk
result <- SRF_simulate(Rrs,select_sensor=c("OLCI","MODIS"),
  save_as_csv = TRUE, save_csv_dir = tempdir())

}
\seealso{
Other Utils: 
\code{\link{cal.metrics.vector}()},
\code{\link{cal.metrics}()},
\code{\link{level_to_variable}()},
\code{\link{trim_sd}()}
}
\concept{Utils}
