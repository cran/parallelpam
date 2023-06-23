/*
 *
 * Copyright (C) 2022 Juan Domingo (Juan.Domingo@uv.es)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <debugpar.h>

//' @importFrom memuse Sys.meminfo Sys.swapinfo

// This is the only place where this variable is declared. It is global for the full package and should only be changed by ParallelpamSetDebug
unsigned char DEB=NODEBUG;

//' ParallelpamSetDebug
//'
//' Sets debugging in parallelpam package to ON (with TRUE) or OFF (with FALSE) for both parts of it.\cr
//' On package load the default status is OFF.\cr
//' Setting debugging of any part to ON shows a message. Setting to OFF does not show anything (since debugging is OFF...)
//'
//' @param deb     boolean, TRUE to generate debug messages for the PAM algorithm and silhouette calculation and FALSE to turn them off. Default: true.
//' @param debjmat boolean, TRUE to generate debug messages for the jmatrix part inside this package and FALSE to turn them off. Default: false
//' @return        No return value, called for side effects (internal boolean flag changed)
//' @examples
//' ParallelpamSetDebug(TRUE,debjmat=TRUE)
//' ParallelpamSetDebug(TRUE,debjmat=FALSE)
//' @export
// [[Rcpp::export]]
void ParallelpamSetDebug(bool deb = true,bool debjmat = false)
{ 
 if (deb)
 {
  DEB |= DEBPP;
  Rcpp::Rcout << "Debugging for PAM algorithm set to ON.\n";
 }
 else
  DEB &= (~DEBPP);
  
 if (debjmat)
 {
  DEB |= DEBJM;
  Rcpp::Rcout << "Debugging for jmatrix inside parallelpam package set to ON.\n";
 }
 else
  DEB &= (~DEBJM);
}

