Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:35529 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755612AbbFUBLJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Jun 2015 21:11:09 -0400
Received: by lbbwc1 with SMTP id wc1so90878004lbb.2
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2015 18:11:08 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 4/4] scripts: add stackdelta script
Date: Sun, 21 Jun 2015 03:10:46 +0200
Message-Id: <1434849046-19920-5-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

This adds a simple perl script for reading two files as produced by
the stackusage script and computing the changes in stack usage. For
example:

$ scripts/stackusage -o /tmp/old.su -- CC=gcc-4.7 -j8 fs/ext4/
$ scripts/stackusage -o /tmp/new.su -- CC=gcc-5.0 -j8 fs/ext4/
$ scripts/stackdelta /tmp/{old,new}.su | sort -k5,5g

shows that gcc 5.0 generally produces less stack-hungry code than gcc
4.7. Obviously, the script can also be used for measuring the effect
of commits, .config tweaks or whatnot.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/stackdelta | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 scripts/stackdelta

diff --git a/scripts/stackdelta b/scripts/stackdelta
new file mode 100755
index 000000000000..18417098a378
--- /dev/null
+++ b/scripts/stackdelta
@@ -0,0 +1,55 @@
+#!/usr/bin/perl
+
+# Read two files producesd by the stackusage script, and show the
+# delta between them.
+#
+# Currently, only shows changes for functions listed in both files. We
+# could add an option to show also functions which have vanished or
+# appeared (which would often be due to gcc making other inlining
+# decisions).
+#
+# Another possible option would be a minimum absolute value for the
+# delta.
+
+sub read_stack_usage_file {
+    my %su;
+    my $f = shift;
+    open(my $fh, '<', $f)
+	or die "cannot open $f: $!";
+    while (<$fh>) {
+	chomp;
+	my ($file, $func, $size, $type) = split;
+	# Old versions of gcc (at least 4.7) have an annoying quirk in
+	# that a (static) function whose name has been changed into
+	# for example ext4_find_unwritten_pgoff.isra.11 will show up
+	# in the .su file with a name of just "11". Since such a
+	# numeric suffix is likely to change across different
+	# commits/compilers/.configs or whatever else we're trying to
+	# tweak, we can't really track those functions, so we just
+	# silently skip them.
+	#
+	# Newer gcc (at least 5.0) report the full name, so again,
+	# since the suffix is likely to change, we strip it.
+	next if $func =~ m/^[0-9]+$/;
+	$func =~ s/\..*$//;
+	$su{"${file}\t${func}"} = {size => $size, type => $type};
+    }
+    close($fh);
+    return \%su;
+}
+
+@ARGV == 2
+    or die "usage: $0 <old> <new>";
+
+my $old = read_stack_usage_file($ARGV[0]);
+my $new = read_stack_usage_file($ARGV[1]);
+my @common = grep {exists $new->{$_}} keys %$old;
+print join(",", keys %old) . "\n";
+for (@common) {
+    my $x = $old->{$_}{size};
+    my $y = $new->{$_}{size};
+    my $delta = $y - $x;
+    if ($delta) {
+	printf "%s\t%d\t%d\t%+d\n", $_, $x, $y, $delta;
+    }
+}
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
