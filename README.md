# Coarse-Grained (CG) Force Field for the PEO-PPO-PEO Pluronic in MARTINI 3 #
This repository contains tk/tcl script for the generation of MARTINI force-field for the triblock copolymers (Pluronic) with any PEO & PPO CG beads combination. 

## Requirements ##
  VMD (updated version)
  
## Usage ##
# Submit a each files and generate the atomtype, bond, andgle and dihedral parameter #
vmd -dispdev text -e *.tcl 
# Combine the files and generate the complete ITP file for GROMACS run ##
cat 
