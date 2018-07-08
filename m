Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:42251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932846AbeGHLwA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 07:52:00 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: powerpc: 32BIT vs. 64BIT (PPC32 vs. PPC64)
In-Reply-To: <3f906b03-98ff-c081-4e19-b490f0b35c51@infradead.org>
References: <3f906b03-98ff-c081-4e19-b490f0b35c51@infradead.org>
Date: Sun, 08 Jul 2018 21:51:58 +1000
Message-ID: <87sh4uj675.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org

Randy Dunlap <rdunlap@infradead.org> writes:
> Hi,
>
> Is there a good way (or a shortcut) to do something like:

The best I know of is:

> $ make ARCH=powerpc O=PPC32 [other_options] allmodconfig
>   to get a PPC32/32BIT allmodconfig

$ echo CONFIG_PPC64=n > allmod.config
$ KCONFIG_ALLCONFIG=1 make allmodconfig
$ grep PPC32 .config
CONFIG_PPC32=y

Which is still a bit clunky.


I looked at this a while back and the problem we have is that the 32-bit
kernel is not a single thing. There are multiple 32-bit platforms which
are mutually exclusive.

eg, from menuconfig:

 - 512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx
 - Freescale 85xx
 - Freescale 8xx
 - AMCC 40x
 - AMCC 44x, 46x or 47x
 - Freescale e200


So we could have a 32-bit allmodconfig, but we'd need to chose one of
the above, and we'd still only be testing some of the code.

Having said that you're the 2nd person to ask about this, so we should
clearly do something to make a 32-bit allmodconfig easier, even if it's
not perfect.

cheers
