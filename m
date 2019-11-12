Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27009 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfKLMH1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Nov 2019 07:07:27 -0500
MIME-Version: 1.0
References: <20191111011106.18427-1-linux@roeck-us.net> <20191110.173203.1243596361382467520.davem@davemloft.net>
 <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com> <591a9e5e-1347-8883-c080-38940fffd535@roeck-us.net>
In-Reply-To: <591a9e5e-1347-8883-c080-38940fffd535@roeck-us.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Nov 2019 21:06:20 +0900
Message-ID: <CAK7LNASY209k5g61=+cbRgjNp8=1QGcP6c2RcCBad7NnfUhHHQ@mail.gmail.com>
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Miller <davem@davemloft.net>, sparclinux <sparclinux@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>

On Mon, Nov 11, 2019 at 11:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/10/19 5:47 PM, Masahiro Yamada wrote:
> > On Mon, Nov 11, 2019 at 10:32 AM David Miller <davem@davemloft.net> wrote:
> >>
> >> From: Guenter Roeck <linux@roeck-us.net>
> >> Date: Sun, 10 Nov 2019 17:11:06 -0800
> >>
> >>> sparc64:allmodconfig fails to build with the following error.
> >>>
> >>> unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> >>> arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> >>> make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> >>> make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> >>> make[2]: *** Waiting for unfinished jobs....
> >>>
> >>> The problem bisects to commit a3de7a72c517 ("kbuild: change
> >>> *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> >>> Duplicate the x86 specific defines from this commit to the sparc
> >>> vdso Makefile to fix the problem.
> >>>
> >>> Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> >>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> Cc: Marc Zyngier <maz@kernel.org>
> >>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>
> >> Acked-by: David S. Miller <davem@davemloft.net>
> >
> >
> > Yeah, I had submitted a fix a long time before.
> >
> > https://lore.kernel.org/patchwork/patch/1130469/
> >
> > I do not know why it was not picked up.
> >
>
> Why don't you just push it upstream yourself ?
>
> >
> > It is OK whether any patch is picked up
> > as long as the build error is fixed.
> >
> Same here.
>
> >
> > (I think  CFLAGS_REMOVE_vdso32/vdso-note.o
> > should be added too, though)
> >
> Hard to decide for someone not involved in vdso development.
> It wasn't added for x86, and it compiles without, so I rather
> left it alone.


After looking at the code closer,
I believe your code is more correct.

vdso-note is assembly instead of C.

arch/sparc/vdso/vdso-note.S
arch/sparc/vdso/vdso32/vdso-note.S



The -pg flag is added by the top Makefile,
only for C files.


CFLAGS_REMOVE_vdso-note.o = -pg
was unneeded in the first place.



BTW, I just thought this patch
was supposed to be applied by Dave
since it is touching a single file in arch/sparc/.

If Dave plans to pick up this, please feel free to add:

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


If I should apply this to kbuild tree, please let me know.



-- 
Best Regards
Masahiro Yamada
