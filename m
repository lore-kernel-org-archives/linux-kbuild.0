Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:37617 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752470Ab0D1XRv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Apr 2010 19:17:51 -0400
Date: Wed, 28 Apr 2010 16:17:31 -0700
From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: [patch 1/1] markup_oops: fix perlcritic warnings
Message-ID: <20100428161731.054fbd19@nehalam>
In-Reply-To: <4BD7F4C8.4080107@suse.cz>
References: <201004272112.o3RLCrlB020200@imap1.linux-foundation.org>
	<4BD7F4C8.4080107@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, amwang@redhat.com, arjan@infradead.org

More complete patch, fixes all the warnings from perlcritic as
well as perl compiler with stictures enabled.

Compile tested, does some one have an actual oops output
to recheck it on?

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>


--- a/scripts/markup_oops.pl	2010-04-28 16:05:20.794776102 -0700
+++ b/scripts/markup_oops.pl	2010-04-28 16:15:24.894377031 -0700
@@ -1,5 +1,7 @@
 #!/usr/bin/perl
 
+use strict;
+
 use File::Basename;
 use Math::BigInt;
 
@@ -79,9 +81,9 @@ sub parse_x86_regs
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
 
@@ -94,17 +96,15 @@ sub process_x86_regs
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
@@ -116,7 +116,7 @@ sub process_x86_regs
 		$clobber = "";
 	}
 
-	foreach $reg (keys(%regs)) {
+	foreach my $reg (keys(%regs)) {
 		my $clobberprime = reg_name($clobber);
 		my $lastwordprime = reg_name($lastword);
 		my $val = $regs{$reg};
@@ -192,14 +192,15 @@ if ($module ne "") {
 		exit;
 	}
 	# ok so we found the module, now we need to calculate the vma offset
-	open(FILE, "objdump -dS $filename |") || die "Cannot start objdump";
-	while (<FILE>) {
+	open(my $obj, '-|', "objdump -dS $filename")
+	    || die "Cannot start objdump: $!";
+	while (<$obj>) {
 		if ($_ =~ /^([0-9a-f]+) \<$function\>\:/) {
 			my $fu = $1;
 			$vmaoffset = hex($target) - hex($fu) - hex($func_offset);
 		}
 	}
-	close(FILE);
+	close($obj);
 }
 
 my $counter = 0;
@@ -225,9 +226,11 @@ sub InRange {
 # first, parse the input into the lines array, but to keep size down,
 # we only do this for 4Kb around the sweet spot
 
-open(FILE, "objdump -dS --adjust-vma=$vmaoffset --start-address=$decodestart --stop-address=$decodestop $filename |") || die "Cannot start objdump";
+open(my $objdump, '-|',
+     "objdump -dS --adjust-vma=$vmaoffset --start-address=$decodestart --stop-address=$decodestop $filename")
+    or die "Cannot start objdump: $!";
 
-while (<FILE>) {
+while (<$objdump>) {
 	my $line = $_;
 	chomp($line);
 	if ($state == 0) {
@@ -252,7 +255,7 @@ while (<FILE>) {
 	}
 }
 
-close(FILE);
+close($objdump);
 
 if ($counter == 0) {
 	print "No matching code found \n";
