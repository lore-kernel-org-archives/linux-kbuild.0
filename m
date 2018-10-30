Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43314 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbeJ3Veo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 17:34:44 -0400
MIME-Version: 1.0
References: <1540873293-29817-1-git-send-email-yamada.masahiro@socionext.com> <877ehzk3we.fsf@concordia.ellerman.id.au>
In-Reply-To: <877ehzk3we.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 21:40:27 +0900
Message-ID: <CAK7LNASrdToqTrffe5XD+_LuK9+0=Bv8L_7ZWeN6iSivYe8Gmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: replace cc-name test with CONFIG_CC_IS_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, Oct 30, 2018 at 9:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 17be664..338e827 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -96,7 +96,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)             += $(call cc-option,-mabi=elfv1)
> >  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)   += -mabi=elfv2
> >  endif
> >
> > -ifneq ($(cc-name),clang)
> > +ifneq ($(CONFIG_CC_IS_CLANG),y)
> >    cflags-$(CONFIG_CPU_LITTLE_ENDIAN) += -mno-strict-align
> >  endif
> >
> > @@ -175,7 +175,7 @@ endif
> >  # Work around gcc code-gen bugs with -pg / -fno-omit-frame-pointer in gcc <= 4.8
> >  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44199
> >  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52828
> > -ifneq ($(cc-name),clang)
> > +ifneq ($(CONFIG_CC_IS_CLANG),y)
> >  CC_FLAGS_FTRACE      += $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)
> >  endif
> >  endif
>
> Does this behave like other CONFIG variables, ie. it will not be defined
> when it's false?

Right.


> And if so can't we use ifdef/ifndef? eg:
>
> ifndef CONFIG_CC_IS_CLANG
>   CC_FLAGS_FTRACE       += $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)
>
> That reads cleaner to me.


OK, will do respin if you prefer ifdef/ifndef style.




> Still this patch is fine as is:
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers



-- 
Best Regards
Masahiro Yamada
