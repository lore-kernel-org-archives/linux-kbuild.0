Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62348 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfB1W3g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Feb 2019 17:29:36 -0500
Date: Thu, 28 Feb 2019 16:29:17 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: remove generated files with make clean
Message-ID: <20190228222917.5unhtr4gxa7rcfwv@treble>
References: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
 <CAK7LNAS3a8u+khVim4bOOSi=QBHnEE35nEp=kfFCB5FYXkeG-A@mail.gmail.com>
 <f27a1ca8-a35f-00f2-a6d5-88cdb2cdd7d3@meijboom.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f27a1ca8-a35f-00f2-a6d5-88cdb2cdd7d3@meijboom.info>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robin Meijboom <robin@meijboom.info>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>

On Thu, Feb 28, 2019 at 09:12:19PM +0100, Robin Meijboom wrote:
> Hi Masahiro,
> 
> On 28-02-19 14:36, Masahiro Yamada wrote:
> > On Fri, Feb 15, 2019 at 11:15 AM Robin Meijboom <robin@meijboom.info> wrote:
> >>
> >> Make clean currently does not remove the generated files for objtool:
> >> tools/objtool/objtool, tools/objtool/fixdep, and
> >> tools/objtool/arch/x86/lib/inat-tables.c.
> >>
> >> Clean these files up as part of make clean.
> >>
> >> Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
> >> bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).
> >>
> >> Signed-off-by: Robin Meijboom <robin@meijboom.info>
> >> ---
> >> In the discussions I didn't find a reason for keeping the files, so I
> >> assume it is an oversight. Otherwise I would have expected them to be
> >> removed at least by make distconfig (which they are not).
> >>
> >> Tested by compiling, cleaning, compiling again, and booting on x86_64.
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 141653226f3c..81a8149a805f 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES
> >>
> >>   # Directories & files removed with 'make clean'
> >>   CLEAN_DIRS  += $(MODVERDIR) include/ksym
> >> +CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
> >> +           tools/objtool/arch/$(ARCH)/lib/inat-tables.c
> >>
> >>   # Directories & files removed with 'make mrproper'
> >>   MRPROPER_DIRS  += include/config usr/include include/generated          \
> >>
> > 
> > 
> > 
> > I see the same artifacts are cleaned up by tools/objtool/Makefile:
> > 
> > https://github.com/torvalds/linux/blob/v5.0-rc7/tools/objtool/Makefile#L59
> > 
> > 
> > So, this patch proves the 'clean' target
> > in tools/objtool/Makefile is useless.
> > 
> 
> True. I believe this is because kbuild does not descend into that directory
> as it does with the other directories. It works if you issue 'make clean'
> from tools or tools/objtool.

Right.  Objtool is intended to be a standalone tool, though it's
currently a bit kernel-specific.  So a clean target within tools/objtool
makes sense I think.

> > BTW, 'make clean' must keep all the generated files
> > that are needed to compile external modules.
> > 
> > I guess cleaning objtool is wrong.
> 
> I was considering the same. However, I did not find this in the discussions,
> and as you pointed out the authors have included these items under the
> 'make clean' target in tools/objtool/Makefile (which does not work for the
> above reason).
> 
> Additionally, if cleaning objtool is wrong, I would expect it to be at
> least included in 'make distclean' or 'make mrproper' target (which it is
> not).
> 
> Josh, feel free to comment on the above.

Objtool is needed for module builds, so it should *not* be removed with
'make clean' from the top-level directory.

I guess it makes sense to remove it for mrproper (and by extension,
distclean).  Maybe mrproper could use tools/objtool's clean target
somehow.

-- 
Josh
