Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387750AbgEWKGi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 06:06:38 -0400
Date: Sat, 23 May 2020 20:06:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
References: <20200521202716.193316-1-samitolvanen@google.com>
        <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
        <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
In-Reply-To: <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1590226253.lnkg0jun9x.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Masahiro Yamada <masahiroy@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> + Michael, and PPC ML.
>=20
> They may know something about the reason of failure.

Because the linker can't put branch stubs within object code sections,=20
so when you incrementally link them too large, the linker can't resolve=20
branches into other object files.

This is why we added incremental linking in the first place. I suppose=20
it could be made conditional for platforms that can use this=20
optimization.

What'd be really nice is if we could somehow build and link kallsyms=20
without relinking everything twice, and if we could do section mismatch=20
analysis without making that vmlinux.o as well. I had a few ideas but=20
not enough time to do much work on it.

Thanks,
Nick

>=20
>=20
> On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>>
>> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> =
wrote:
>> >
>> > Instead of linking all compilation units again each time vmlinux_link =
is
>> > called, reuse vmlinux.o from modpost_link.
>> >
>> > With x86_64 allyesconfig, vmlinux_link is called three times and reusi=
ng
>> > vmlinux.o reduces the build time ~38 seconds on my system (59% reducti=
on
>> > in the time spent in vmlinux_link).
>> >
>> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>> > ---
>> >  scripts/link-vmlinux.sh | 5 +----
>> >  1 file changed, 1 insertion(+), 4 deletions(-)
>> >
>> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
>> > index d09ab4afbda4..c6cc4305950c 100755
>> > --- a/scripts/link-vmlinux.sh
>> > +++ b/scripts/link-vmlinux.sh
>> > @@ -77,11 +77,8 @@ vmlinux_link()
>> >
>> >         if [ "${SRCARCH}" !=3D "um" ]; then
>> >                 objects=3D"--whole-archive                        \
>> > -                       ${KBUILD_VMLINUX_OBJS}                  \
>> > +                       vmlinux.o                               \
>> >                         --no-whole-archive                      \
>> > -                       --start-group                           \
>> > -                       ${KBUILD_VMLINUX_LIBS}                  \
>> > -                       --end-group                             \
>> >                         ${@}"
>> >
>> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>> >
>> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
>> > --
>> > 2.27.0.rc0.183.gde8f92d652-goog
>> >
>>
>>
>> I like this patch irrespective of CLANG_LTO, but
>> unfortunately, my build test failed.
>>
>>
>> ARCH=3Dpowerpc failed to build as follows:
>>
>>
>>
>>   MODPOST vmlinux.o
>>   MODINFO modules.builtin.modinfo
>>   GEN     modules.builtin
>>   LD      .tmp_vmlinux.kallsyms1
>> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+4b1c
>> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1cf78
>> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1dac4
>> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
>> R_PPC64_REL14 against `.text'+1e254
>> make: *** [Makefile:1125: vmlinux] Error 1
>>
>>
>>
>> I used powerpc-linux-gcc
>> available at
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2=
.0/
>>
>>
>> Build command:
>>
>> make -j24 ARCH=3Dpowerpc  CROSS_COMPILE=3Dpowerpc-linux-  defconfig all
>>
>>
>> Could you check it please?
>>
>>
>>
>> I will apply it to my test branch.
>> Perhaps, 0-day bot may find more failure cases.
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
>=20
>=20
>=20
> --=20
> Best Regards
> Masahiro Yamada
>=20
