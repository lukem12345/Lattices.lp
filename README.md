# Lattices.lp
Find models of lattices via Answer Set Programming (ASP).

## Answer Set Programming

To compute models of lattices, we use the ASP tooling offered by [Potassco](https://potassco.org/), colloquially refered to collectively as *clingo*.

## Representation

Lattices are represented as vertices $v$ with edges $e$ between them.

## Features

This library can:
- Decide if a given graph is a lattice
- Find the top and bottom elements of a lattice
- Find lattices that obey constraints you impose on a map from some original lattice
  - e.g. Find all lattices *b* that satisfy any map from lattice *a* that preserve the joins of *a*. 

## Origin

The original inspiration for Lattices.lp is the project I participated in at [Adjoint School 2023](https://adjointschool.com/2023.html) with:
- Mentor: Chris Heunen
- TA: Carmen Constantin and Nesta van der Schaaf
- Students: Ariadne Si Suo, Clémence Chanavat, Ariel Rosenfield, Luke Morris
