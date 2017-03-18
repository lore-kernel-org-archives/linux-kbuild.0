Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-07.nifty.com ([202.248.20.72]:50840 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdCRNs5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Mar 2017 09:48:57 -0400
MIME-Version: 1.0
In-Reply-To: <CAB=NE6U9c9=vui99QLH-cg=MAT2antTGKqMvKFswB1w+7Xnv5Q@mail.gmail.com>
References: <20170118173156.16060-1-mcgrof@kernel.org> <20170123150727.4883-1-mcgrof@kernel.org>
 <CAK7LNASzfaBQVTk94=eZ347ZhkZVhqwjrqfhWOro8Cg7pCykKg@mail.gmail.com>
 <20170315005348.GK28800@wotan.suse.de> <CAK7LNAQmVSXVQt4-GHiOTUh4Dc0s0xB7Ob4kyA7G_qiM5CEDZA@mail.gmail.com>
 <CAB=NE6U9c9=vui99QLH-cg=MAT2antTGKqMvKFswB1w+7Xnv5Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Mar 2017 22:32:56 +0900
Message-ID: <CAK7LNATjUKVdnnxJTg6vavux4O5PyBTpz727vRDRx_WqrYunkA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware/Makefile: force recompilation if makefile changes
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ming Lei <ming.lei@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tom Gundersen <teg@jklm.no>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

Hi Luis,

2017-03-17 2:55 GMT+09:00 Luis R. Rodriguez <mcgrof@kernel.org>:
> On Thu, Mar 16, 2017 at 10:43 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi Luis,
>>
>> 2017-03-15 9:53 GMT+09:00 Luis R. Rodriguez <mcgrof@kernel.org>:
>>> On Sat, Mar 11, 2017 at 02:37:02PM +0900, Masahiro Yamada wrote:
>>>> Hi Luis,
>>>>
>>>>
>>>> 2017-01-24 0:07 GMT+09:00 Luis R. Rodriguez <mcgrof@kernel.org>:
>>>> > If you modify the target asm we currently do not force the
>>>> > recompilation of the firmware files. The target asm is in
>>>> > the firmware/Makefile, peg this file as a dependency to
>>>> > require re-compilation of firmware targets when the asm
>>>> > changes.
>>>> >
>>>> > Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
>>>> > ---
>>>> >
>>>> > Michal,
>>>> >
>>>> > I had this patch as part of my linker table series [0] but have split it
>>>> > off as its a small atomic separate change and can go in separately. Greg
>>>> > prefers this be reviewed by the kbuild tree so sending it your way.
>>>> > This v2 has no modifications, just resending it to the kbuild tree.
>>>> >
>>>> > [0] https://lkml.kernel.org/r/20170115211057.17167-1-mcgrof@kernel.org
>>>> >
>>>> >  firmware/Makefile | 3 ++-
>>>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>>>> >
>>>> > diff --git a/firmware/Makefile b/firmware/Makefile
>>>> > index e297e1b52636..fa3e81c2a97b 100644
>>>> > --- a/firmware/Makefile
>>>> > +++ b/firmware/Makefile
>>>> > @@ -176,7 +176,8 @@ quiet_cmd_fwbin = MK_FW   $@
>>>> >  wordsize_deps := $(wildcard include/config/64bit.h include/config/32bit.h \
>>>> >                 include/config/ppc32.h include/config/ppc64.h \
>>>> >                 include/config/superh32.h include/config/superh64.h \
>>>> > -               include/config/x86_32.h include/config/x86_64.h)
>>>> > +               include/config/x86_32.h include/config/x86_64.h \
>>>> > +               firmware/Makefile)
>>>> >
>>>> >  $(patsubst %,$(obj)/%.gen.S, $(fw-shipped-y)): %: $(wordsize_deps)
>>>> >         $(call cmd,fwbin,$(patsubst %.gen.S,%,$@))
>>>>
>>>>
>>>> Why don't you use  $(call filechk,...) or $(call if_changed,...)
>>>> instead of wordsize_deps ?
>>>
>>> Care to send a patch?
>>
>>
>> Sorry for my late reply.
>>
>> Yes, if you want, I will give it a try.
>>
>> But, please wait until this weekend...
>
> Andrew picked up my patch already as its been sitting in limbo without
> any feedback for a long time


OK.   (and, sorry for the delay.)

It is not a good idea to make your work stuck even longer.


> --- so you can work off of what is on
> linux-next or we can request Andrew to drop this patch once and if you
> get a replacement as its not yet on Linus' tree.
>

Please go ahead with your patch.


When I find time to take a close look,
I may come back to firmware/Makefile.
But, I guess it will not happen soon.



-- 
Best Regards
Masahiro Yamada
