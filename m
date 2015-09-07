Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:41219 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751206AbbIGNVT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Sep 2015 09:21:19 -0400
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com [209.85.160.173]) (authenticated)
	by conssluserg001-v.nifty.com with ESMTP id t87DKvEN024420
	for <linux-kbuild@vger.kernel.org>; Mon, 7 Sep 2015 22:20:58 +0900
Received: by ykdg206 with SMTP id g206so79836273ykd.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2015 06:20:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <014501d0e93a$4ee5ea90$ecb1bfb0$@samsung.com>
References: <01e001d0e716$34a48b80$9deda280$@samsung.com>
	<CAK7LNAS3UFq17rHobEUpS=fbyefscPunyHu9DMTAJESzcSfLxw@mail.gmail.com>
	<014501d0e93a$4ee5ea90$ecb1bfb0$@samsung.com>
Date: Mon, 7 Sep 2015 22:20:57 +0900
Message-ID: <CAK7LNAQHHKUO=EWQrgHLLu0rZM5sfH=xZ+XW9t9-ehBNmf7qxQ@mail.gmail.com>
Subject: Re: PING: [PATCH] make build tool dependencies portable
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Fedin <p.fedin@samsung.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2015-09-07 15:56 GMT+09:00 Pavel Fedin <p.fedin@samsung.com>:
>  Hello!
>
>> scripts/Makefile has the following:
>>
>> hostprogs-$(CONFIG_LOGO)         += pnmtologo
>>
>>
>> This should work if you enable CONFIG_LOGO in Kconfig.
>
>  Yes, i know this. But, pnmlogo, in its turn, depends on pnmlogo.c. This is currently implicit (i don't see explicit lines anywhere), and this appears not to work correctly everywhere.
>
>> Please do not screw up Kbuild for Cygwin.
>>
>> See the answer from Michal (and you agreed)
>> https://patchwork.kernel.org/patch/7014361/
>
>  Yes, i remember. And my fix doesn't contain any it's etc, it's simple and actually it's generic.


Generic?
Your patch is a really ad-hoc fix.


> diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
> index 3b43781..cc636f1 100644
> --- a/drivers/video/logo/Makefile
> +++ b/drivers/video/logo/Makefile
> @@ -38,6 +38,7 @@ extra-y += $(call logo-cfiles,_clut224,ppm)
>  extra-y += $(call logo-cfiles,_gray256,pgm)
>
>  pnmtologo := scripts/pnmtologo
> +$(pnmtologo): $(objtree)/scripts/pnmtologo.c
>
>  # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
>  quiet_cmd_logo = LOGO    $@
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 01df30a..c9ce3b0 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -316,6 +316,8 @@ quiet_cmd_asn1_compiler = ASN.1   $@
>  $(obj)/%-asn1.c $(obj)/%-asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
>       $(call cmd,asn1_compiler)
>
> +$(objtree)/scripts/asn1_compiler: $(objtree)/scripts/asn1_compiler.c
> +


You are adding the dependency of pnmtolog and asn1_compiler.


We have more host tools.  See scripts/Makefile

hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
hostprogs-$(CONFIG_LOGO)         += pnmtologo
hostprogs-$(CONFIG_VT)           += conmakehash
hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
hostprogs-$(CONFIG_ASN1)         += asn1_compiler


Fixing only two of those host-tools is not generic at all.

Moreover, scripts/Makefile.build is not the place where we put
a rule of a particular host tool.



In the first place, if you had a problem with those two host tools,
what about scripts/basic/fixdep ?


scripts/basic/Makefile:


hostprogs-y     := fixdep


The situation is the same as pnmtologo and asn1_compiler.
The dependency is what you call implicit.




> Ok, how can improve it further? What about adding explicit dependencies to scripts/Makefile then?

scripts/Makefile.host is the correct place where we fix host-tools
problems in a generic way.
But I doubt if we need to fix this.



> These explicit dependencies not only fix Cygwin-related problem, but also make the Makefile more readable, don't they?

No.
Kbuild already made Makefiles readable.  You are just messing up Makefiles.


-- 
Best Regards
Masahiro Yamada
