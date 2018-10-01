Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50194 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbeJBEmE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Oct 2018 00:42:04 -0400
MIME-Version: 1.0
References: <20180918212847.199085-1-namit@vmware.com> <20180918212847.199085-3-namit@vmware.com>
 <1aa5a1f3-ef3d-5cd3-831c-2202d73d3c9e@rasmusvillemoes.dk> <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
In-Reply-To: <307823F9-DCCF-4384-9FBE-28642FAD6B4E@vmware.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Oct 2018 07:01:19 +0900
Message-ID: <CAK7LNAT98KZrMLuypS0PZ4jUWC+uRWyYwHPiEJD6LYoYzndJhA@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] Makefile: Prepare for using macros for inline asm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.



2018=E5=B9=B49=E6=9C=8827=E6=97=A5(=E6=9C=A8) 2:57 Nadav Amit <namit@vmware=
.com>:
>
> at 1:58 AM, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
>
> > On 2018-09-18 23:28, Nadav Amit wrote:
> >
> >> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> >> index 8f6e7eb8ae9f..944fa3bc9376 100644
> >> --- a/arch/x86/Makefile
> >> +++ b/arch/x86/Makefile
> >> @@ -214,8 +214,8 @@ ifdef CONFIG_X86_64
> >> KBUILD_LDFLAGS +=3D $(call ld-option, -z max-page-size=3D0x200000)
> >> endif
> >>
> >> -# Speed up the build
> >> -KBUILD_CFLAGS +=3D -pipe
> >> +# We cannot use -pipe flag since we give an additional .s file to the=
 compiler
> >> +#KBUILD_CFLAGS +=3D -pipe
> >
> > Is this really necessary? The gas manual says that one can use -- to
> > name stdin, though that's probably a typo and should just be - . Doing
> >
> > gcc -pipe -Wa,foo.s -Wa,-
>
> Good idea. I didn=E2=80=99t think of it. Yes, this can do the trick. I=E2=
=80=99ll do it in
> v9.
>
> > does seem to work as expected (and would also make it possible to appen=
d
> > some .s file should that ever be required).
> >> +archmacros:
> >> +    $(Q)$(MAKE) $(build)=3Darch/x86/kernel arch/x86/kernel/macros.s
> >> +
> >> +ASM_MACRO_FLAGS =3D -Wa,arch/x86/kernel/macros.s
> >> +export ASM_MACRO_FLAGS
> >> +KBUILD_CFLAGS +=3D $(ASM_MACRO_FLAGS)
> > How does this affect what gets rebuilt when one of the asm/foo.h files
> > going into macros.s changes? Does that cause a global rebuild because
> > everything depends on macros.s, or do we still only rebuild the files
> > that actually include asm/foo.h?
>
> There will not be a global rebuild. Any source file that uses the header
> files that are included in macros.S will be rebuilt.
>
> But your question actually raises two issues:
>
> 1. If macros.S changes, there *should* be a global rebuild,


Looking at this series, I can see this rule:
"macros and inline functions that calls them are placed in the same header"=
.


For example,
REFCOUNT_CHECK_LE_ZERO is defined in <asm/refcount.h>,
and REFCOUNT_CHECK_LE_ZERO is invoked via refcount_sub_and_test() etc.
in the same header.

Therefore, all users of REFCOUNT_CHECK_LE_ZERO must have included
<asm/refcount.h>

This means all C files using REFCOUNT_CHECK_LE_ZERO
will be appropriately recompiled as long as the rule above is observed.



> and currently
> there wouldn=E2=80=99t be one. Do you happen to know what would be the ap=
propriate
> way to trigger one?
>
> 2. Someone might mistakenly use the macros through inline assembly withou=
t
> including the header file.

Right, it is possible to use REFCOUNT_CHECK_LE_ZERO directly.
If this happens, my assumption breaks.

It would be unlikely to happen, though...


> It would be better to detect such cases and fail
> the build. I may be able to create another asm macro in the C part of the
> header that would cause the build to fail. But let me know if you any
> better idea.
>
> Regards,
> Nadav
>


--=20
Best Regards
Masahiro Yamada
