use v6.d;

my @input = 'input'.IO.lines;
my @grid;
for @input -> $a { @grid.push(grid_path($a)) }

my @intersection = (@grid[0].keys ∩ @grid[1].keys).keys;
say "Part One: " ~ @intersection.map({ .split("\t").map({.abs}).sum }).sort[0];
say "Part Two: " ~ @intersection.map({ @grid[0]{$_} + @grid[1]{$_} }).min;

sub grid_path($a) {
    my %grid;
    my ($x, $y) = (0, 0);
    my $step = 0;
    for $a.split(',') -> $b {
        $b ~~ m/([R | L | U | D])(\d+)/;
        my $direction = $0;
        my $distance = $1;
        my ($axis, $positive);

        given $direction {
            when m/R | L/ { $axis := $x }
            when m/U | D/ { $axis := $y }
        };
        given $direction {
            when m/R | U/ { $positive = 1 }
            when m/L | D/ { $positive = 0 }
        };

        for 1 .. $distance -> $c {
            $step++;
            $positive ?? $axis++ !! $axis--;
            my $key = "$x\t$y";
            %grid{$key} ||= $step;
        }
    };
    return %grid;
}

