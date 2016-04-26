Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835AbcDZNHq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 09:07:46 -0400
Date: Tue, 26 Apr 2016 23:07:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
Message-ID: <20160426230743.26d00e67@canb.auug.org.au>
In-Reply-To: <571F4ECC.5020902@suse.cz>
References: <20160422153503.24aa389e@canb.auug.org.au>
	<571A56C4.7030907@infradead.org>
	<alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr>
	<571A6BCE.9040904@infradead.org>
	<alpine.LFD.2.20.1604221423300.27452@knanqh.ubzr>
	<alpine.LFD.2.20.1604221542270.27452@knanqh.ubzr>
	<571AABCF.4050609@infradead.org>
	<571F4ECC.5020902@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Michal,

On Tue, 26 Apr 2016 13:19:40 +0200 Michal Marek <mmarek@suse.cz> wrote:
>
> On 2016-04-23 00:55, Randy Dunlap wrote:
> > On 04/22/16 12:44, Nicolas Pitre wrote:  
> >> On Fri, 22 Apr 2016, Nicolas Pitre wrote:
> >>  
> >>> On Fri, 22 Apr 2016, Randy Dunlap wrote:
> >>>  
> >>>> Yes, this patch helps, but I think there is still a problem.
> >>>> I think that trim needs to be done after CONFIG_BUILD_DOCSRC and possibly
> >>>> after CONFIG_SAMPLES are built.  
> >>>
> >>> The later is already taken care of with commit dd92478a15.
> >>>  
> >>>> At least CONFIG_BUILD_DOCSRC seems to
> >>>> cause this error:
> >>>>
> >>>> Setup is 16508 bytes (padded to 16896 bytes).
> >>>> System is 6125 kB
> >>>> CRC 8aa70f94
> >>>> Kernel: arch/x86/boot/bzImage is ready  (#9)
> >>>> ERROR: "cn_del_callback" [Documentation/connector/cn_test.ko] undefined!
> >>>> ERROR: "cn_add_callback" [Documentation/connector/cn_test.ko] undefined!
> >>>> ERROR: "cn_netlink_send" [Documentation/connector/cn_test.ko] undefined!
> >>>> ../scripts/Makefile.modpost:91: recipe for target '__modpost' failed
> >>>> make[2]: *** [__modpost] Error 1  
> >>>
> >>> This one is indeed a problem.  
> >>
> >> Please try the following:  
> > 
> > Yes, this works.  Thanks.
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>  
> 
> Applied to kbuild.git#kbuild.

Unfortunately, that was the commit I had to revert from linux-next
today - see my email report.  It breaks what looks like correct
additions to the block tree.

-- 
Cheers,
Stephen Rothwell
