Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:53420 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753838AbYFHH3s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 03:29:48 -0400
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id 72362800049
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Jun 2008 09:29:47 +0200 (CEST)
Date: Sun, 8 Jun 2008 09:30:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: perl help needed...
Message-ID: <20080608073030.GA13796@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

I'm trying to optimize "make headers_install" and need 
some perl help...

What I have today:
#!/usr/bin/perl
#
# headers_install prepare the listed header files for use in
# user space and copy the files to their destination.
#
# Usage: headers_install.pl opendir installdir [files...]
# opendir: dir to open files
# install: dir to install the files
# files..: list of files to check
#
# Step in preparation for users space:
# 1) Drop all use of compiler.h definitions
# 2) Drop include of compiler.h
# 3) Drop all sections defined out by __KERNEL__

my ($opendir, $installdir, @files) = @ARGV;

my $ret = 0;

foreach $file (@files) {
        open(INFILE, "< $opendir/$file") or die "$openddir/$file: $!\n";
        open(UNIFDEF, "| scripts/unifdef -U__KERNEL__ |");
        open(OUTFILE, "> $installdir/$file") or die "$installdir/$file: $!\n";
        while ($line = <INFILE>) {
                $line =~ s/([\s(])__user\s/\1/g;
                $line =~ s/([\s(])__force\s/\1/g;
                $line =~ s/([\s(])__iomem\s/\1/g;
                $line =~ s/\s__attribute_const__\s/ /g;
                $line =~ s/\s__attribute_const__$//g;
                $line =~ s/^#include <linux\/compiler.h>//;

# this part is broken:
                printf UNIFDEF $line;
                $newline = <UNIFDEF>;
                printf OUTFILE $newline;
# until here

        }
        close(OUTFILE);
        close(INFILE);
}

exit($ret);


But the bidirectional IO for unifdef does not work.
This is in several places documented to not work - so no
suprise here.

But my googling did not turn up the solution I needed.

What I need to do in the above is to pass the modified
lines through unifdef to remove the __KERNEL__ sections.
I would much rather have this done by the perl script itself
and this looks reasonably simple. But I have not tried that
path yet - wanted to get the simple stuff working first.

Can you improve the above script so it actually passes the
lines through unifdef and correct any other stupid
mistakes of mine I would appreciate it very much!

Note: I have moved the HDRSED functionality from the Makefile.headersinst
file to the perl script.

   Sam
