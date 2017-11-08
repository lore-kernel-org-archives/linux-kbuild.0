Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752143AbdKHRXa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 12:23:30 -0500
MIME-Version: 1.0
In-Reply-To: <CAK8P3a17uK02gvY=iQhnGq7OooV4JzxLpAV5V5eES3bEutm6aA@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com> <CAK8P3a17uK02gvY=iQhnGq7OooV4JzxLpAV5V5eES3bEutm6aA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Nov 2017 11:23:08 -0600
Message-ID: <CAL_Jsq+3oZyz23MeocEZTvh8CbdHJuudcSbWnZbuuM=kLebQEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, DTML <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

On Sun, Nov 5, 2017 at 7:49 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Nov 5, 2017 at 6:30 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> If CONFIG_OF_ALL_DTBS is enabled, "make ARCH=arm64 dtbs" compiles each
>> DTB twice; one from arch/arm64/boot/dts/*/Makefile and the other from
>> the dtb-$(CONFIG_OF_ALL_DTBS) line in arch/arm64/boot/dts/Makefile.
>> It could be a race problem when building DTBS in parallel.
>>
>> Another minor issue is CONFIG_OF_ALL_DTBS covers only *.dts in vendor
>> sub-directories, so this broke when Broadcom added one more hierarchy
>> in arch/arm64/boot/dts/broadcom/<soc>/.
>>
>> One idea to fix the issues in a clean way is to move DTB handling
>> to Kbuild core scripts.  Makefile.dtbinst already recognizes dtb-y
>> natively, so it should not hurt to do so.
>>
>> Add $(dtb-y) to extra-y, and $(dtb-) as well if CONFIG_OF_ALL_DTBS is
>> enabled.  All clutter things in Makefiles go away.
>>
>> As a bonus clean-up, I also removed dts-dirs.  Just use subdir-y
>> directly to traverse sub-directories.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Nice, that's much better than the hack I had.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

I applied this, but it has a few conflicts with SPDX tags from Greg
and some board additions in arm-soc. Please take a look.

Rob
