#!/usr/bin/env raku
use v6.d;

sub execute (Int $p1, Int $p2){
    my @inst = 'input'.IO.slurp.split(',');
    @inst[1] = $p1;
    @inst[2] = $p2;

    for @inst -> $op, $lhs, $rhs, $stor {
        given $op {
            when 1 { @inst[$stor] = @inst[$lhs] + @inst[$rhs] }
            when 2 { @inst[$stor] = @inst[$lhs] * @inst[$rhs] }
            when 99 { last }
            default { die "undefined op $op!" }
        }
    }
    return @inst[0];
}

# Part One
say "Part One: " ~ execute(12,2);

# Part Two
my @pair = ((0..99) X (0..99));
for @pair -> $a {
    my $noun = $a[0];
    my $verb = $a[1];
    my $result = execute($noun, $verb);
    if ($result == 19690720) {
        say "noun: $noun, verb: $verb";
        say "Part Two: " ~ 100 * $noun + $verb;
        last;
    }
}