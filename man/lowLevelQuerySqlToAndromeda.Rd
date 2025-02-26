% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Andromeda.R
\name{lowLevelQuerySqlToAndromeda}
\alias{lowLevelQuerySqlToAndromeda}
\title{Low level function for retrieving data to a local Andromeda object}
\usage{
lowLevelQuerySqlToAndromeda(
  connection,
  query,
  andromeda,
  andromedaTableName,
  datesAsString = FALSE,
  appendToTable = FALSE,
  snakeCaseToCamelCase = FALSE,
  integerAsNumeric = getOption("databaseConnectorIntegerAsNumeric", default = TRUE),
  integer64AsNumeric = getOption("databaseConnectorInteger64AsNumeric", default = TRUE)
)
}
\arguments{
\item{connection}{The connection to the database server created using either
\code{\link[=connect]{connect()}} or \code{\link[=dbConnect]{dbConnect()}}.}

\item{query}{The SQL statement to retrieve the data}

\item{andromeda}{An open Andromeda object, for example as created
using \code{\link[Andromeda:andromeda]{Andromeda::andromeda()}}.}

\item{andromedaTableName}{The name of the table in the local Andromeda object where the
results of the query will be stored.}

\item{datesAsString}{Should dates be imported as character vectors, our should they be
converted to R's date format?}

\item{appendToTable}{If FALSE, any existing table in the Andromeda with the same name will be
replaced with the new data. If TRUE, data will be appended to an existing
table, assuming it has the exact same structure.}

\item{snakeCaseToCamelCase}{If true, field names are assumed to use snake_case, and are converted to camelCase.}

\item{integerAsNumeric}{Logical: should 32-bit integers be converted to numeric (double) values? If FALSE
32-bit integers will be represented using R's native \code{Integer} class.}

\item{integer64AsNumeric}{Logical: should 64-bit integers be converted to numeric (double) values? If FALSE
64-bit integers will be represented using \code{bit64::integer64}.}
}
\value{
Invisibly returns the andromeda. The Andromeda object will have a table added with the query
results.
}
\description{
This is the equivalent of the \code{\link[=querySqlToAndromeda]{querySqlToAndromeda()}} function, except no error report is
written when an error occurs.
}
\details{
Retrieves data from the database server and stores it in a local Andromeda object This allows
very large data sets to be retrieved without running out of memory. Null values in the database are
converted to NA values in R. If a table with the same name already exists in the local Andromeda
object it is replaced.
}
