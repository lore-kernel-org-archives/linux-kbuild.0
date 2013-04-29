Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:7878 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757253Ab3D2OLu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 10:11:50 -0400
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <srostedt@redhat.com>
In-Reply-To: <alpine.DEB.2.02.1304290645150.16211@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	 <20130427153833.GC3355@free.fr>
	 <alpine.DEB.2.02.1304271325240.12586@oneiric>
	 <20130427174226.GA25088@free.fr>
	 <alpine.DEB.2.02.1304271412250.27554@oneiric>
	 <20130428202854.GC4571@free.fr>
	 <alpine.DEB.2.02.1304290645150.16211@oneiric>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Apr 2013 10:11:40 -0400
Message-ID: <1367244700.28120.6.camel@fedora>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 06:54 -0400, Robert P. J. Day wrote:
> On Sun, 28 Apr 2013, Yann E. MORIN wrote:

>   note there is no module named "ath_cards", but my starting .config
> indeed contains an entry for that as a module:
> 
> $ grep CONFIG_ATH ../3.9.config
> CONFIG_ATH_COMMON=m
> CONFIG_ATH_CARDS=m                 <-- there

Ah, it was enabled when you ran localmodconfig?

> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_ATH9K_HW=m
> CONFIG_ATH9K_COMMON=m
> CONFIG_ATH9K_BTCOEX_SUPPORT=y
> CONFIG_ATH9K=m
> CONFIG_ATH9K_PCI=y
> # CONFIG_ATH9K_AHB is not set
> # CONFIG_ATH9K_DEBUGFS is not set
> CONFIG_ATH9K_RATE_CONTROL=y
> # CONFIG_ATH9K_HTC is not set
> # CONFIG_ATH6KL is not set
> $
> 
>   and that symbol is defined in drivers/net/wireless/ath/Kconfig as a
> "menuconfig":
> 
> config ATH_COMMON
>         tristate
> 
> menuconfig ATH_CARDS                            <-- there
>         tristate "Atheros Wireless Cards"
>         ... snip ...
> 
>   so i'm just going to *guess* that the config procedure, when faced
> with the line "CONFIG_ATH_CARDS=m", goes looking for a loaded module
> called "ath_cards" or "ath9k_cards", doesn't find it, and turns off
> that selection, consequently turning off *all* of my atheros
> functionality.
> 
>   the Kconfig file claims that:
> 
> "menuconfig ATH_CARDS
>         tristate "Atheros Wireless Cards"
>         depends on CFG80211 && (!UML || BROKEN)
>         ---help---
>           This will enable the support for the Atheros wireless drivers.
>           ath5k, ath9k, ath9k_htc and ar9170 drivers share some common code, this option
>           enables the common ath.ko module which shares common helpers.
>                              ^^^^^^
> 
>   but the corresponding Makefile has:
> 
> obj-$(CONFIG_ATH_COMMON)        += ath.o
> 
> where ath.o depends on ATH_COMMON, *not* ATH_CARDS.
> 
>   that just seems like a badly-written set of Kconfig structures and
> dependencies.

localmodconfig is set up to recognize options dependent on config menus.
I'll have to take a look. Can you send me your .config file you started
with, and what lsmod gives you. "lsmod > file". I'll see what broke.

Oh, and one last thing. It's best to email me at rostedt@goodmis.org, as
I don't always check my work email ;-)

Thanks,

-- Steve


