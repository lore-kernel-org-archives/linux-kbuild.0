Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:29272 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757720Ab3D2Oll (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 10:41:41 -0400
Message-ID: <1367246499.30667.9.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 10:41:39 -0400
In-Reply-To: <alpine.DEB.2.02.1304291022320.9234@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	  <20130427153833.GC3355@free.fr>
	  <alpine.DEB.2.02.1304271325240.12586@oneiric>
	  <20130427174226.GA25088@free.fr>
	  <alpine.DEB.2.02.1304271412250.27554@oneiric>
	  <20130428202854.GC4571@free.fr>
	  <alpine.DEB.2.02.1304290645150.16211@oneiric>
	 <1367244700.28120.6.camel@fedora>
	 <alpine.DEB.2.02.1304291022320.9234@oneiric>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 10:28 -0400, Robert P. J. Day wrote:

> 
>   for what it's worth, it's "make oldconfig" that happily tosses away

OK, so then it's not a localmodconfig issue.

> the ATH9K-related stuff. with a fresh 3.9 kernel, i pulled over my
> .config file that works fine for 3.7, and here's the important stuff
> (atheros-related):
> 
> $ grep CONFIG_ATH .config
> CONFIG_ATH_COMMON=m
> # CONFIG_ATH_DEBUG is not set
> CONFIG_ATH5K=m
> # CONFIG_ATH5K_DEBUG is not set
> # CONFIG_ATH5K_TRACER is not set
> CONFIG_ATH5K_PCI=y
> CONFIG_ATH9K_HW=m
> CONFIG_ATH9K_COMMON=m
> CONFIG_ATH9K_BTCOEX_SUPPORT=y
> CONFIG_ATH9K=m
> CONFIG_ATH9K_PCI=y
> CONFIG_ATH9K_AHB=y
> CONFIG_ATH9K_DEBUGFS=y
> CONFIG_ATH9K_MAC_DEBUG=y
> CONFIG_ATH9K_RATE_CONTROL=y
> CONFIG_ATH9K_HTC=m
> CONFIG_ATH9K_HTC_DEBUGFS=y
> # CONFIG_ATH6KL is not set
> $
> 
>   if i then run:
> 
> $ yes '' | make oldconfig
> 
> here's the result of that command a second time:
> 
> $ grep CONFIG_ATH .config
> # CONFIG_ATH_CARDS is not set
> $
> 
>   all gone. and if i try a localmodconfig, it does in fact warn me
> about what's about to happen:
> 
> $ make localmodconfig
> using config: '.config'
> vboxnetadp config not found!!
> vboxnetflt config not found!!
> vboxdrv config not found!!
> vboxpci config not found!!
> WARNING: ATH9K_HW is required, but nothing in the
>   current config selects it.
> WARNING: ATH_COMMON is required, but nothing in the
>   current config selects it.
> WARNING: ATH9K_COMMON is required, but nothing in the
>   current config selects it.
> module ath9k did not have configs CONFIG_ATH9K
> module ath did not have configs CONFIG_ATH_COMMON
> module ath9k_hw did not have configs CONFIG_ATH9K_HW
> module ath9k_common did not have configs CONFIG_ATH9K_COMMON
> ... snip ...

I should probably have localmodconfig stop here and wait for user input,
as this is usually lost in the make oldconfig that runs later.

> 
>   so it sees the currently loaded modules:
> 
> ath9k                 110134  0
> ath9k_common           14053  1 ath9k
> ath9k_hw              405771  2 ath9k,ath9k_common
> ath                    23827  3 ath9k,ath9k_common,ath9k_hw
> 
> it just has no idea how to hang onto them, yes?
> 
>   at this point, i think this is one of those anomalous corner cases
> that has to be recognized and resolved manually. but i can reproduce
> all of this from scratch if you'd like to see it.

This looks like one of those things that happen when you use an older
config with a newer kernel. localmodconfig is really made for just
turning off what's not used, not for turning on things that were not
there before. This is because it wont know the right dependency to turn
on.

I don't consider this a bug, just something you need to be aware of.

I could add to localmodconfig to stop after the warnings and say
something like:

"The above warnings could be caused by running an older config with a
newer kernel. You may want to run the origin config against 'make
oldconfig' to select any new dependencies that might be required."

-- Steve


