Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:50783 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273Ab2LJK7f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Dec 2012 05:59:35 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Makefile race between jobs
Date: Mon, 10 Dec 2012 10:59:27 +0000
References: <264C179F799EF24AB26D5319053335E80CC3049A10@ezexch.ezchip.com> <50C5B9D9.1080208@suse.cz> <50C5BB4A.9000403@synopsys.com>
In-Reply-To: <50C5BB4A.9000403@synopsys.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201212101059.28161.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Michal Marek <mmarek@suse.cz>, Noam Camus <noamc@ezchip.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org

On Monday 10 December 2012, Vineet Gupta wrote:
> 
> On Monday 10 December 2012 04:00 PM, Michal Marek wrote:
> > On 10.12.2012 11:11, Vineet Gupta wrote:
> >> ARC Port caches current task pointer in a register - thus we have a
> >> global asm register definition in current.h
> >> In the past, a customer ran into issue when porting some "really
> >> portable" code to kernel - such that asm/current.h didn't make it into
> >> the build of their module - via normal header includes - strange but
> >> true. Thus forcing current.h via way of -include seemed like a
> >> safe/sensible way.
> > 
> > To me that sounds like either an arc header is using the define but
> > lacking an include of asm/current.h, or the code is lacking asm/current.h.
> > 
> 
> It was latter - customer code was lacking include of asm/current.h
> At any rate, independent of above, since we are dealing with a global
> reg definition, IMHO, forcing the -include for each file built ensures
> the generated code correctness (gcc reg allocator not fiddling with that
> reg) - w/o "assuming" it would.

I'm not convinced that adding the -include to the kernel Makefile
actually helps here: If a third party module is built outside of
the kernel sources, it probably also does not use the kernel Makefile,
and it may not have access to the kernel header files at all.

That aside, can't you just have an arch specific header file that
reservers the register but does not rely on asm-generic/types.h?
That would eliminate the need to serialize the build process.

	Arnd
