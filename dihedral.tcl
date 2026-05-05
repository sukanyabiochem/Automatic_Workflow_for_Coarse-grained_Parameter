set chain_length 253
set dihedrals []
for {set i 1} {$i < $chain_length -2} {incr i} {
set j [expr {$i+1}]
set k [expr {$i+2}]
set l [expr {$i+3}]
lappend dihedrals [list $i $j $k $l]
}
set output_file "dihedral.itp"
set fh [open $output_file "w"]
puts $fh "\[ dihedrals \]"
puts $fh ";  ai    aj    ak    al   funct  dihedral   force_constant n"
set dihedral_values {
        {180.0000 1.9600 1}
        {0.0000 0.1800 2}
        {0.0000 0.3300 3}
        {0.0000 0.1200 4}
}
foreach dihedral $dihedrals {
set ai [lindex $dihedral 0]
set aj [lindex $dihedral 1]
set ak [lindex $dihedral 2]
set al [lindex $dihedral 3]
foreach values $dihedral_values {
set dihedral [lindex $values 0]
set force_constant [lindex $values 1]
set number [lindex $values 2]
puts $fh [format "%4d %4d %4d %4d    1   %.1f   %.1f     %1d" $ai $aj $ak $al $dihedral $force_constant $number]
}
}
close $fh

