Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:45422 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755037AbbLASQ7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2015 13:16:59 -0500
Date: Tue, 1 Dec 2015 18:16:43 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
Message-ID: <20151201181643.GZ8644@n2100.arm.linux.org.uk>
References: <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
 <20151125234711.GT8644@n2100.arm.linux.org.uk>
 <565C6714.802@suse.com>
 <20151130153208.GR8644@n2100.arm.linux.org.uk>
 <565C6DE9.2020302@suse.com>
 <565DC5A9.2010305@suse.cz>
 <20151201161944.GX8644@n2100.arm.linux.org.uk>
 <20151201114929.655433a2@gandalf.local.home>
 <20151201171014.GY8644@n2100.arm.linux.org.uk>
 <20151201122212.474afce5@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151201122212.474afce5@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>

On Tue, Dec 01, 2015 at 12:22:12PM -0500, Steven Rostedt wrote:
> On Tue, 1 Dec 2015 17:10:14 +0000
> Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> 
> > Another suggestion - maybe recordmcount, which fstat()s the file,
> > should check the st_nlink before modifying the file, and error out
> > with a helpful error message telling people not to use hardlinks,
> > which would stop nasty surprises (and make it a rule that this should
> > be implemented as a general principle for good build behaviour) - iow,
> 
> Actually I like this solution the best.
> 
> > something like this (untested):
> 
> Can you test it to see if it gives you the error, otherwise I need to
> set up a CCACHE_HARDLINK environment :-)

It does indeed:

  CC      init/do_mounts_initrd.o
file is hard linked: init/do_mounts_initrd.o
/home/rmk/git/linux-rmk/scripts/Makefile.build:258: recipe for target 'init/do_mounts_initrd.o' failed
make[2]: *** [init/do_mounts_initrd.o] Error 1

> I guess another solution is to do a copy instead of modifying in place
> if it detects the multiple hard link?

That would be the "transparent" solution.  If you think it's worth
persuing, I'll have a go at fixing recordmcount to do that.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
