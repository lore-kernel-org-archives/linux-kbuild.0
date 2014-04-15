Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ud10.udmedia.de ([194.117.254.50]:45079 "EHLO
	mail.ud10.udmedia.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaDOLgG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 07:36:06 -0400
Date: Tue, 15 Apr 2014 13:36:02 +0200
From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: [GIT] kbuild/lto changes for 3.15-rc1
Message-ID: <20140415113602.GB283@x4>
References: <CA+55aFy8hWqBpF1TXOPvA2rRaZp=H2LTO3wd3AERspmcGZhAeQ@mail.gmail.com>
 <20140408204906.GA3616@cloud>
 <CA+55aFzhyvZRPjXy7PkUxQO_AMqLSTehh-GNRP+Dx3yKnv-eCA@mail.gmail.com>
 <20140409013557.GA32556@tassilo.jf.intel.com>
 <20140409060133.GA6766@gmail.com>
 <20140409081709.GA283@x4>
 <20140414103205.GA2846@gmail.com>
 <20140415010003.GA2765@jtriplet-mobl1>
 <20140415093622.GB27556@linux-mips.org>
 <20140415111916.GA9390@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140415111916.GA9390@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Josh Triplett <josh@joshtriplett.org>, Ingo Molnar <mingo@kernel.org>, Andi Kleen <ak@linux.intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Crispin <blogic@openwrt.org>

On 2014.04.15 at 13:19 +0200, Sam Ravnborg wrote:
> > 
> > And while the code size reduction is less for MIPS than what others have
> > reported for their platforms (I'm still investigating) is still is enough
> > that embedded developers would commit murder for.
> 
> I have experimented a little with a patch that links all of vmlinux in one step.
> I compared the text size of vmlinux without and with -ffunction-sections.
> 
> With a defconfig build on x86 (32 bit) I got following results:
> 
>                         size     difference
> singlelink          10266506
> function-sections    9487369         779137  7,5%
> 
> So this is a reduction of ~800 kb by enabling -ffunction-sections which
> allows the linker to throw away unused sections.
> 
> I have not boot tested the kernel so chances are that too much was thrown out by the linker.
> But this is an option that has much smaller cost to use than lto.
> And seems to benefit nicely in size.
> 
> I have not tried this wihtout my singlelink patch - but I assume similar results.

No, it wouldn't work, because you cannot mix -r and --gc-sections (or
gold's --icf (identical code folding)).

-- 
Markus
