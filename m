Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55091 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752962Ab3L3CW3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Dec 2013 21:22:29 -0500
Message-ID: <52C0D8E2.7050101@infradead.org>
Date: Sun, 29 Dec 2013 18:22:26 -0800
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: KCONFIG_ALLCONFIG + allmodconfig = brokenness
References: <52C0CD3F.7080808@zytor.com>
In-Reply-To: <52C0CD3F.7080808@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 12/29/13 17:32, H. Peter Anvin wrote:
> When KCONFIG_ALLCONFIG is used with "make allmodconfig", the result ends
> up being largely the same as "make allyesconfig", because the resulting
> kernel ends up with CONFIG_MODULES=n:
> 
> How to reproduce:
> 
> : tazenda 125 ; make O=../o.test allmodconfig
>   GEN     /home/hpa/kernel/o.test/Makefile
> scripts/kconfig/conf --allmodconfig Kconfig
> #
> # configuration written to .config
> #
> : tazenda 126 ; grep CONFIG_MODULES ../o.test/.config
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_MODULES=y
> : tazenda 127 ; env KCONFIG_ALLCONFIG=/dev/null make O=../o.test
> allmodconfig
>   GEN     /home/hpa/kernel/o.test/Makefile
> scripts/kconfig/conf --allmodconfig Kconfig
> #
> # configuration written to .config
> #
> : tazenda 128 ; grep CONFIG_MODULES ../o.test/.config
> CONFIG_MODULES_USE_ELF_RELA=y
> # CONFIG_MODULES is not set
> --

Yes, I discovered this a few weeks ago.
I just ended up adding
CONFIG_MODULES=y
to my KCONFIG_ALLCONFIG file.

There was a comment in the git commit for it about this (that I discovered
during my "research" into it), but I can't find it just now.

I wasn't fond of the change either.


-- 
~Randy
