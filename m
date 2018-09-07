Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbeIGQ6J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Sep 2018 12:58:09 -0400
MIME-Version: 1.0
References: <20180905235327.5996-1-robh@kernel.org> <20180905235327.5996-7-robh@kernel.org>
 <CAK7LNARD+_kV=XtJ66mZBU-CPMQgWF+oQtv4bGKaGGARNwzXiQ@mail.gmail.com>
In-Reply-To: <CAK7LNARD+_kV=XtJ66mZBU-CPMQgWF+oQtv4bGKaGGARNwzXiQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Sep 2018 07:17:14 -0500
Message-ID: <CAL_JsqJeTqxFPxZfuusPxuOTsVbVk_Uhue6NXwpotkwZWHrCDw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] kbuild: consolidate Devicetree dtb build rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Ley Foon Tan <lftan@altera.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Linux-MIPS <linux-mips@linux-mips.org>, nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org

On Fri, Sep 7, 2018 at 5:33 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> 2018-09-06 8:53 GMT+09:00 Rob Herring <robh@kernel.org>:
> > There is nothing arch specific about building dtb files other than their
> > location under /arch/*/boot/dts/. Keeping each arch aligned is a pain.
> > The dependencies and supported targets are all slightly different.
> > Also, a cross-compiler for each arch is needed, but really the host
> > compiler preprocessor is perfectly fine for building dtbs. Move the
> > build rules to a common location and remove the arch specific ones. This
> > is done in a single step to avoid warnings about overriding rules.
> >
> > The build dependencies had been a mixture of 'scripts' and/or 'prepare'.
> > These pull in several dependencies some of which need a target compiler
> > (specifically devicetable-offsets.h) and aren't needed to build dtbs.
> > All that is really needed is dtc, so adjust the dependencies to only be
> > dtc.
> >
> > This change enables support 'dtbs_install' on some arches which were
> > missing the target.
> >
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Vineet Gupta <vgupta@synopsys.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> > Cc: Michal Simek <monstr@monstr.eu>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Paul Burton <paul.burton@mips.com>
> > Cc: James Hogan <jhogan@kernel.org>
> > Cc: Ley Foon Tan <lftan@altera.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Chris Zankel <chris@zankel.net>
> > Cc: Max Filippov <jcmvbkbc@gmail.com>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-snps-arc@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: uclinux-h8-devel@lists.sourceforge.jp
> > Cc: linux-mips@linux-mips.org
> > Cc: nios2-dev@lists.rocketboards.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-xtensa@linux-xtensa.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack so I can take the whole series via the DT tree.
> >
> > v2:
> >  - Fix $arch/boot/dts path check for out of tree builds
> >  - Fix dtc dependency for building built-in dtbs
> >  - Fix microblaze built-in dtb building
>
>
> This breaks parallel building
> because two threads could descend into scripts/dtc
> at the same time.
>
> 'all' depends on both 'scripts' and 'dtc'.
>
> * 'scripts' target -- descends into scripts/, then scripts/dtc
> * 'dtc' target     -- descents into scripts/dtc directly

Any suggestions for how to fix given the problem with depending on
scripts? I suppose I could make scripts depend on dtc instead, but I'd
be back to needing to fix cleaning. Or I could just skip removing the
cross compiler dependency for now.

Rob
