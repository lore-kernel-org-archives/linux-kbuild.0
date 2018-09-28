Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40544 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbeI1Xqe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 19:46:34 -0400
Subject: Re: [PATCH v3 6/9] kbuild: consolidate Devicetree dtb build rules
References: <20180910150403.19476-1-robh@kernel.org>
 <20180910150403.19476-7-robh@kernel.org>
 <CAL_Jsq+=VbdcVLiwXbOA5d+R2YY6=2Pw2bQpci-jj-JvereD1A@mail.gmail.com>
 <CAK7LNAQFqhWw+LwDoypGG=OP6tH4qf2tT=LvtchK2GoiNyzDXg@mail.gmail.com>
 <CAMuHMdWEnoh97_jiDWMq=ke4PrhSFbToYnx91CPLBuq3mOGzoQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <75740733-d0d4-4c0c-838c-f01a5e7291d3@suse.de>
Date: Fri, 28 Sep 2018 19:21:45 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWEnoh97_jiDWMq=ke4PrhSFbToYnx91CPLBuq3mOGzoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, H8/300 ARCHITECTURE <uclinux-h8-devel@lists.sourceforge.jp>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org, Will Deacon <will.deacon@arm.com>, Paul Burton <paul.burton@mips.com>, ley.foon.tan@intel.com

Hi Geert,

Am 13.09.18 um 17:51 schrieb Geert Uytterhoeven:
> On Wed, Sep 12, 2018 at 3:02 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Even x86 can enable OF and OF_UNITTEST.
>>
>> Another solution might be,
>> guard it by 'depends on ARCH_SUPPORTS_OF'.
>>
>> This is actually what ACPI does.
>>
>> menuconfig ACPI
>>         bool "ACPI (Advanced Configuration and Power Interface) Support"
>>         depends on ARCH_SUPPORTS_ACPI
>>          ...
> 
> ACPI is a real platform feature, as it depends on firmware.
> 
> CONFIG_OF can be enabled, and DT overlays can be loaded, on any platform,
> even if it has ACPI ;-)

How would loading a DT overlay work on an ACPI platform? I.e., what
would it overlay against and how to practically load such a file?

I wonder whether that could be helpful for USB devices and serdev...

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
