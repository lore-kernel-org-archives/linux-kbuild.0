Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27085 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVSRo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 14:17:44 -0400
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com> <202005211506.2700F86@keescook>
In-Reply-To: <202005211506.2700F86@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 23 May 2020 03:16:49 +0900
Message-ID: <CAK7LNAQ1HTTSq-yp0t6Z4V-Z9PHg+O2n=NC89FJJFNQnhaOcSA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 22, 2020 at 7:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> > Instead of linking all compilation units again each time vmlinux_link is
> > called, reuse vmlinux.o from modpost_link.
> >
> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> > in the time spent in vmlinux_link).
>
> Nice! Any time savings at final link is a big cumulative win.
>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/link-vmlinux.sh | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index d09ab4afbda4..c6cc4305950c 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -77,11 +77,8 @@ vmlinux_link()
> >
> >       if [ "${SRCARCH}" != "um" ]; then
> >               objects="--whole-archive                        \
> > -                     ${KBUILD_VMLINUX_OBJS}                  \
> > +                     vmlinux.o                               \
> >                       --no-whole-archive                      \
> > -                     --start-group                           \
> > -                     ${KBUILD_VMLINUX_LIBS}                  \
> > -                     --end-group                             \
> >                       ${@}"
> >
> >               ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>
> I think the "um" case can be updated as well too, yes?

I agree.

I changed the um part, then ARCH=um build is successful.







> Also, I think the comment above modpost_link() needs to be updated now
> to reflect the nature of how vmlinux.o gets used after this patch.
>
> --
> Kees Cook



-- 
Best Regards
Masahiro Yamada
