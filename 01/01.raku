use v6.d;

# Part One
my $module_fuel = ('input'.IO.lines.map: -> $a { floor($a/3)-2 }).sum;
say "part one answer = $module_fuel";

# Part Two
$module_fuel = ( 'input'.IO.lines.map: -> $a { ( floor($a/3)-2, -> $b { floor($b/3)-2 } ...^ * <0 ).sum } ).sum;
say "part two answer = $module_fuel";
