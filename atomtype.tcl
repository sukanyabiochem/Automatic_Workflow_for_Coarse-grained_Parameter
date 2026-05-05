set chain_length 254

set output_file "atom.itp"
set fh [open $output_file "w"]

puts $fh "\[ atoms \]"
puts $fh "; nr      type     resnr   residue      atom      cgnr    charge    mass"

set default_start_count 96
set alternate_count 62

set alternate_atom EO
set alternate_type SP1ar
set alternate_mass 44.054
set default_atom PO
set default_type C3
set default_mass 58.081

set charge 0.00 
set resname LIG 
for {set i 1} {$i < $chain_length} {incr i} {

if {$i < $default_start_count } {
puts $fh [format "%4d  %4s     1    %4s     %4s     %4d      %.2f     %.3f" \
                $i $alternate_type $resname $alternate_atom $i $charge $alternate_mass] 

} elseif {$i < $default_start_count + $alternate_count} {
             puts $fh [format "%4d  %4s     1    %4s     %4s     %4d      %.2f     %.3f " \
            $i $default_type $resname $default_atom $i $charge $default_mass]

} else {
puts $fh [format "%4d  %4s     1    %4s     %4s     %4d      %.2f     %.3f" \
            $i $alternate_type $resname $alternate_atom $i $charge $alternate_mass]
}
}
close $fh
exit
