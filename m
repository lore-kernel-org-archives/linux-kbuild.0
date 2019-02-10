Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58726 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfBJGvm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Feb 2019 01:51:42 -0500
MIME-Version: 1.0
References: <20190131115820.GF6749@zn.tnic> <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic> <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic> <20190201103648.GF31854@zn.tnic>
 <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
 <20190201151139.GK31854@zn.tnic> <CAK7LNATVeX=6Mmn6A4+EGmZ9OSf=ePwbQWV1m1c=e=_LiebdNQ@mail.gmail.com>
 <20190202144227.GC27822@zn.tnic> <20190206104729.GC7314@zn.tnic>
In-Reply-To: <20190206104729.GC7314@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 10 Feb 2019 15:51:01 +0900
Message-ID: <CAK7LNAT+GhbEwP7v7NWd2kqW76qbXM1mtKhc21YXkp7BUJjzKQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Feb 6, 2019 at 7:49 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Sat, Feb 02, 2019 at 03:42:27PM +0100, Borislav Petkov wrote:
> > On Sat, Feb 02, 2019 at 10:48:00PM +0900, Masahiro Yamada wrote:
> > > '?=' is the same as '=' here.
> >
> > Sure but if the slowdown disappears, then make does something else for
> > '?=' apparently vs for '='.

'=' and '?=' are the same in the sense that
the right-hand side is evaluated when it is used.


> Ok, let me ask a different question then: would a separate target which
> will be used to generate only clean asm for debugging purposes ala
>
> make <path-to-file>.asm

Sorry, I do not like to duplicate the code.



I do not understand why you need to test such complicated
compiler flags in order to negate CONFIG_DEBUG_INFO.


I am still wondering,
but if this is really worth doing in upstream code,
I think the following is a simpler idea.




diff --git a/Makefile b/Makefile
index 3142e67..131164a 100644
--- a/Makefile
+++ b/Makefile
@@ -729,25 +729,28 @@ KBUILD_CFLAGS     += -fomit-frame-pointer
 endif
 endif

-KBUILD_CFLAGS   += $(call cc-option, -fno-var-tracking-assignments)
+DEBUG_CFLAGS    := $(call cc-option, -fno-var-tracking-assignments)

 ifdef CONFIG_DEBUG_INFO
 ifdef CONFIG_DEBUG_INFO_SPLIT
-KBUILD_CFLAGS   += $(call cc-option, -gsplit-dwarf, -g)
+DEBUG_CFLAGS    += $(call cc-option, -gsplit-dwarf, -g)
 else
-KBUILD_CFLAGS  += -g
+DEBUG_CFLAGS   += -g
 endif
 KBUILD_AFLAGS  += -Wa,-gdwarf-2
 endif
 ifdef CONFIG_DEBUG_INFO_DWARF4
-KBUILD_CFLAGS  += $(call cc-option, -gdwarf-4,)
+DEBUG_CFLAGS   += $(call cc-option, -gdwarf-4,)
 endif

 ifdef CONFIG_DEBUG_INFO_REDUCED
-KBUILD_CFLAGS  += $(call cc-option, -femit-struct-debug-baseonly) \
+DEBUG_CFLAGS   += $(call cc-option, -femit-struct-debug-baseonly) \
                   $(call cc-option,-fno-var-tracking)
 endif

+KBUILD_CFLAGS += $(DEBUG_CFLAGS)
+export DEBUG_CFLAGS
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
   # gcc 5 supports generating the mcount tables directly

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index fd03d60..bc8e0ae 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -104,7 +104,7 @@ modkern_cflags =                                          \
 quiet_modtag = $(if $(part-of-module),[M],   )

 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
-cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
+cmd_cc_s_c = $(CC) $(filter-out $(DEBUG_CFLAGS), $(c_flags))
$(DISABLE_LTO) -fverbose-asm -S -o $@ $<

 $(obj)/%.s: $(src)/%.c FORCE
        $(call if_changed_dep,cc_s_c)




> or so be an acceptable approach?
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.

--
Best Regards
Masahiro Yamada
