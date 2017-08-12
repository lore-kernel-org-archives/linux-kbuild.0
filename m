Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:45421 "EHLO
        www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdHLLNr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Aug 2017 07:13:47 -0400
Date: Sat, 12 Aug 2017 13:13:41 +0200
From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: make clean all broken with -j? + question regarding modpost
Message-ID: <20170812111341.GA7704@localhost.localdomain>
References: <20170810154251.GA23083@localhost.localdomain>
 <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
 <CA+r1ZhjGfQNO1Z2KR869eP+azB6L+F32ybh-ZuPFSBqFaKLuEg@mail.gmail.com>
 <CAK7LNAS3anskx8+9aWQrg+PKkr4L4AdsdWaha=_uMU5VjKpg5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS3anskx8+9aWQrg+PKkr4L4AdsdWaha=_uMU5VjKpg5A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jim Davis <jim.epost@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Aug 12, 2017 at 12:11:50PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> 
> 2017-08-11 7:11 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
> > On Thu, Aug 10, 2017 at 11:28 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> >> [adding linux-kbuild]
> >>
> >> On 08/10/2017 08:42 AM, Thomas Meyer wrote:
> >>> Hi,
> >>>
> >>> 1.) make with multiple targets
> >>>
> >>> When running
> >>> $ make -j4 clean all
> >>> I get error from make (probably in scripts/Makefile.modbuiltin):
> >
> > With 4.13-rc4 I can get a similar build failure on my Fedora 26 workstation with
> >
> > make allnoconfig; make -j2 clean all
> >
> > /bin/sh: scripts/mod/empty.o: No such file or directory
> > make[2]: *** [scripts/mod/Makefile:24: scripts/mod/elfconfig.h] Error 1
> > make[1]: *** [scripts/Makefile.build:561: scripts/mod] Error 2
> >
> > Here's an ugly workaround for that test case.
> >
> > diff --git a/Makefile b/Makefile
> > index 6eba23bcb5ad..6a1fd24dcf31 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1297,6 +1297,7 @@ MRPROPER_FILES += .config .config.old .version
> > .old_version \
> >
> >  # clean - Delete most, but leave enough to build external modules
> >  #
> > +.NOTPARALLEL: clean
> >  clean: rm-dirs  := $(CLEAN_DIRS)
> >  clean: rm-files := $(CLEAN_FILES)
> >  clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs)
> > Documentation samples)
> >
> 
> 
> If config targets and build targets are given from the command line
> (for example,  "make -j8 defconfig all"
> they are processed one by one.

Hi,

yes, after studying the top level Makefile I also stumbled upon the
__build_one_by_one mechanism.

> 
> Kbuild does not cater to the mixture of clean targets and build targets,
> but I do not know why.

Yes, good question. Two answers I can think of: Either it did work once and
broke or "make -j4 clean all" never worked, but nobody did care about.
Although it is strange to see that the Makefile already have the special case of
"mixed" targets, so somebody did care about at least of some similar special
case.

> 
> I wrote as follows.
> 
> 
> 
> --- a/Makefile
> +++ b/Makefile
> @@ -482,7 +482,8 @@ uapi-asm-generic:
>  version_h := include/generated/uapi/linux/version.h
>  old_version_h := include/linux/version.h
> 
> -no-dot-config-targets := clean mrproper distclean \
> +clean-targets := %clean mrproper cleandocs
> +no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers_% archheaders archscripts \
>                          kernelversion %src-pkg
> @@ -505,6 +506,14 @@ ifeq ($(KBUILD_EXTMOD),)
>                  endif
>          endif
>  endif
> +
> +# For "make -j clean all", "make mrproper defconfig all", etc.
> +ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
> +       ifneq ($(filter-out $(clean-targets),$(MAKECMDGOALS)),)
> +               mixed-targets := 1
> +       endif
> +endif
> +
>  # install and module_install need also be processed one by one
>  ifneq ($(filter install,$(MAKECMDGOALS)),)
>          ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
> 

Yes, above patch does fix the bug and fixes "make -j4 clean all".

with kind regards
thomas
> 
> -- 
> Best Regards
> Masahiro Yamada
