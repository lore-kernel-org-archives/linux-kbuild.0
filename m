Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:56253 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759165AbaD3UxK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2014 16:53:10 -0400
MIME-Version: 1.0
In-Reply-To: <CAMo8Bf+6AZcSEqTvnkV2e0x85v9PViGdLy5m9YCDK0Z9GsO-Pg@mail.gmail.com>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	<1398743403.8217.7.camel@concordia>
	<CAOMZO5AuVyZ9Dqo2wUjeN2E0CZVjXoCgR5t8zje-37yPtr_tHA@mail.gmail.com>
	<CAMo8Bf+6AZcSEqTvnkV2e0x85v9PViGdLy5m9YCDK0Z9GsO-Pg@mail.gmail.com>
Date: Wed, 30 Apr 2014 22:53:09 +0200
Message-ID: <CAMuHMdU6DEnE+-b+V1DKub3F4ZENPwzvfqwg7LMToH3ULTHCHA@mail.gmail.com>
Subject: Re: kissb mkimage doesn't support extensa
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Apr 30, 2014 at 9:34 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Wed, Apr 30, 2014 at 10:31 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
>>>> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
>>>>
>>>> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
>>>> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
>>>> blackfin, avr32
>>>
>>> I've upgraded to the latest version in Debian (2014.01), but it still doesn't
>>> seem to support xtensa.
>>>
>>>   $ /usr/bin/mkimage -A xtensa
>>>
>>>   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
>>>   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
>>>   nds32, or1k, sandbox, arm64
>>
>> As mainline U-boot does not support xtensa currently, what about
>> dropping the uImage format to be built?
>
> There's xtensa port for U-boot at https://github.com/foss-xtensa/u-boot
> Also KISSKB didn't even try to build uImage for xtensa until recently.
> What's changed?

When comparing the build between 18a1a7a1 (good) and a7963eb7f4
(bad), it seems allnoconfig changes the build type from ISS to XT2000.
The latter builds boot-uboot, too, cfr. arch/xtensa/boot/Makefile.

So I guess it's due to this change to kconfig:

commit 5d2acfc7b974bbd3858b4dd3f2cdc6362dd8843a
Author: Josh Triplett <josh@joshtriplett.org>
Date:   Mon Apr 7 15:39:09 2014 -0700

    kconfig: make allnoconfig disable options behind EMBEDDED and EXPERT

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
