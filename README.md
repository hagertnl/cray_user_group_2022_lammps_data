# cray_user_group_2022_lammps_data
This repository contains the raw performance data used in the CUG 2022 paper, "Studying Performance Portability of LAMMPS across Diverse GPU-based Platforms".

To compute the million-atom-steps-per-second metric that is used in the paper, multiply the number of atoms by the reported timesteps/s, then divide by 1 million.
The following short shell script exerpt computes this for the Lennard-Jones benchmark, given a file name. Other benchmarks may present results in a slightly different format.

```
ts_per_sec=$(grep 'timesteps/s' ${filename} | awk '{print $4}')
natoms=$(grep 'Loop time' ${filename} | awk '{print $12}')
matom_steps_per_sec=$(python3 -c "print(float(${natoms}) * float(${ts_per_sec}) / 1000000.0)")
echo $matom_steps_per_sec
```
