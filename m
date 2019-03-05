Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64822 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfCEFxs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 00:53:48 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x255rTDu018035
        for <linux-kbuild@vger.kernel.org>; Tue, 5 Mar 2019 14:53:30 +0900
Received: by mail-ua1-f53.google.com with SMTP id u1so6683279uae.12
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2019 21:53:30 -0800 (PST)
MIME-Version: 1.0
References: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
 <CAK7LNAS3a8u+khVim4bOOSi=QBHnEE35nEp=kfFCB5FYXkeG-A@mail.gmail.com>
 <f27a1ca8-a35f-00f2-a6d5-88cdb2cdd7d3@meijboom.info> <20190228222917.5unhtr4gxa7rcfwv@treble>
In-Reply-To: <20190228222917.5unhtr4gxa7rcfwv@treble>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Mar 2019 14:52:52 +0900
Message-ID: <CAK7LNARFd8jKr=+Qaf6oo5bQ=rTqpa9nGo-pavmMvCUE5Ow8iw@mail.gmail.com>
Subject: Re: [PATCH] objtool: remove generated files with make clean
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Robin Meijboom <robin@meijboom.info>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>

On Fri, Mar 1, 2019 at 7:29 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Feb 28, 2019 at 09:12:19PM +0100, Robin Meijboom wrote:
> > Hi Masahiro,
> >
> > On 28-02-19 14:36, Masahiro Yamada wrote:
> > > On Fri, Feb 15, 2019 at 11:15 AM Robin Meijboom <robin@meijboom.info> wrote:
> > >>
> > >> Make clean currently does not remove the generated files for objtool:
> > >> tools/objtool/objtool, tools/objtool/fixdep, and
> > >> tools/objtool/arch/x86/lib/inat-tables.c.
> > >>
> > >> Clean these files up as part of make clean.
> > >>
> > >> Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
> > >> bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).
> > >>
> > >> Signed-off-by: Robin Meijboom <robin@meijboom.info>
> > >> ---
> > >> In the discussions I didn't find a reason for keeping the files, so I
> > >> assume it is an oversight. Otherwise I would have expected them to be
> > >> removed at least by make distconfig (which they are not).
> > >>
> > >> Tested by compiling, cleaning, compiling again, and booting on x86_64.
> > >>
> > >> diff --git a/Makefile b/Makefile
> > >> index 141653226f3c..81a8149a805f 100644
> > >> --- a/Makefile
> > >> +++ b/Makefile
> > >> @@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES
> > >>
> > >>   # Directories & files removed with 'make clean'
> > >>   CLEAN_DIRS  += $(MODVERDIR) include/ksym
> > >> +CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
> > >> +           tools/objtool/arch/$(ARCH)/lib/inat-tables.c
> > >>
> > >>   # Directories & files removed with 'make mrproper'
> > >>   MRPROPER_DIRS  += include/config usr/include include/generated          \
> > >>
> > >
> > >
> > >
> > > I see the same artifacts are cleaned up by tools/objtool/Makefile:
> > >
> > > https://github.com/torvalds/linux/blob/v5.0-rc7/tools/objtool/Makefile#L59
> > >
> > >
> > > So, this patch proves the 'clean' target
> > > in tools/objtool/Makefile is useless.
> > >
> >
> > True. I believe this is because kbuild does not descend into that directory
> > as it does with the other directories. It works if you issue 'make clean'
> > from tools or tools/objtool.
>
> Right.  Objtool is intended to be a standalone tool, though it's
> currently a bit kernel-specific.  So a clean target within tools/objtool
> makes sense I think.


Yeah, I remember you mentioned this before.
https://patchwork.kernel.org/patch/9983535/#20996149

Do you mean objtool will be split out from the kernel tree
in the future?

If objtool is useful for other projects in general
(like Sparse), it would be good,
and the top-level Makefile of kernel will add

export OBJTOOL  = /usr/bin/objtool

in case the user may want to install objtool
in a different path.





-- 
Best Regards
Masahiro Yamada
