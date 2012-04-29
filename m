Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:60964 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208Ab2D2LYj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Apr 2012 07:24:39 -0400
Message-ID: <4F9D2458.5040401@snapgear.com>
Date: Sun, 29 Apr 2012 21:22:00 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Makefile: remove unnecessary check for m68knommu
 ARCH
References: <1335496484-3438-1-git-send-email-laface.tw@gmail.com> <CAMuHMdVYFvszp=5_ZG4ztpviTV_wj_+zSd=C3UAXk_YwR6GZ5A@mail.gmail.com>
In-Reply-To: <CAMuHMdVYFvszp=5_ZG4ztpviTV_wj_+zSd=C3UAXk_YwR6GZ5A@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Edward Shao <laface.tw@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, mmarek@suse.cz, sam@ravnborg.org, Greg Ungerer <gerg@uclinux.org>

On 04/27/2012 03:12 PM, Geert Uytterhoeven wrote:
> On Fri, Apr 27, 2012 at 05:14, Edward Shao<laface.tw@gmail.com>  wrote:
>> ARCH is never set to m68knomm.
>> make ARCH=m68knomm is not supported anymore.
>>
>> Signed-off-by: Edward Shao<laface.tw@gmail.com>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


>> ---
>> áMakefile | á á4 ----
>> á1 files changed, 0 insertions(+), 4 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index afc868e..6f46cf9 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -231,10 +231,6 @@ endif
>> á# Where to locate arch specific headers
>> áhdr-arch á:= $(SRCARCH)
>>
>> -ifeq ($(ARCH),m68knommu)
>> - á á á hdr-arch á:= m68k
>> -endif
>> -
>> áKCONFIG_CONFIG ?= .config
>> áexport KCONFIG_CONFIG
>>
>> --
>> 1.7.7.6
>
> Gr{oetje,eeting}s,
>
> á á á á á á á á á á á á Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> á á á á á á á á á á á á á áá áá -- Linus Torvalds
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
