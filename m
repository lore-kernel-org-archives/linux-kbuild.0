Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:46096 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932185Ab3D2SlI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 14:41:08 -0400
Date: Mon, 29 Apr 2013 14:41:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <1367258419.30667.20.camel@gandalf.local.home>
Message-ID: <alpine.DEB.2.02.1304291435020.11353@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>     <20130427153833.GC3355@free.fr>     <alpine.DEB.2.02.1304271325240.12586@oneiric>     <20130427174226.GA25088@free.fr>     <alpine.DEB.2.02.1304271412250.27554@oneiric>     <20130428202854.GC4571@free.fr>
  <alpine.DEB.2.02.1304290645150.16211@oneiric>    <1367244700.28120.6.camel@fedora>    <alpine.DEB.2.02.1304291022320.9234@oneiric>   <1367246499.30667.9.camel@gandalf.local.home>   <alpine.DEB.2.02.1304291056410.13584@oneiric>  <1367248388.30667.13.camel@gandalf.local.home>
  <alpine.DEB.2.02.1304291121180.26536@oneiric> <1367258419.30667.20.camel@gandalf.local.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 29 Apr 2013, Steven Rostedt wrote:

> Can you add this patch and see if it fixes your issue. If so, can I
> add your "tested-by" to this patch?

   here's what i can verify.  if i start with stock linux 3.9 and copy
in a known good .config with ATH-related stuff, here's the situation
immediately after the copy:

$ grep CONFIG_ATH .config
CONFIG_ATH_COMMON=m
CONFIG_ATH_CARDS=m
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
# CONFIG_ATH9K_BTCOEX_SUPPORT is not set
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
# CONFIG_ATH9K_AHB is not set
# CONFIG_ATH9K_DEBUGFS is not set
CONFIG_ATH9K_RATE_CONTROL=y
# CONFIG_ATH9K_HTC is not set
# CONFIG_ATH6KL is not set
$

which is fine and represents a valid collection of settings for 3.9.
but here's where things go wrong in the original case:

$ make localmodconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
using config: '.config'
vboxnetadp config not found!!
vboxnetflt config not found!!
vboxdrv config not found!!
vboxpci config not found!!
#
# configuration written to .config
#
$ grep CONFIG_ATH .config
# CONFIG_ATH_CARDS is not set   <-- obviously wrong, all my ATH stuff is gone
$

  if i apply your patch and do this all over again, then i retain all
the ATH-related stuff after the "make localmodconfig":

$ grep CONFIG_ATH .config
CONFIG_ATH_COMMON=m
CONFIG_ATH_CARDS=m
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
# CONFIG_ATH9K_BTCOEX_SUPPORT is not set
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
# CONFIG_ATH9K_AHB is not set
# CONFIG_ATH9K_DEBUGFS is not set
CONFIG_ATH9K_RATE_CONTROL=y
# CONFIG_ATH9K_HTC is not set
# CONFIG_ATH6KL is not set
$

  so the patch appears to resolve at least that specific issue.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
