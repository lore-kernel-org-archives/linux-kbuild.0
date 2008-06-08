Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36315 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757071AbYFHKkl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 06:40:41 -0400
Date: Sun, 8 Jun 2008 12:41:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Speed up "make headers_*"
Message-ID: <20080608104122.GA10545@uranus.ravnborg.org>
References: <20080608094730.GA30098@uranus.ravnborg.org> <19f34abd0806080312j2b09179cpa384a0460af5874e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f34abd0806080312j2b09179cpa384a0460af5874e@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Jan Engelhardt <jengelh@computergmbh.de>

On Sun, Jun 08, 2008 at 12:12:35PM +0200, Vegard Nossum wrote:
> On Sun, Jun 8, 2008 at 11:47 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > This is just a heads up patch if anyone is interested.
> > I finally took the time needed to optimize the
> > make headers_* targets.
> >
> > On my box it now takes less than 10 seconds to run
> > the full install + check cycle.
> > And it generates roughtly one screen full of output.
> >
> > Compare that to ~31 seconds and output filling up
> > my scroll back buffer.
> 
> Nice :-)
> 
> > Comments (especially to the perl scripts) are welcome.
> 
> Will do! Some of my comments are a bit on the pedantic side, so you
> choose yourself which ones you want to heed!

Thnaks!

headers_install.pl looks like this now.
I am not happy about the way I call unifdef - can it be
done better?
No error handling and I like to avid the extra tmp file.

	Sam

#!/usr/bin/perl
#
# headers_install prepare the listed header files for use in
# user space and copy the files to their destination.
#
# Usage: headers_install.pl odir installdir [files...]
# odir:    dir to open files
# install: dir to install the files
# files:   list of files to check
#
# Step in preparation for users space:
# 1) Drop all use of compiler.h definitions
# 2) Drop include of compiler.h
# 3) Drop all sections defined out by __KERNEL__

use strict;
use warnings;

my ($odir, $installdir, @files) = @ARGV;

my $ret = 0;

foreach my $file (@files) {
	open(my $infile, '<', "$odir/$file") or die "$odir/$file: $!\n";
	open(my $outfile, '>', "$installdir/$file.tmp") or
		die "$installdir/$file.tmp: $!\n";
	while (my $line = <$infile>) {
		$line =~ s/([\s(])__user\s/$1/g;
		$line =~ s/([\s(])__force\s/$1/g;
		$line =~ s/([\s(])__iomem\s/$1/g;
		$line =~ s/\s__attribute_const__\s/ /g;
		$line =~ s/\s__attribute_const__$//g;
		$line =~ s/^#include <linux\/compiler.h>//;
		printf $outfile "%s", $line;
	}
	close($outfile);
	close($outfile);
	system "scripts/unifdef -U__KERNEL__ $installdir/$file.tmp > $installdir/$file"
}

exit $ret;

