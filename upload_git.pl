use strict;
use warnings;

my $commit_msg = join(" ", @ARGV) || "Update Yaeju's dotfiles";

system("git", "add", ".") == 0
    or die "git add failed: $!";

system("git", "commit", "-m", $commit_msg) == 0
    or die "git commit failed: $!";

print "Committed: $commit_msg\n";
