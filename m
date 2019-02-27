Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:43806 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbfB0Mja (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 07:39:30 -0500
MIME-Version: 1.0
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
 <1550568787-18710-3-git-send-email-yamada.masahiro@socionext.com> <b7edc974-ab67-44ee-3aaa-8cac3d9bd82b@ideasonboard.com>
In-Reply-To: <b7edc974-ab67-44ee-3aaa-8cac3d9bd82b@ideasonboard.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 27 Feb 2019 21:38:49 +0900
Message-ID: <CAK7LNARD-kVxntRx8hHfRXExafqZsMJp0L8gXpY6gvQZO3m2-w@mail.gmail.com>
Subject: Re: [PATCH 3/5] scripts/gdb: do not descend into scripts/gdb from scripts
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kieran.bingham@ideasonboard.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jan Kiszka <jan.kiszka@siemens.com>

Hi Kieran,

On Wed, Feb 27, 2019 at 8:46 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> On 19/02/2019 09:33, Masahiro Yamada wrote:
> > Currently, Kbuild descends from scripts/Makefile to scripts/gdb/Makefile
> > just for creating symbolic links, but it does not need to do it so early.
> >
> > Merge the two descending paths to simplify the code.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile                   | 2 +-
> >  scripts/Makefile           | 3 +--
> >  scripts/gdb/linux/Makefile | 9 +++------
> >  3 files changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 26dbcb7..a5762c6 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1518,7 +1518,7 @@ $(DOC_TARGETS): scripts_basic FORCE
> >
> >  PHONY += scripts_gdb
> >  scripts_gdb: prepare
> > -     $(Q)$(MAKE) $(build)=scripts/gdb/linux build_constants_py
> > +     $(Q)$(MAKE) $(build)=scripts/gdb
> >
> >  ifdef CONFIG_GDB_SCRIPTS
> >  all: scripts_gdb
> > diff --git a/scripts/Makefile b/scripts/Makefile
> > index feb1f71..9d442ee 100644
> > --- a/scripts/Makefile
> > +++ b/scripts/Makefile
> > @@ -39,7 +39,6 @@ build_unifdef: $(obj)/unifdef
> >  subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
> >  subdir-$(CONFIG_MODVERSIONS) += genksyms
> >  subdir-$(CONFIG_SECURITY_SELINUX) += selinux
> > -subdir-$(CONFIG_GDB_SCRIPTS) += gdb
> >
> >  # Let clean descend into subdirs
> > -subdir-      += basic dtc kconfig mod package
> > +subdir-      += basic dtc gdb kconfig mod package
> > diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
> > index aba23be..7545806 100644
> > --- a/scripts/gdb/linux/Makefile
> > +++ b/scripts/gdb/linux/Makefile
> > @@ -14,11 +14,8 @@ quiet_cmd_gen_constants_py = GEN     $@
> >       $(CPP) -E -x c -P $(c_flags) $< > $@ ;\
> >       sed -i '1,/<!-- end-c-headers -->/d;' $@
> >
> > -targets += constants.py
> > -$(obj)/constants.py: $(SRCTREE)/$(obj)/constants.py.in FORCE
> > +extra-y += constants.py
> > +$(obj)/constants.py: $(src)/constants.py.in FORCE
> >       $(call if_changed_dep,gen_constants_py)
> >
> > -build_constants_py: $(obj)/constants.py
> > -     @:
> > -
> > -clean-files := *.pyc *.pyo $(if $(KBUILD_SRC),*.py) $(obj)/constants.py
> > +clean-files := *.pyc *.pyo $(if $(KBUILD_SRC),*.py)
>
>
> This looks like the generated file will no longer be cleaned on
> distclean, if the build is 'in-tree'... Is that right? Or OK if so?


As you noticed in 5/5, files listed in $(extra-y) are cleaned up.

So, I removed the now redundant $(obj)/constants.py from 'clean-files'.



> Perhaps I'm mis-understanding the "$(if $(KBUILD_SRC),*.py)" statement
> intent?


$(if $(KBUILD_SRC),*.py) will clean *.py only for out-of-tree build.

'*.py' files in the build directory are symbolic links.

'*.py' files in the source directory are check-in source files.



> As long as you're content with the result, and it's understood:
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>



--
Best Regards

Masahiro Yamada
