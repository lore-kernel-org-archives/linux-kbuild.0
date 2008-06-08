Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.182]:8772 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757620AbYFHLFY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 07:05:24 -0400
Received: by wa-out-1112.google.com with SMTP id j37so1414232waf.23
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Jun 2008 04:05:24 -0700 (PDT)
Date: Sun, 8 Jun 2008 19:01:51 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] Speed up "make headers_*"
Message-ID: <20080608110151.GB2487@hacking>
References: <20080608094730.GA30098@uranus.ravnborg.org> <19f34abd0806080312j2b09179cpa384a0460af5874e@mail.gmail.com> <20080608104122.GA10545@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080608104122.GA10545@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Jan Engelhardt <jengelh@computergmbh.de>

On Sun, Jun 08, 2008 at 12:41:22PM +0200, Sam Ravnborg wrote:
>On Sun, Jun 08, 2008 at 12:12:35PM +0200, Vegard Nossum wrote:
>> On Sun, Jun 8, 2008 at 11:47 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> > This is just a heads up patch if anyone is interested.
>> > I finally took the time needed to optimize the
>> > make headers_* targets.
>> >
>> > On my box it now takes less than 10 seconds to run
>> > the full install + check cycle.
>> > And it generates roughtly one screen full of output.
>> >
>> > Compare that to ~31 seconds and output filling up
>> > my scroll back buffer.
>> 
>> Nice :-)
>> 
>> > Comments (especially to the perl scripts) are welcome.
>> 
>> Will do! Some of my comments are a bit on the pedantic side, so you
>> choose yourself which ones you want to heed!
>
>Thnaks!
>
>headers_install.pl looks like this now.
>I am not happy about the way I call unifdef - can it be
>done better?
>No error handling and I like to avid the extra tmp file.


I think you can open a pipe in Perl, e.g. open FILE, "|scripts/unifdef";.


>
>	Sam
>
>#!/usr/bin/perl
>#
># headers_install prepare the listed header files for use in
># user space and copy the files to their destination.
>#
># Usage: headers_install.pl odir installdir [files...]
># odir:    dir to open files
># install: dir to install the files
># files:   list of files to check
>#
># Step in preparation for users space:
># 1) Drop all use of compiler.h definitions
># 2) Drop include of compiler.h
># 3) Drop all sections defined out by __KERNEL__
>
>use strict;
>use warnings;
>
>my ($odir, $installdir, @files) = @ARGV;
>
>my $ret = 0;


This is only used by last exit, thus can be removed.

>
>foreach my $file (@files) {
>	open(my $infile, '<', "$odir/$file") or die "$odir/$file: $!\n";
>	open(my $outfile, '>', "$installdir/$file.tmp") or
>		die "$installdir/$file.tmp: $!\n";
>	while (my $line = <$infile>) {
>		$line =~ s/([\s(])__user\s/$1/g;
>		$line =~ s/([\s(])__force\s/$1/g;
>		$line =~ s/([\s(])__iomem\s/$1/g;
>		$line =~ s/\s__attribute_const__\s/ /g;
>		$line =~ s/\s__attribute_const__$//g;
>		$line =~ s/^#include <linux\/compiler.h>//;
>		printf $outfile "%s", $line;
>	}
>	close($outfile);
>	close($outfile);


'close' doesn't need parenthesises neither.

>	system "scripts/unifdef -U__KERNEL__ $installdir/$file.tmp > $installdir/$file"


Will scripts/unifdef clean the tmp file? If not, you should do it, right?


>}
>
>exit $ret;
>


-- 
Hi, I'm a .signature virus, please copy/paste me to help me spread
all over the world.
