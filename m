Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:49533 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750703AbYLLFpp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Dec 2008 00:45:45 -0500
Message-ID: <4941F93A.7090604@snapgear.com>
Date: Fri, 12 Dec 2008 15:40:10 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin> <200812090026.06689.arnd@arndb.de> <20081209054528.GA1407@uranus.ravnborg.org> <Pine.LNX.4.64.0812110932510.7310@anakin>
In-Reply-To: <Pine.LNX.4.64.0812110932510.7310@anakin>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>


Geert Uytterhoeven wrote:
> On Tue, 9 Dec 2008, Sam Ravnborg wrote:
>> On Tue, Dec 09, 2008 at 12:26:05AM +0100, Arnd Bergmann wrote:
>>> On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
>>>>> I have used the following include guard:
>>>>>
>>>>> #ifdef __uClinux__
>>>>> #include "atomic_no.h"
>>>>> #else
>>>>> #include "atomic_mm.h"
>>>>> #endif
>>>>>
>>>>> gcc -E -dM for the two compilers revealed that this was the
>>>>> only symbol that differed.
>>>> I think you can share a toolchain for m68k and m68knommu, at least for the
>>>> kernel (I used my plain m68k toolchain when experimenting with m68knommu for
>>>> Amiga).
>>>>
>>>>> With the above construct we do the "right thing" also for
>>>>> headers exported to userspace.
>>>>> But actually none of the headers using the above are
>>>>> subject for export at the moment so we could use a
>>>>> CONFIG_ symbol for the same.
>>>> So I prefer to just check CONFIG_MMU.
>>> Some of them are, by means of include/asm-generic/Kbuild.asm, e.g.
>>> unistd.h!
>> I was fooled by make headers_check showing no errros.
>> But it turns out that headers_check does not recognize
>> includes made with "".
>>
>> So I will update the patch to include revevant *_{no,mm}.h files
>> in Kbuild.
>>
>>> I'm not sure if it's entirely correct, but I think you can use
>>>
>>> #ifdef __KERNEL__
>>> # ifdef CONFIG_MMU
>>> #  include "atomic_mm.h
>>> # else
>>> #  include "atomic_no.h
>>> # endif
>>> #else
>>> # ifndef __uClinux__
>>> #  include "atomic_mm.h
>>> # else
>>> #  include "atomic_no.h
>>> # endif
>>> #endif
>> Can someone with a shared (m68k/m68knommu) please check if
>> __uClinux__ is only set in the m68knommu case.
>>
>> Use:
>>
>>     touch foo.h; gcc -E -dM
>>
>> to see what is defined by the compiler.
>> You will also need to specify if this is for m68k or m68knommu.
> 
> Any comments from the m68knommu toolchain people?
 >
> None of my m68k-linux compilers set __uClinux__, as expected.

A m68k-uclinux- gcc will. From a gcc-4.2.4

   m68k-uclinux-gcc -E -dM /tmp/foo.h | grep -i linux

   #define __linux 1
   #define __linux__ 1
   #define __uClinux__ 1
   #define __gnu_linux__ 1
   #define linux 1

(I think that is one of the very few differences of m68k-linux
over m68k-uclinux...)

I would rather just have a m68k-linux myself, and not have a
separate m68k-uclinux toolchain.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
