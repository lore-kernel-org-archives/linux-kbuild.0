Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:46591 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbeBTLLS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 06:11:18 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQVSVtXzWXjLRAQXynSvHHbiF1xYLhjLBwPfFOpnX_NRA@mail.gmail.com>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-4-arnd@arndb.de>
 <CAK7LNAQVSVtXzWXjLRAQXynSvHHbiF1xYLhjLBwPfFOpnX_NRA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Feb 2018 12:11:17 +0100
Message-ID: <CAK8P3a2WYKQPJ_y9O_HpgbwN9-b9isKkYJH4niLA02MD2uH+2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kconfig: add a default allrandom.config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 20, 2018 at 10:16 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> Building randconfig kernels frequently leads to build errors from
>> drivers that have additional build dependencies, or that we don't
>> want to build for compile-testing for some other reason.
>
> Can you fix the former case?

I'm sure it can be done with runtime detection of the tools, not sure if that's
a good idea. What we would need here is

CONFIG_WANXL_BUILD_FIRMWARE: needs to check for as68k and ld68k
CONFIG_AIC79XX_BUILD_FIRMWARE: needs flex, bison and berkeley db.
        I have all those but it still failed to build for me.
STANDALONE now (after the removal of sound/oss) only controls
      ACPI_CUSTOM_DSDT_FILE, we could remove STANDALONE now
      I think, it doesn't actually get in the way of anything. For the stable
      kernels, I'd still need to deal with CONFIG_STANDALONE for the oss
      drivers.

My feeling right now is that we're better off making both STANDALONE
and PREVENT_FIRMWARE_BUILD depend on !COMPILE_TEST,
and then find a way to force that.

>> We already have a couple of compile-time options that can deal with this
>> problem, but the complete set is not documented well.  We also have a
>> method to override some options during 'make randconfig' and a couple
>> of other make targets. However, we don't yet combine those two.
>
>
> From this statement,
>
> kernel/configs/compile_test.config
>
> would make more sense?

My original thought was that the allrandom.config file name is already
documented and I just wanted a more consistent behavior, not come
up with something new.

>> This adds a new allrandom.config file to turn on CONFIG_COMPILE_TEST,
>> CONFIG_STANDALONE and CONFIG_PREVENT_FIRMWARE_BUILD for all randconfig
>> builds. This in turn disables some other options that we already try
>> to avoid in 'allmodconfig' builds and that make no sense in a general
>> randconfig build.
>>
>> Building with 'make randconfig KCONFIG_ALLCONFIG=1' should now always
>
>
> Can you type 'make randconfig compile_test.config', instead?
>
> (Or 'make allmodconfig compile_test.config' for full-build test)
>
>
> The merge_config has a little bit different logic
> from KCONFIG_ALLCONFIG=1, but I guess it leads to the almost same result.

I suspect that one difference in a randconfig kernel is that all options that
depend on CONFIG_COMPILE_TEST have a 50% lower chance of getting
enabled that way, but eventually they will get enabled.

      Arnd
