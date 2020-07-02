Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35206 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGBCmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 22:42:52 -0400
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org> <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
In-Reply-To: <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 11:41:52 +0900
Message-ID: <CAK7LNAQ6SdeWvXj7nNtzMBN2E-s4PmGg6gj7OZHug2_TBKTg1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not export LDFLAGS_vmlinux
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Guan Xuetao <gxt@pku.edu.cn>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>

On Thu, Jul 2, 2020 at 5:14 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> [...]
>
> > diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> > index 12ae1e91cb75..c6538d3321b9 100644
> > --- a/arch/xtensa/boot/boot-elf/Makefile
> > +++ b/arch/xtensa/boot/boot-elf/Makefile
> > @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
> >                 $(OBJS) $@
> >
> >  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> > -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> > +       $(LD) $(KBUILD_LDFLAGS) \
>
> Can that $(Q) be retained, please?
> The rest LGTM.


Oops, I temporarily deleted $(Q) for debugging,
then accidentally committed it.

I will restore $(Q) when this patch is applied.

Thanks.





> >                 -T $(obj)/boot.lds \
> >                 --build-id=none \
> >                 -o $@ $(obj)/Image.o
>
> --
> Thanks.
> -- Max



-- 
Best Regards
Masahiro Yamada
