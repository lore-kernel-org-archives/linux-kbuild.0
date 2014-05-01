Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:61782 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbaEAApE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2014 20:45:04 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU6DEnE+-b+V1DKub3F4ZENPwzvfqwg7LMToH3ULTHCHA@mail.gmail.com>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	<1398743403.8217.7.camel@concordia>
	<CAOMZO5AuVyZ9Dqo2wUjeN2E0CZVjXoCgR5t8zje-37yPtr_tHA@mail.gmail.com>
	<CAMo8Bf+6AZcSEqTvnkV2e0x85v9PViGdLy5m9YCDK0Z9GsO-Pg@mail.gmail.com>
	<CAMuHMdU6DEnE+-b+V1DKub3F4ZENPwzvfqwg7LMToH3ULTHCHA@mail.gmail.com>
Date: Thu, 1 May 2014 04:45:02 +0400
Message-ID: <CAMo8BfLRfQOYHR0Ltbqa4emaTjSFVBvT9NJcfK7Nk-JHf5dU3A@mail.gmail.com>
Subject: Re: kissb mkimage doesn't support extensa
From: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabio Estevam <festevam@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, May 1, 2014 at 12:53 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 30, 2014 at 9:34 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Wed, Apr 30, 2014 at 10:31 PM, Fabio Estevam <festevam@gmail.com> wrote:
>>> On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>> On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
>>>>> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
>>>>>
>>>>> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
>>>>> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
>>>>> blackfin, avr32
>>>>
>>>> I've upgraded to the latest version in Debian (2014.01), but it still doesn't
>>>> seem to support xtensa.
>>>>
>>>>   $ /usr/bin/mkimage -A xtensa
>>>>
>>>>   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
>>>>   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
>>>>   nds32, or1k, sandbox, arm64
>>>
>>> As mainline U-boot does not support xtensa currently, what about
>>> dropping the uImage format to be built?
>>
>> There's xtensa port for U-boot at https://github.com/foss-xtensa/u-boot
>> Also KISSKB didn't even try to build uImage for xtensa until recently.
>> What's changed?
>
> When comparing the build between 18a1a7a1 (good) and a7963eb7f4
> (bad), it seems allnoconfig changes the build type from ISS to XT2000.

Ok, then we'd better restore ISS as the default platform for allnoconfig:

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 17b3198..2ca8819 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -243,7 +243,6 @@ choice

 config XTENSA_PLATFORM_ISS
        bool "ISS"
-       depends on TTY
        select XTENSA_CALIBRATE_CCOUNT
        select SERIAL_CONSOLE
        help
diff --git a/arch/xtensa/platforms/iss/Makefile
b/arch/xtensa/platforms/iss/Makefile
index d2369b7..b3e8929 100644
--- a/arch/xtensa/platforms/iss/Makefile
+++ b/arch/xtensa/platforms/iss/Makefile
@@ -4,6 +4,7 @@
 # "prom monitor" library routines under Linux.
 #

-obj-y                  = console.o setup.o
+obj-y                  = setup.o
+obj-$(CONFIG_TTY)      += console.o
 obj-$(CONFIG_NET)      += network.o
 obj-$(CONFIG_BLK_DEV_SIMDISK) += simdisk.o

-- 
Thanks.
-- Max
