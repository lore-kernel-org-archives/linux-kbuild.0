Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:43009 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfCEF6C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 00:58:02 -0500
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x255vY8a009306
        for <linux-kbuild@vger.kernel.org>; Tue, 5 Mar 2019 14:57:35 +0900
Received: by mail-vk1-f182.google.com with SMTP id v187so1700939vkf.12
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2019 21:57:34 -0800 (PST)
MIME-Version: 1.0
References: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
 <CAK7LNAS3a8u+khVim4bOOSi=QBHnEE35nEp=kfFCB5FYXkeG-A@mail.gmail.com>
 <f27a1ca8-a35f-00f2-a6d5-88cdb2cdd7d3@meijboom.info> <20190228222917.5unhtr4gxa7rcfwv@treble>
 <725bf50f-69dd-5497-100e-33d06250dcb0@meijboom.info>
In-Reply-To: <725bf50f-69dd-5497-100e-33d06250dcb0@meijboom.info>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Mar 2019 14:56:58 +0900
Message-ID: <CAK7LNASWpjGD3v1B3WDQbZgEcJbXu6wLvQvSaOxJN8CfzPR6tw@mail.gmail.com>
Subject: Re: [PATCH] objtool: remove generated files with make clean
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robin Meijboom <robin@meijboom.info>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>

On Tue, Mar 5, 2019 at 7:43 AM Robin Meijboom <robin@meijboom.info> wrote:
>
> On 28-02-19 23:29, Josh Poimboeuf wrote:
> > On Thu, Feb 28, 2019 at 09:12:19PM +0100, Robin Meijboom wrote:
> >> Hi Masahiro,
> >>
> >> On 28-02-19 14:36, Masahiro Yamada wrote:
> >>> On Fri, Feb 15, 2019 at 11:15 AM Robin Meijboom <robin@meijboom.info> wrote:
> >>>>
> >>>> Make clean currently does not remove the generated files for objtool:
> >>>> tools/objtool/objtool, tools/objtool/fixdep, and
> >>>> tools/objtool/arch/x86/lib/inat-tables.c.
> >>>>
> >>>> Clean these files up as part of make clean.
> >>>>
> >>>> Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
> >>>> bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).
> >>>>
> >>>> Signed-off-by: Robin Meijboom <robin@meijboom.info>
> >>>> ---
> >>>> In the discussions I didn't find a reason for keeping the files, so I
> >>>> assume it is an oversight. Otherwise I would have expected them to be
> >>>> removed at least by make distconfig (which they are not).
> >>>>
> >>>> Tested by compiling, cleaning, compiling again, and booting on x86_64.
> >>>>
> >>>> diff --git a/Makefile b/Makefile
> >>>> index 141653226f3c..81a8149a805f 100644
> >>>> --- a/Makefile
> >>>> +++ b/Makefile
> >>>> @@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES
> >>>>
> >>>>   # Directories & files removed with 'make clean'
> >>>>   CLEAN_DIRS  += $(MODVERDIR) include/ksym
> >>>> +CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
> >>>> +           tools/objtool/arch/$(ARCH)/lib/inat-tables.c
> >>>>
> >>>>   # Directories & files removed with 'make mrproper'
> >>>>   MRPROPER_DIRS  += include/config usr/include include/generated          \
> >>>>
> >>>
> >>>
> >>>
>
> Hi Josh,
>
> Thanks for your feedback.
>
> >>> I see the same artifacts are cleaned up by tools/objtool/Makefile:
> >>>
> >>> https://github.com/torvalds/linux/blob/v5.0-rc7/tools/objtool/Makefile#L59
> >>>
> >>>
> >>> So, this patch proves the 'clean' target
> >>> in tools/objtool/Makefile is useless.
> >>>
> >>
> >> True. I believe this is because kbuild does not descend into that directory
> >> as it does with the other directories. It works if you issue 'make clean'
> >> from tools or tools/objtool.
> >
> > Right.  Objtool is intended to be a standalone tool, though it's
> > currently a bit kernel-specific.  So a clean target within tools/objtool
> > makes sense I think.
> >
>
> Clear. Currently objtool is also cleaned by the 'clean' target in
> tools/Makefile. Would the above suggest that should be removed, or is it
> fine as long as it is not in the top-level Makefile?
>
> >>> BTW, 'make clean' must keep all the generated files
> >>> that are needed to compile external modules.
> >>>
> >>> I guess cleaning objtool is wrong.
> >>
> >> I was considering the same. However, I did not find this in the discussions,
> >> and as you pointed out the authors have included these items under the
> >> 'make clean' target in tools/objtool/Makefile (which does not work for the
> >> above reason).
> >>
> >> Additionally, if cleaning objtool is wrong, I would expect it to be at
> >> least included in 'make distclean' or 'make mrproper' target (which it is
> >> not).
> >>
> >> Josh, feel free to comment on the above.
> >
> > Objtool is needed for module builds, so it should *not* be removed with
> > 'make clean' from the top-level directory.
> >
> > I guess it makes sense to remove it for mrproper (and by extension,
> > distclean).  Maybe mrproper could use tools/objtool's clean target
> > somehow.
> >


I agree that cleaning the objtool's artifacts by 'make mrproper'
is the right thing to do.

But, Kbuild does not care under tools/
since we expect standalone tools there,
and the tools build system is completely different stuff, sadly.



> Since we have to use an exception anyway, my initial thought was to
> use the 'standard exception' and include the artifacts in
> MRPROPER_FILES. However, your idea is of course to _not_ have to
> update the top-level Makefile every time you make a change to objtool
> artifacts. I'm thinking about an elegant solution.


The most elegant solution would be
to move tools/objtool to scripts/objtool.

I just posted the series.

https://lore.kernel.org/patchwork/patch/1047807/
https://lore.kernel.org/patchwork/patch/1047808/
https://lore.kernel.org/patchwork/patch/1047809/




-- 
Best Regards
Masahiro Yamada
