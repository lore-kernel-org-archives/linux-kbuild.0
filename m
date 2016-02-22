Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:53341 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754408AbcBVMIW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 07:08:22 -0500
MIME-Version: 1.0
In-Reply-To: <20160222113625.GC19428@n2100.arm.linux.org.uk>
References: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
	<20160222113625.GC19428@n2100.arm.linux.org.uk>
Date: Mon, 22 Feb 2016 21:08:05 +0900
Message-ID: <CAK7LNAQEwm=2bHX+kTxFVJTh-sFX+3MBgwuEmmNM-XoyvdbWRA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ARM: decompressor: several cleanups
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Russell,


2016-02-22 20:36 GMT+09:00 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Mon, Feb 22, 2016 at 04:31:11PM +0900, Masahiro Yamada wrote:
>> Masahiro Yamada (6):
>>   ARM: decompressor: drop unneeded assignments to "targets"
>>   ARM: decompressor: drop more unneeded assignments to "targets"
>>   ARM: decompressor: use clean-files instead of extra-y to clean files
>>   ARM: decompressor: drop redundant FORCE in Makefile
>>   ARM: decompressor: merge piggy.*.S and simplify Makefile
>>   ARM: decompressor: rename suffix_y to compress-y
>
> Most of this looks fine to me, but I've a question about how thoroughly
> patch 5 has been tested: iow, do we get correct behaviour if only the
> compression method is changed?
>
> Thanks.


I did build-test, changing the configuration
CONFIG_KERNEL_GZIP -> CONFIG_KERNEL_LZMA -> CONFIG_KERNEL_XZ -> ...

I confirmed zImage was created from the expected piggy.

For run-test, it worked fine too.



-- 
Best Regards
Masahiro Yamada
