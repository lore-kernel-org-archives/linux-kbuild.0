Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:61241 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbcGRMu0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 08:50:26 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: running "make dtbs" for test builds
Date: Mon, 18 Jul 2016 14:49:52 +0200
Message-ID: <1887216.FoLArqn3oq@wuerfel>
In-Reply-To: <20160718122947.GA29820@wfg-t540p.sh.intel.com>
References: <8924490.SntxSU2FOC@wuerfel> <20160718122947.GA29820@wfg-t540p.sh.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Monday, July 18, 2016 8:29:47 PM CEST Fengguang Wu wrote:
> >- setting CONFIG_OF_ALL_DTBS will catch all files, not just the
> >  ones that are built by default for the set of configurations you
> >  have. It's possible to simply override this on the command line,
> >  using "make CONFIG_OF_ALL_DTBS=y", it doesn't actually have to
> >  be part of the configuration. The result is independent of the
> >  actual configuration, so it should be enough to do this once
> >  per architecture and source revision.
> >
> >Is this something you can add?
> 
> Do you mean to simply change the main "make" command line to
> 
>         make ARCH=xxx CONFIG_OF_ALL_DTBS=y
> 
> Which looks safe even for ARCHs that do not support it.
> 
> The arch/.../Makefile that actually use it are:
> 
>         arch/arc/boot/dts/Makefile
>         arch/arm/boot/dts/Makefile
>         arch/arm64/boot/dts/Makefile
>         arch/h8300/boot/dts/Makefile
>         arch/metag/boot/dts/Makefile
>         arch/mips/boot/dts/Makefile
>         arch/xtensa/boot/dts/Makefile
> 

Sounds good, thanks!

	Arnd

