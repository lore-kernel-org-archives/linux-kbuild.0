Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39594 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbeJQM4t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 08:56:49 -0400
Date: Tue, 16 Oct 2018 22:02:55 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] Kbuild: Hide Clang's -Wempty-body behind W=1
Message-ID: <20181017050255.GA9286@flashbox>
References: <20181016021454.11953-1-natechancellor@gmail.com>
 <CAK7LNATO+L4-0SpuWrCnYEUVbxmcQkjOQvMB6PEsFv1b-heJOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATO+L4-0SpuWrCnYEUVbxmcQkjOQvMB6PEsFv1b-heJOA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>

Hi Masahiro,

On Wed, Oct 17, 2018 at 01:48:46PM +0900, Masahiro Yamada wrote:
> Hi Nathan,
> 
> 
> On Tue, Oct 16, 2018 at 11:15 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > There are only a few instances of this warning in an arm64 allyesconfig
> > build but none of them appear useful. I believe the intention of the
> > warning is to avoid situations like this:
> >
> > if (condition);
> >         statement;
> >
> > where the user really intended
> >
> > if (condition)
> >         statement;
> >
> > However, these instances have already been caught by GCC's warning about
> > misleading indentation
> 
> 
> Right, the example above is caught by -Wmisleading-indentation.
> 
> However, the following is not.
> 
>    if (condition)
>           ;
> 
> 
> 
> So, -Wempty-body is a kind of different thing,
> and still useful in my opinion.
> 
> 
> 
> > so the remaining warnings are about loops that
> > fall into one of three categories:
> >
> > 1. Execute a function unconditionally (avoiding a useless variable to
> >    hold the return value):
> >
> > drivers/isdn/hisax/hfc_pci.c:131:34: warning: if statement has empty body
> > [-Wempty-body]
> >         if (Read_hfc(cs, HFCPCI_INT_S1));
> 
> 
> I think this is a real bug,
> then -Wempty-body finally caught it.
> (but -Wmisleading-indentation cannot catch it.)
> 
> 
> 
> It is wrong to enclose a non-effective statement with 'if ();'
> just for suppressing another warning.
> 
> 
> 
>      Read_hfc(cs, HFCPCI_INT_S1);
> 
> would emit this warning.
> 
> 
> In file included from drivers/isdn/hisax/hfc_pci.c:20:0:
> drivers/isdn/hisax/hfc_pci.c: In function ‘reset_hfcpci’:
> drivers/isdn/hisax/hfc_pci.h:232:25: warning: statement with no effect
> [-Wunused-value]
>  #define Read_hfc(a, b) (*(((u_char *)a->hw.hfcpci.pci_io) + b))
>                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/isdn/hisax/hfc_pci.c:131:2: note: in expansion of macro ‘Read_hfc’
>   Read_hfc(cs, HFCPCI_INT_S1);
>   ^~~~~~~~
> 
> 
> 
> The root cause is missing 'volatile'
> while Read_hfc() is supposed to read out a HW register.
> 
> 
> 
> #define Read_hfc(a, b) (*(((volatile u_char *)a->hw.hfcpci.pci_io) + b))
> 
> will be a correct fix.
> (or just use a standard accessor like readb(), ioread8(), etc.)
> 
> 
> 
> 
> if (Read_hfc(cs, HFCPCI_INT_S1));
> 
> is optimized out by the compiler, so it is not working as expected.
> 
> 
> 
> >
> > 2. Advancing a value to be used later on in the function like a pointer
> >    or a count:
> >
> > drivers/atm/eni.c:244:48: warning: for loop has empty body
> > [-Wempty-body]
> >         for (order = 0; (1 << order) < *size; order++);
> >                                                       ^
> 
> As you noted in the commit log,
> Clang's -Wempty-body cares the location of a semi-colon,
> while GCC's one does not.
> 
> 
> 
> 
> 
>    for (order = 0; (1 << order) < *size; order++)
>              ;
> 
> is fine, and more readable in my opinion.
> 
> 
> 
> 
> > 3. Busy waiting:
> >
> > drivers/atm/zatm.c:513:7: warning: while loop has empty body
> > [-Wempty-body]
> >         zwait;
> >              ^
> 
> 
> Again, Clang is fine with an empty body in while() loop,
> but just picky about the semi-colon location.
> 
> For this particular case, how about something like this?
> 
> 
> #define zwait  do {} while (zin(CMR) & uPD98401_BUSY)
> 
> 
> 
> 
> 
> I think an even better fix is
> 
> #define zwait()  do {} while (zin(CMR) & uPD98401_BUSY)
> 
> 
> 
> then, fix-up all
> 
>    zwait;
> 
> to
> 
>    zwait();
> 
> 
> 
> 
> 
> 
> > None of these uses are problematic or need to be addressed.
> 
> 
> The first pattern is really problematic, and need to be addressed.
> 
> I want to keep -Wempty-body enabled
> to find out potential issues.
> 
> Please let me know if you see other patterns difficult to fix.
> 
> 
> 

Thank you very much for the quick feedback, this all sounds reasonable.
I will go ahead and dig into these further and send out patches to
address them.

Much appreciated,
Nathan

> 
> 
> > Clang
> > suggests moving the semi-colon to the next line to silence these
> > warnings but that defeats the purpose of the compact nature of these
> > constructs so just hide the warning behind W=1 so its use can still be
> > audited but it won't polute a regular build.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/42
> > Link: https://github.com/ClangBuiltLinux/linux/issues/66
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  scripts/Makefile.extrawarn | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index cf6cd0ef6975..8709d9d6faf1 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -11,6 +11,7 @@
> >  # are not supported by all versions of the compiler
> >  # ==========================================================================
> >
> > +KBUILD_CFLAGS += $(call cc-disable-warning, empty-body)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
> >
> >  ifeq ("$(origin W)", "command line")
> > @@ -32,6 +33,7 @@ warning-1 += $(call cc-option, -Wpacked-not-aligned)
> >  warning-1 += $(call cc-option, -Wstringop-truncation)
> >  warning-1 += $(call cc-disable-warning, missing-field-initializers)
> >  warning-1 += $(call cc-disable-warning, sign-compare)
> > +warning-1 += $(call cc-option, -Wempty-body)
> >
> >  warning-2 := -Waggregate-return
> >  warning-2 += -Wcast-align
> > --
> > 2.19.1
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
