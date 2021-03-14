# HPCMinimizer

A high performance arbitrary precision numerical multi-objective minimizer.

The optimizer makes use of the bounded L-BFGS algorithm to undertake a series of concurrent local optimisations. 
Other algorithms can be used, but for a set of random initial conditions these are unlikely to provide substantive benefits.

The concurrent local minimisations can be run accross multiple threads and HPC nodes using open MPI.

The objective function and search parameters are provided from a header file. 
The header file can be made manually or generated from a Mathematica notebook which contains the template.
The header file is then compiled with the source to produce a single minimisation executable, 
which outputs the minimisation results into a several CSV files.

The cost function can also be a numerical ODE, where an example of this is used in the mathematica template.
The optimisation can additionally be conducted over a series of stages, using different cost functions.
Using the minima from previous stages as the basis for searching for new minima.
