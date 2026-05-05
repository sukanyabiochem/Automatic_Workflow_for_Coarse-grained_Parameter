set chain_length 253
set bonds [] 
for {set i 1} {$i < $chain_length} {incr i} {
set j [expr {$i + 1}]
lappend bonds [list $i $j]
}
puts "$bonds"
set output_file "bond.itp"
set fh [open $output_file "w"]

puts $fh "\[ bonds \]"
puts $fh ";  ai    aj   funct  length   force_constant"

set alternate_bond 0.3300 
set alternate_bond_force_constant 7000.0000


set default_bond 0.3600 
set default_bond_force_constant 4400.0000

set default_start_count 95
set alternate_count 62

set num_bonds [llength $bonds]


for {set i 0} {$i < $num_bonds} {incr i} {
set bond [lindex $bonds $i]
set ai [lindex $bond 0]
set aj [lindex $bond 1]

if {$i < $default_start_count } {
puts $fh [format "%4d %4d     1   %.2f   %.2f" \
                $ai $aj $alternate_bond $alternate_bond_force_constant]
} elseif {$i < $default_start_count + $alternate_count} {
puts $fh [format "%4d %4d    1   %.2f   %.2f" \
            $ai $aj $default_bond $default_bond_force_constant]	
 
} else {
puts $fh [format "%4d %4d    1   %.2f   %.2f" \
            $ai $aj $alternate_bond $alternate_bond_force_constant]
}
}
