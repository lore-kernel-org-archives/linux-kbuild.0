Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:15060 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751445AbcGRM3x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 08:29:53 -0400
Date: Mon, 18 Jul 2016 20:29:47 +0800
From: Fengguang Wu <lkp@intel.com>
Subject: Re: running "make dtbs" for test builds
Message-ID: <20160718122947.GA29820@wfg-t540p.sh.intel.com>
References: <8924490.SntxSU2FOC@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8924490.SntxSU2FOC@wuerfel>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Arnd,

On Mon, Jul 18, 2016 at 02:01:17PM +0200, Arnd Bergmann wrote:
>Hi Fengguang,
>
>I've recently run into a number of cases in which I pulled a branch that
>was building fine with "make vmlinux", but that failed for "make dtbs",
>and I wonder if this is something that could be checked by the kbuild
>test robot so we catch it earlier.

Yes, sure.

>There are parts of this:
>
>- running "make" without a target will build the default image file
>  and also do the "dtbs" target on ARM and other architectures. I
>  don't know if this is what you do, or if you always build

My typical build command sequences are

        make oldnoconfig
        make prepare
        make headers_install
        make ARCH=xxx
        make install

So it looks good already. :)

>  "make vmlinux ; make modules", which doesn't include it.
>  The dtbs makefile target is available on arc, arm, arm64, h8300,
>  metag, mips, nios2, and xtensa but not the others, so if you
>  call it explicitly, that has to be in an architecture specific
>  way.

Got it.

>- setting CONFIG_OF_ALL_DTBS will catch all files, not just the
>  ones that are built by default for the set of configurations you
>  have. It's possible to simply override this on the command line,
>  using "make CONFIG_OF_ALL_DTBS=y", it doesn't actually have to
>  be part of the configuration. The result is independent of the
>  actual configuration, so it should be enough to do this once
>  per architecture and source revision.
>
>Is this something you can add?

Do you mean to simply change the main "make" command line to

        make ARCH=xxx CONFIG_OF_ALL_DTBS=y

Which looks safe even for ARCHs that do not support it.

The arch/.../Makefile that actually use it are:

        arch/arc/boot/dts/Makefile
        arch/arm/boot/dts/Makefile
        arch/arm64/boot/dts/Makefile
        arch/h8300/boot/dts/Makefile
        arch/metag/boot/dts/Makefile
        arch/mips/boot/dts/Makefile
        arch/xtensa/boot/dts/Makefile

Regards,
Fengguang
