Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sovereign.computergmbh.de ([85.214.69.204]:46447 "EHLO
	sovereign.computergmbh.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702AbYD3Oob (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2008 10:44:31 -0400
Date: Wed, 30 Apr 2008 16:44:30 +0200 (CEST)
From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
In-Reply-To: <20080429183531.GB19652@uranus.ravnborg.org>
Message-ID: <alpine.LNX.1.10.0804301643140.5623@fbirervta.pbzchgretzou.qr>
References: <20080429183531.GB19652@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>, Andres Salomon <dilinger@queued.net>


On Tuesday 2008-04-29 20:35, Sam Ravnborg wrote:
>
>I plan to drop the 'very chatty' mode as I
>do not see it usefull.
>So in essense 'make oldconfig' and 'make silentoldconfig'
>become equal.

Sounds good.


>The commands we have today for kconfig is:
>
># Command line variants
>make oldconfig
>make silentoldconfig
>make defconfig
>make XXX_defconfig
>
>(The other frontends are left out on purpose).
>The challenge here is to come up with a syntax that
>allows us to select between the three behaviours,
>while keeping backward compatibility.
>
>The best suggestion I have so far is to say that:
>a) if defconfig is specified then we use method 1)
>b) if oldconfig is specified then we use method 2)
>c) if newconfig is specified then we use method 3)

[Where is 1) defined?]

>And we add support for a new 'commandline' parameter
>'K' so I can say:
>
>make K=/proc/config.gz defconfig
>make K=i386_defconfig  defconfig
>make K=i386_defconfig  oldconfig
>make K=/proc/config.gz newconfig
>
>So K is used to specify what config file we use
>to start out from.

Oh that's real good, even better than cloneconfig.

># Enviroment variables affecting kconfig
>KCONFIG_ALLCONFIG
>KCONFIG_NOSILENTUPDATE
>KCONFIG_CONFIG
>KCONFIG_OVERWRITECONFIG
>KCONFIG_NOTIMESTAMP
>KCONFIG_AUTOCONFIG
>KCONFIG_AUTOHEADER

Ok and these are doing .. what?

>#input files (aparts from the mandatory ones)
>all.config
>allno.config
>allmod.config
>allyes.config
>allrandom.config

Used for..?
