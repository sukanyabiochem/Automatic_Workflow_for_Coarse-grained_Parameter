set chain_length 253
set angles []
for {set i 1} {$i < $chain_length - 1} {incr i} {
set j [expr {$i + 1}]
set k [expr {$i + 2}]
lappend angles [list $i $j $k]
}

set output_file "angle.itp"
set fh [open $output_file "w"]
puts $fh "\[ angles \]"
puts $fh ";  ai    aj    ak   funct  angle   force_constant"
set alternate_values {
    {130.0000 25.0000}
    {135.0000 50.0000}
}

set default_angle 116.0000
set default_angle_force_constant 20.0000

set double_print_start 94
set double_print_end 93

set num_angles [llength $angles]

for {set i 0} {$i < $num_angles} {incr i} {
set angle [lindex $angles $i]
set ai [lindex $angle 0]
set aj [lindex $angle 1]
set ak [lindex $angle 2]

if {$i < $double_print_start || $i >= $num_angles - $double_print_end} {

foreach alt_values $alternate_values {
set alt_angle [lindex $alt_values 0]
set alt_force_constant [lindex $alt_values 1]
puts $fh [format "%4d %4d %4d    1   %.1f   %.1f" \
                $ai $aj $ak $alt_angle $alt_force_constant]
}
} else {
puts $fh [format "%4d %4d %4d    1   %.1f   %.1f" \
            $ai $aj $ak $default_angle $default_angle_force_constant]
}
}

