Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36331 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfKKBsN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 20:48:13 -0500
MIME-Version: 1.0
References: <20191111011106.18427-1-linux@roeck-us.net> <20191110.173203.1243596361382467520.davem@davemloft.net>
In-Reply-To: <20191110.173203.1243596361382467520.davem@davemloft.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 11 Nov 2019 10:47:05 +0900
Message-ID: <CAK7LNAQTCyEVKkJQfoTpd5USk5tibmcro6EeoonjXKm-OAFJ_g@mail.gmail.com>
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Cc: sparclinux <sparclinux@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>

On Mon, Nov 11, 2019 at 10:32 AM David Miller <davem@davemloft.net> wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Sun, 10 Nov 2019 17:11:06 -0800
>
> > sparc64:allmodconfig fails to build with the following error.
> >
> > unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> > arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> > make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> > make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> > make[2]: *** Waiting for unfinished jobs....
> >
> > The problem bisects to commit a3de7a72c517 ("kbuild: change
> > *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> > Duplicate the x86 specific defines from this commit to the sparc
> > vdso Makefile to fix the problem.
> >
> > Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Acked-by: David S. Miller <davem@davemloft.net>


Yeah, I had submitted a fix a long time before.

https://lore.kernel.org/patchwork/patch/1130469/

I do not know why it was not picked up.


It is OK whether any patch is picked up
as long as the build error is fixed.


(I think  CFLAGS_REMOVE_vdso32/vdso-note.o
should be added too, though)




-- 
Best Regards
Masahiro Yamada
