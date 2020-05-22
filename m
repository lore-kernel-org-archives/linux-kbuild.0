Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42791 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVRpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 13:45:35 -0400
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com> <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
In-Reply-To: <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 23 May 2020 02:44:36 +0900
Message-ID: <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

+ Michael, and PPC ML.

They may know something about the reason of failure.


On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Instead of linking all compilation units again each time vmlinux_link is
> > called, reuse vmlinux.o from modpost_link.
> >
> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> > in the time spent in vmlinux_link).
> >
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
> >         if [ "${SRCARCH}" != "um" ]; then
> >                 objects="--whole-archive                        \
> > -                       ${KBUILD_VMLINUX_OBJS}                  \
> > +                       vmlinux.o                               \
> >                         --no-whole-archive                      \
> > -                       --start-group                           \
> > -                       ${KBUILD_VMLINUX_LIBS}                  \
> > -                       --end-group                             \
> >                         ${@}"
> >
> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
> >
> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
> > --
> > 2.27.0.rc0.183.gde8f92d652-goog
> >
>
>
> I like this patch irrespective of CLANG_LTO, but
> unfortunately, my build test failed.
>
>
> ARCH=powerpc failed to build as follows:
>
>
>
>   MODPOST vmlinux.o
>   MODINFO modules.builtin.modinfo
>   GEN     modules.builtin
>   LD      .tmp_vmlinux.kallsyms1
> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+4b1c
> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1cf78
> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1dac4
> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1e254
> make: *** [Makefile:1125: vmlinux] Error 1
>
>
>
> I used powerpc-linux-gcc
> available at
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/
>
>
> Build command:
>
> make -j24 ARCH=powerpc  CROSS_COMPILE=powerpc-linux-  defconfig all
>
>
> Could you check it please?
>
>
>
> I will apply it to my test branch.
> Perhaps, 0-day bot may find more failure cases.
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
