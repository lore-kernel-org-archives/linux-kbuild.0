Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr740139.outbound.protection.outlook.com ([40.107.74.139]:35568
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729882AbfAJSLN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 13:11:13 -0500
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with ftrace
 & GCC <= 4.7
Date: Thu, 10 Jan 2019 18:11:07 +0000
Message-ID: <20190110181106.otlwmiznvq2l67iv@pburton-laptop>
References: <CAMuHMdUw9LMVb-8RSNVBEcDMVB9SFOdfF+kb20=gxJiWF1x8sQ@mail.gmail.com>
 <20190109231539.24613-1-paul.burton@mips.com>
 <CAK7LNAReiEzF1nS8WR_yUmi-boJnfLWw5bjUvL2rDEAYnxwCzw@mail.gmail.com>
In-Reply-To: <CAK7LNAReiEzF1nS8WR_yUmi-boJnfLWw5bjUvL2rDEAYnxwCzw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62C085429D23EA4CB13A8E6912BAE915@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <pburton@wavecomp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

Hi Masahiro,

On Thu, Jan 10, 2019 at 11:00:49AM +0900, Masahiro Yamada wrote:
> On Thu, Jan 10, 2019 at 8:16 AM Paul Burton <paul.burton@mips.com> wrote:
> > When building using GCC 4.7 or older, -ffunction-sections & the -pg fla=
g
> > used by ftrace are incompatible. This causes warnings or build failures
> > (where -Werror applies) such as the following:
> >
> >   arch/mips/generic/init.c:
> >     error: -ffunction-sections disabled; it makes profiling impossible
> >
> > This used to be taken into account by the ordering of calls to cc-optio=
n
> > from within the top-level Makefile, which was introduced by commit
> > 90ad4052e85c ("kbuild: avoid conflict between -ffunction-sections and
> > -pg on gcc-4.7"). Unfortunately this was broken when the
> > CONFIG_LD_DEAD_CODE_DATA_ELIMINATION cc-option check was moved to
> > Kconfig in commit e85d1d65cd8a ("kbuild: test dead code/data eliminatio=
n
> > support in Kconfig"), because the flags used by this check no longer
> > include -pg.
> >
> > Fix this by not allowing CONFIG_LD_DEAD_CODE_DATA_ELIMINATION to be
> > enabled at the same time as ftrace/CONFIG_FUNCTION_TRACER when building
> > using GCC 4.7 or older.
> >
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> > Fixes: e85d1d65cd8a ("kbuild: test dead code/data elimination support i=
n Kconfig")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: stable@vger.kernel.org # v4.19+
> > ---
> >  init/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index d47cb77a220e..c787f782148d 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1124,6 +1124,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
> >         bool "Dead code and data elimination (EXPERIMENTAL)"
> >         depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> >         depends on EXPERT
> > +       depends on !FUNCTION_TRACER || !CC_IS_GCC || GCC_VERSION >=3D 4=
0800
> >         depends on $(cc-option,-ffunction-sections -fdata-sections)
> >         depends on $(ld-option,--gc-sections)
> >         help
>=20
> Thanks for the fix.
>=20
> I prefer this explicit 'depends on'.
>=20
> Relying on the order of $(call cc-option, ...) in Makefile is fragile.
>=20
> We raise the compiler minimum version from time to time.
> So, this 'depends on' will eventually go away in the future.
>=20
> BTW, which one do you think more readable?
>=20
> depends on !FUNCTION_TRACER || !CC_IS_GCC || GCC_VERSION >=3D 40800
>=20
>     OR
>=20
> depends on !(FUNCTION_TRACER && CC_IS_GCC && GCC_VERSION < 40800)

Thanks - yes I agree it's nice that this is more explicit than the
ordering we previously relied upon.

I personally don't mind either of the 2 options above - let me know if
you'd like me to submit a v2 using your second option.

Thanks,
    Paul
