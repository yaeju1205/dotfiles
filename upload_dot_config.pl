use strict;
use warnings;

print "Yaeju's Dotfile Upload";
print "\n\n";

my $upload_config_dir = ".config";
my $user_config_dir = $ENV{XDG_CONFIG_HOME} // "$ENV{HOME}/.config";

my @dotfiles = (
    "niri",
    "inir",
    "kitty",
);

mkdir($upload_config_dir)
    or die "Failed create directory: $!" unless -d $upload_config_dir;
print "Create .config directory\n";

sub copy_dir {
    my ($src, $dst) = @_;

    system("cp", "-r", $src, $dst) == 0
        or die "Failed copy directory '$src' -> '$dst'";
}

print "Config directories:\n";
for my $dir (@dotfiles) {
    print "$user_config_dir/$dir\n";
    copy_dir("$user_config_dir/$dir", $upload_config_dir);
}

print "Copy directories\n"
