#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $file = 'source/git2/bindings.d';
# How many replacements are made
my $cnt = 0;

# my @special_heads = (
# 	qr/alias git_indexer_progress_cb/,
# 	qr/alias git_submodule_cb/,
# );
# my @special_lines = (
# 	"module git2.bindings_extra;",
# 	"",
# 	"extern(C):",
# 	"",
# );

sub skip_line {
	my ($line) = @_;
	# return $line ~~ @special_heads || $line =~ /[^)];\Z/;
	return $line =~ /[^)];\Z/;
}

# Read the contents of the file
open my $fh, '<', $file or die "Cannot open file: $!";
my @lines = <$fh>;
close $fh;

# Remove the first ~800 lines of unnecessary bindings
# WARNING: if `git_libgit2_version` is no longer the first needed
# function, change $end_element accordingly!
my $start_element = 'nothrow';
my $end_element = 'git_libgit2_version';

# Find the indices of the start and end elements
my $start_index = -1;
my $end_index = -1;
for (my $i = 0; $i < scalar @lines; $i++) {
    if ($lines[$i] =~ $start_element) {
        $start_index = $i;
    }
    if ($lines[$i] =~ $end_element) {
		# Leave an empty line so it looks better
        $end_index = $i - 1;
        last;
    }
}

# Remove elements between the start and end indices
if ($start_index >= 0 && $end_index >= 0 && $start_index < $end_index) {
    my $num_elements_to_remove = $end_index - $start_index - 1;
    splice(@lines, $start_index + 1, $num_elements_to_remove);
} else {
	die "Start ($start_index) and end ($end_index) indices don't seem to be at the right place!";
}

# First replacement, git_X (git_object, git_remote, git_repository, etc.)
my @replacements = (
	'git_repository',
	'git_remote',
	'git_object',
	'git_submodule',
);
foreach my $target (@replacements) {
	my @patterns = (
		[qr/(?<!^)(?<!scope )(?<!out )$target\* /, "scope $target* "],
		[qr/(?<!^)(?<!scope )(?<!out )const\($target\)\* /, "scope const($target)* "],
		[qr/(?<!^)(?<!scope )(?<!out )$target\*\* /, "scope out $target* "],
	);

	foreach my $line (@lines) {
		if (!skip_line($line)) {
			foreach my $ptrn (@patterns) {
        		my ($pattern, $replace) = @{$ptrn};
        		$cnt += $line =~ s/$pattern/$replace/g;
    		}
		}
	}
}

# Second replacement, basic types (int*, uint*)
my @basic_replacements = ('uint', 'int');
foreach my $target (@basic_replacements) {
	my $pattern = qr/(?<!^)(?<!out )$target\* /;
	my $replace = "out $target ";
	foreach my $line (@lines) {
		if (!skip_line($line)) {
			$cnt += $line =~ s/$pattern/$replace/g;
		}
	}
}

# Third replacement, git_X_options
my @opts_replacements = (
	qr/(?<!ref )(git_[^ ]+)_options\* /,
	qr/(?<!ref )const\((git_[^ ]+)_options\)\* /,
);
foreach my $line (@lines) {
	if ($line ~~ @opts_replacements && !skip_line($line)) {
		my $target = "${1}_options";
		my $skip_function = "${1}_init_options";

		if ($line =~ qr/$skip_function/) {
			$cnt += $line =~ s/(?<!scope )$target\* /scope $target* /g;
			$cnt += $line =~ s/(?<!scope )const\($target\)\* /scope const($target)* /g;
		} else {
			$cnt += $line =~ s/(?<!ref )$target\* /scope ref $target /g;
			$cnt += $line =~ s/(?<!ref )const\($target\)\* /scope const ref $target /g;
		}
	}
}

# Fourth replacement, where pointers can be replaced with refs
my @ref_replacements = (
	'git_strarray',
	'git_indexer_progress',
);
foreach my $target (@ref_replacements) {
	my @patterns = (
		[qr/(?<!^)(?<!scope )$target\* (?>=out_)/, "scope out $target "],
		[qr/(?<!^)(?<!out )$target\* /, "scope ref $target "],
		[qr/(?<!^)(?<!out )const\($target\)\* /, "scope const ref $target "],
	);

	foreach my $line (@lines) {
		if (!skip_line($line)) {
			foreach my $ptrn (@patterns) {
        		my ($pattern, $replace) = @{$ptrn};
        		$cnt += $line =~ s/$pattern/$replace/g;
    		}
		}
	}
}

# my $extern_c_index = -1;
# for (my $i = 0; $i < scalar @lines; $i++) {
# 	if ($lines[$i] =~ quotemeta("extern (C)")) {
# 		$extern_c_index = $i;
# 		last;
# 	}
# }
# die "Can't find extern(C)!" if $extern_c_index == -1;

# Write the modified content back to the file
open $fh, '>', $file or die "Cannot open file: $!";
print $fh @lines;
close $fh;

say "Safeify completed, $cnt edits were made!";
