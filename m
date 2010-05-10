Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:50522 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755969Ab0EJSJM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 May 2010 14:09:12 -0400
Date: Mon, 10 May 2010 11:09:08 -0700
From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: [patch 1/1] markup_oops: fix perlcritic warnings
Message-ID: <20100510110908.74f1a474@nehalam>
In-Reply-To: <4BE2EC69.40009@suse.cz>
References: <201004272112.o3RLCrlB020200@imap1.linux-foundation.org>
	<4BD7F4C8.4080107@suse.cz>
	<20100428161731.054fbd19@nehalam>
	<4BE2EC69.40009@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, amwang@redhat.com, arjan@infradead.org

Cleanup of markup oops:
   * enable strict checking
   * fixes all the warnings from perlcritic
   * break some long lines.

Patch against kbuild for-next branch.
Compile tested, does some one have an actual oops output
to recheck it on?

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>


--- a/scripts/markup_oops.pl	2010-05-10 11:01:55.479688471 -0700
+++ b/scripts/markup_oops.pl	2010-05-10 11:07:08.951236561 -0700
@@ -1,5 +1,7 @@
 #!/usr/bin/perl
 
+use strict;
+
 use File::Basename;
 use Math::BigInt;
 use Getopt::Long;
@@ -17,7 +19,6 @@ use Getopt::Long;
 
 
 my $cross_compile = "";
-my $vmlinux_name = "";
 my $modulefile = "";
 
 # Get options
@@ -26,12 +27,13 @@ Getopt::Long::GetOptions(
 	'module|m=s'		=> \$modulefile,
 	'help|h'		=> \&usage,
 ) || usage ();
+
 my $vmlinux_name = $ARGV[0];
 if (!defined($vmlinux_name)) {
 	my $kerver = `uname -r`;
 	chomp($kerver);
 	$vmlinux_name = "/lib/modules/$kerver/build/vmlinux";
-	print "No vmlinux specified, assuming $vmlinux_name\n";
+	warn "No vmlinux specified, assuming $vmlinux_name\n";
 }
 my $filename = $vmlinux_name;
 
@@ -89,9 +91,9 @@ sub parse_x86_regs
 sub reg_name
 {
 	my ($reg) = @_;
-	$reg =~ s/r(.)x/e\1x/;
-	$reg =~ s/r(.)i/e\1i/;
-	$reg =~ s/r(.)p/e\1p/;
+	$reg =~ s/r(.)x/e$1x/;
+	$reg =~ s/r(.)i/e$1i/;
+	$reg =~ s/r(.)p/e$1p/;
 	return $reg;
 }
 
@@ -104,17 +106,15 @@ sub process_x86_regs
 	}
 
 	# find the arguments to the instruction
-	if ($line =~ /([0-9a-zA-Z\,\%\(\)\-\+]+)$/) {
-		$lastword = $1;
-	} else {
-		return "";
-	}
+	return "" unless ($line =~ /([0-9a-zA-Z\,\%\(\)\-\+]+)$/);
+
+	my $lastword = $1;
 
 	# we need to find the registers that get clobbered,
 	# since their value is no longer relevant for previous
 	# instructions in the stream.
 
-	$clobber = $lastword;
+	my $clobber = $lastword;
 	# first, remove all memory operands, they're read only
 	$clobber =~ s/\([a-z0-9\%\,]+\)//g;
 	# then, remove everything before the comma, thats the read part
@@ -126,7 +126,7 @@ sub process_x86_regs
 		$clobber = "";
 	}
 
-	foreach $reg (keys(%regs)) {
+	foreach my $reg (keys(%regs)) {
 		my $clobberprime = reg_name($clobber);
 		my $lastwordprime = reg_name($lastword);
 		my $val = $regs{$reg};
@@ -202,14 +202,16 @@ if ($module ne "") {
 		exit;
 	}
 	# ok so we found the module, now we need to calculate the vma offset
-	open(FILE, $cross_compile."objdump -dS $filename |") || die "Cannot start objdump";
-	while (<FILE>) {
-		if ($_ =~ /^([0-9a-f]+) \<$function\>\:/) {
-			my $fu = $1;
-			$vmaoffset = Math::BigInt->from_hex("0x$target") - Math::BigInt->from_hex("0x$fu") - Math::BigInt->from_hex("0x$func_offset");
-		}
+	open(my $obj, '-|', "objdump -dS $filename")
+	    or die "Cannot start objdump: $!";
+	while (<$obj>) {
+	    next unless ($_ =~ /^([0-9a-f]+) \<$function\>\:/);
+	    my $fu = $1;
+	    $vmaoffset = Math::BigInt->from_hex("0x$target")
+		- Math::BigInt->from_hex("0x$fu")
+		- Math::BigInt->from_hex("0x$func_offset");
 	}
-	close(FILE);
+	close($obj);
 }
 
 my $counter = 0;
@@ -234,10 +236,11 @@ sub InRange {
 
 # first, parse the input into the lines array, but to keep size down,
 # we only do this for 4Kb around the sweet spot
+open(my $objdump, '-|',
+     "objdump -dS --adjust-vma=$vmaoffset --start-address=$decodestart --stop-address=$decodestop $filename")
+    or die "Cannot start objdump: $!";
 
-open(FILE, $cross_compile."objdump -dS --adjust-vma=$vmaoffset --start-address=$decodestart --stop-address=$decodestop $filename |") || die "Cannot start objdump";
-
-while (<FILE>) {
+while (<$objdump>) {
 	my $line = $_;
 	chomp($line);
 	if ($state == 0) {
@@ -263,7 +266,7 @@ while (<FILE>) {
 	}
 }
 
-close(FILE);
+close($objdump);
 
 if ($counter == 0) {
 	print "No matching code found \n";
