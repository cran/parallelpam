% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{FilterJMatByName}
\alias{FilterJMatByName}
\title{FilterJMatByName}
\usage{
FilterJMatByName(fname, Gn, filname, namesat = "rows")
}
\arguments{
\item{fname}{A string with the file name of the original table}

\item{Gn}{A list of R strings with the names of the rows or columns that must remain. All others will be filtered out}

\item{filname}{A string with the file name of the filtered table}

\item{namesat}{The string "rows" or "cols" indicating if the searched names are in the rows or in the columns of the original table. Default: "rows"}
}
\value{
No return value, called for side effects (creates a file)
}
\description{
Takes a jmatrix binary file containing a table with rows and columns and filters it by name, eliminating the rows or columns whose whose names are not in certain list
}
\details{
If the table has no list of names in the requested dimension (rows or colums), an error is rised.\cr
The row or column names whose names are not found obviosuly cannot remain, and the program rises a warning indicating for which row/column names this happens.\cr
The matrix contained in the filtered file will have the same nature (full or sparse) and the same data type as the original.\cr
This function can be used to filter either by row or by column name, with appropriate usage of parameter namesat
}
\examples{
Rf <- matrix(runif(48),nrow=6)
rownames(Rf) <- c("A","B","C","D","E","F")
colnames(Rf) <- c("a","b","c","d","e","f","g","h")
tmpfile1=paste0(tempdir(),"/Rfullfloat.bin")
tmpfile2=paste0(tempdir(),"/Rfullfloatrowfilt.bin")
tmpfile3=paste0(tempdir(),"/Rfullfloatrowcolfilt.bin")
tmpcsvfile1=paste0(tempdir(),"/Rfullfloat.csv")
tmpcsvfile3=paste0(tempdir(),"/Rfullfloatrowcolfilt.csv")
JWriteBin(Rf,tmpfile1,dtype="float",dmtype="full",comment="Full matrix of floats")
# Let's keep only rows A, C and E
FilterJMatByName(tmpfile1,c("A","C","E"),tmpfile2,namesat="rows")
# and from the result, let's keep only columns b, d and g
FilterJMatByName(tmpfile2,c("b","d","g"),tmpfile3,namesat="cols")
JMatToCsv(tmpfile1,tmpcsvfile1)
JMatToCsv(tmpfile3,tmpcsvfile3)
# You can now compare both ASCII/csv files
}
