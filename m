Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32217 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751190AbdKIFxu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 00:53:50 -0500
MIME-Version: 1.0
In-Reply-To: <20171109053529.GA12717@ravnborg.org>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
 <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com> <20171109053529.GA12717@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 Nov 2017 14:53:04 +0900
Message-ID: <CAK7LNARyrgRBYOW7NGURnVUhhArL3C46UWiSosveM9KGmvEY4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: create built-in.o automatically if parent
 directory wants it
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Michal Marek <mmarek@suse.com>

Hi Sam,

Thanks for your review.

2017-11-09 14:35 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> Hi Masahiro.
>
> Thanks for picking this up.
>
>> A key point is, the parent Makefile knows whether built-in.o is needed
>> or not.  If a subdirectory needs to create built-in.o, its parent can
>> tell the fact when Kbuild descends into it.
> Good observation!
>>
>> diff --git a/Makefile b/Makefile
>> index 008a4e5..cc0b618 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1003,7 +1003,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
>>
>>  PHONY += $(vmlinux-dirs)
>>  $(vmlinux-dirs): prepare scripts
>> -     $(Q)$(MAKE) $(build)=$@
>> +     $(Q)$(MAKE) $(build)=$@ need-builtin=1
>
> The need-bultin may also be required for the shortcuts
> that allows one to use:
>
>         make <dir>/
>
>     example:
>
>         make net/


I do not want to add need-builtin=1 for single targets.


make scripts/
would create false scripts/built-in.o
This is odd.

I wrote the solution in the commit log:
  $(obj-y) should be still checked to support the single target "%/".


If net/Makefile contains at least one obj-y,
"make net/" will create built-in.o





> And maybe selftest, documentation shortcuts too?
> Other than that - looks good.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
>         Sam
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
