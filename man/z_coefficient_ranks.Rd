% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ZCoefficientFunctions.R
\name{z_coefficient_ranks}
\alias{z_coefficient_ranks}
\title{Ordered Z coefficient evaluation function}
\usage{
z_coefficient_ranks(m, col_groups = NULL, row_groups = NULL)
}
\arguments{
\item{m}{A matrix. It can be a contingency table with counts or a table with 
probabilities. It is expected that there are no negative entries in a 
matrix and that mariginal sums are positive for all columns and rows.}

\item{col_groups, row_groups}{A vector or factor giving the grouping, with one 
element per column (row) of \code{m}. Missing values will be treated as 
another group and a warning will be given. When a row (column) grouping is 
specified it is assumed that mariginal sums for each group is positive.}
}
\value{
A data frame containing an ordered list of Z coefficients. The 
  resulting data frame has three columns, specifying rows (or row groups, if 
  they are specified), columns (or column groups, it they are specified) and 
  Z coefficients. The data frame is sorted according to descending order of Z
  coefficients.
}
\description{
The function \code{z_coefficient_ranks} returns ordered Z coefficients 
calculated for each entry of a matrix \code{m}.
}
\details{
Z coefficient \code{Z[A_i,B_j]} for a matrix \code{m} is defined by the 
following formula: \deqn{Z(A_i,B_j)^2 = 1 - 
[P(B_j)*P(A_i|B_j)/P(A_i)*P(A_i^c|B_j)/P(A_i^c) + 
P(B_j^c)*P(A_i|B_j^c)/P(A_i)*P(A_i^c|B_j^c)/P(A_i^c)],} where \code{A_i} 
corresponds to the row \code{i} and \code{B_j} corresponds to the column 
\code{j}.

The function \code{z_coefficient_ranks} calculates the Z coefficient for each 
entry \code{m[i,i]} of a matrix \code{m} and returns an ordered list of Z 
coefficients.
}
\examples{
#load gene mutations in cancer dataset together with gene groups
data("cancer_mutations")
data("cancer_mutations_gene_groups")

#calculating ranked Z coefficients, also using gene groups
#head used to show only top 6 rows
head(z_coefficient_ranks(cancer_mutations))
head(z_coefficient_ranks(cancer_mutations, col_groups = cancer_mutations_gene_groups))
}
\seealso{
Other Z coefficient: \code{\link{z_coefficient_matrix}},
  \code{\link{z_coefficient}}
}
\concept{
Z,coefficient,association
}
