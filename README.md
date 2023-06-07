# cray_user_group_2022_lammps_data

This repository contains the raw performance data used in the CUG 2022 paper, "Studying Performance Portability of LAMMPS across Diverse GPU-based Platforms".

## Directory structure

At the top level of this repository are all the MD potentials examined. Within each potential is a directory named with an encoding of the Kokkos parameter set.
Inside this directory are all the LAMMPS log files, named with the convention ``log.{machine_name}.replicate.{nreps}.run.{iteration}``. Recall that each system
is replicated cubically to scale the system up and down. A file named ``log.crusher.replicate.3.run.2`` is the 2nd run of a job on crusher using the following
LAMMPS command in the input file to scale the number of atoms in the system up by a total factor of 27: ``replicate 3 3 3``.

## Reproducing calculations

To compute the million-atom-steps-per-second metric that is used in the paper, multiply the number of atoms by the reported timesteps/s, then divide by 1 million.
The following short shell script exerpt computes this for the Lennard-Jones benchmark, given a file name. Other benchmarks may present results in a slightly different format.

```
ts_per_sec=$(grep 'timesteps/s' ${filename} | awk '{print $4}')
natoms=$(grep 'Loop time' ${filename} | awk '{print $12}')
matom_steps_per_sec=$(python3 -c "print(float(${natoms}) * float(${ts_per_sec}) / 1000000.0)")
echo $matom_steps_per_sec
```
