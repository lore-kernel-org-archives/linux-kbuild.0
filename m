Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44612 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbeHRX4c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Aug 2018 19:56:32 -0400
Received: by mail-ed1-f66.google.com with SMTP id f23-v6so6323409edr.11
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Aug 2018 13:47:34 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC PATCH] scripts: add header bloat measuring script
Date: Sat, 18 Aug 2018 22:47:23 +0200
Message-Id: <20180818204723.11060-1-linux@rasmusvillemoes.dk>
In-Reply-To: 0180226075931.5vn4vdbfcsje2z56@gmail.com
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

With a little cooperation from fixdep, we can rather easily quantify the
header bloat phenomenon.

While computing CONFIG_ dependencies, fixdep opens all the headers used
by a given translation unit anyway, so it's rather cheap to have it
record the number and total size of those in the generated .o.cmd file.

Those lines can then be post-processed and summarized by the new
header-bloat-stat.pl script. For example, backporting this to v4.17 and
v4.18 releases shows that for a defconfig x86_64 kernel, the median
"bloat factor" (total size of translation unit)/(size of .c file)
increased from 237.7 to 239.8, and the average total translation unit
size grew by 2.5% while the average .c file only increased by
0.4%. While these numbers by themselves are not particularly alarming,
when accumulated over several releases, builds do get noticably slower -
back at v3.0, the median bloat factor was 177.8.

Having infrastrucure like this makes it easier to measure the effect
should anyone attempt something similar to the sched.h cleanup, or just
go over a subsystem trimming unused #includes from .c files (if the
script is passed one or more directories it only processes those).

On a positive note, maybe 4.19 will be a rare exception; as of
1f7a4c73a739, the median bloat factor is down to 236.0, the average .c
file has increased by 0.4% but the average total translation unit is
nevertheless 1.2% smaller, compared to v4.18.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
For some statistics, that also include build times, for releases v3.0
through v4.15, see https://wildmoose.dk/header-bloat/ . I'm not sure
that page will remain forever, so not including the url in the commit
log.

I can certainly understand if people feel this is of too little
utility to hook into fixdep like this. It's certainly possible to do
the same statistics with external tools that just parse the .o.cmd
files themselves.

 scripts/basic/fixdep.c       | 18 +++++++--
 scripts/header-bloat-stat.pl | 95 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 4 deletions(-)
 create mode 100755 scripts/header-bloat-stat.pl

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 850966f3d602..f1dec85cf9d9 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -248,7 +248,7 @@ static void parse_config_file(const char *p)
 	}
 }
 
-static void *read_file(const char *filename)
+static void *read_file(const char *filename, unsigned *size)
 {
 	struct stat st;
 	int fd;
@@ -276,6 +276,8 @@ static void *read_file(const char *filename)
 	}
 	buf[st.st_size] = '\0';
 	close(fd);
+	if (size)
+		*size += st.st_size;
 
 	return buf;
 }
@@ -300,6 +302,8 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 	int saw_any_target = 0;
 	int is_first_dep = 0;
 	void *buf;
+	unsigned nheaders = 0, c_size = 0, h_size = 0;
+	unsigned *sizevar;
 
 	while (1) {
 		/* Skip any "white space" */
@@ -321,6 +325,8 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 			/* The /next/ file is the first dependency */
 			is_first_dep = 1;
 		} else if (!is_ignored_file(m, p - m)) {
+			sizevar = NULL;
+
 			*p = '\0';
 
 			/*
@@ -343,13 +349,16 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 					printf("source_%s := %s\n\n",
 					       target, m);
 					printf("deps_%s := \\\n", target);
+					sizevar = &c_size;
 				}
 				is_first_dep = 0;
 			} else {
 				printf("  %s \\\n", m);
+				sizevar = &h_size;
+				nheaders++;
 			}
 
-			buf = read_file(m);
+			buf = read_file(m, sizevar);
 			parse_config_file(buf);
 			free(buf);
 		}
@@ -373,7 +382,8 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 		do_extra_deps();
 
 	printf("\n%s: $(deps_%s)\n\n", target, target);
-	printf("$(deps_%s):\n", target);
+	printf("$(deps_%s):\n\n", target);
+	printf("# header-stats: %u %u %u\n", nheaders, c_size, h_size);
 }
 
 int main(int argc, char *argv[])
@@ -394,7 +404,7 @@ int main(int argc, char *argv[])
 
 	printf("cmd_%s := %s\n\n", target, cmdline);
 
-	buf = read_file(depfile);
+	buf = read_file(depfile, NULL);
 	parse_dep_file(buf, target, insert_extra_deps);
 	free(buf);
 
diff --git a/scripts/header-bloat-stat.pl b/scripts/header-bloat-stat.pl
new file mode 100755
index 000000000000..528021907df1
--- /dev/null
+++ b/scripts/header-bloat-stat.pl
@@ -0,0 +1,95 @@
+#!/usr/bin/perl
+
+use strict;
+use warnings;
+
+use Getopt::Long;
+use File::Find;
+use Statistics::Descriptive;
+
+sub help {
+    printf "%s [-c] [-m] [-n <name>] [<dirs>]\n", $0;
+    printf "  -c  output a single line with data in columns\n";
+    printf "  -m  include min/max statistics\n";
+    printf "  -n  optional name (e.g. git revision) to use as first datum\n";
+    exit(0);
+}
+
+my $name;
+my $minmax = 0;
+my $column = 0;
+
+GetOptions("c|column" => \$column,
+	   "m|minmax" => \$minmax,
+	   "n|name=s" => \$name,
+	   "h|help"   => \&help)
+    or die "Bad option";
+
+my @stats =
+    (
+     ['mean',   sub {$_[0]->mean()}],
+     ['min',    sub {$_[0]->min()}],
+     ['q25',    sub {$_[0]->quantile(1)}],
+     ['median', sub {$_[0]->quantile(2)}],
+     ['q75',    sub {$_[0]->quantile(3)}],
+     ['max',    sub {$_[0]->max()}],
+    );
+
+my @scalars = ('hcount', 'csize', 'tsize', 'ratio');
+my %data;
+my @out;
+
+find({wanted => \&process_cmd_file, no_chdir => 1}, @ARGV ? @ARGV : '.');
+
+add_output('name', $name) if $name;
+add_output('#TUs', $data{ntu});
+for my $s (@scalars) {
+    my $vals = Statistics::Descriptive::Full->new();
+    $vals->add_data(@{$data{$s}});
+    $vals->sort_data();
+    for my $stat (@stats) {
+	next if $s eq 'ratio' && $stat->[0] eq 'mean';
+	next if $stat->[0] =~ m/^(min|max)$/ && !$minmax;
+	my $val = $stat->[1]->($vals);
+	add_output($s . "_" . $stat->[0], $val);
+    }
+}
+
+if ($column) {
+    print join("\t", map {$_->[1]} @out), "\n";
+} else {
+    printf "%s\t%s\n", @$_ for @out;
+}
+
+sub add_output {
+    push @out, [@_];
+}
+
+sub process_cmd_file {
+    # Remove leading ./ components
+    s|^(\./)*||;
+    # Stuff that includes userspace/host headers is not interesting.
+    if (m/^(scripts|tools)/) {
+	$File::Find::prune = 1;
+	return;
+    }
+    return unless m/\.o\.cmd$/;
+
+    open(my $fh, '<', $_)
+	or die "failed to open $_: $!";
+    while (<$fh>) {
+	chomp;
+	if (m/^source_/) {
+	    # Only process stuff built from .S or .c
+	    return unless m/\.[Sc]$/;
+	}
+	if (m/^# header-stats: ([0-9]+) ([0-9]+) ([0-9]+)/) {
+	    push @{$data{hcount}}, $1;
+	    push @{$data{csize}}, $2;
+	    push @{$data{tsize}}, $2 + $3;
+	    push @{$data{ratio}}, $2 ? ($2 + $3)/$2 : 1.0;
+	    $data{ntu}++;
+	}
+    }
+    close($fh);
+}
-- 
2.16.4
