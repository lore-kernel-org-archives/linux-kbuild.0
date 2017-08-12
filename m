Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19385 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751944AbdHLDMi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Aug 2017 23:12:38 -0400
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhjGfQNO1Z2KR869eP+azB6L+F32ybh-ZuPFSBqFaKLuEg@mail.gmail.com>
References: <20170810154251.GA23083@localhost.localdomain> <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
 <CA+r1ZhjGfQNO1Z2KR869eP+azB6L+F32ybh-ZuPFSBqFaKLuEg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Aug 2017 12:11:50 +0900
Message-ID: <CAK7LNAS3anskx8+9aWQrg+PKkr4L4AdsdWaha=_uMU5VjKpg5A@mail.gmail.com>
Subject: Re: make clean all broken with -j? + question regarding modpost
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Thomas Meyer <thomas@m3y3r.de>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi.


2017-08-11 7:11 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
> On Thu, Aug 10, 2017 at 11:28 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> [adding linux-kbuild]
>>
>> On 08/10/2017 08:42 AM, Thomas Meyer wrote:
>>> Hi,
>>>
>>> 1.) make with multiple targets
>>>
>>> When running
>>> $ make -j4 clean all
>>> I get error from make (probably in scripts/Makefile.modbuiltin):
>
> With 4.13-rc4 I can get a similar build failure on my Fedora 26 workstation with
>
> make allnoconfig; make -j2 clean all
>
> /bin/sh: scripts/mod/empty.o: No such file or directory
> make[2]: *** [scripts/mod/Makefile:24: scripts/mod/elfconfig.h] Error 1
> make[1]: *** [scripts/Makefile.build:561: scripts/mod] Error 2
>
> Here's an ugly workaround for that test case.
>
> diff --git a/Makefile b/Makefile
> index 6eba23bcb5ad..6a1fd24dcf31 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1297,6 +1297,7 @@ MRPROPER_FILES += .config .config.old .version
> .old_version \
>
>  # clean - Delete most, but leave enough to build external modules
>  #
> +.NOTPARALLEL: clean
>  clean: rm-dirs  := $(CLEAN_DIRS)
>  clean: rm-files := $(CLEAN_FILES)
>  clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs)
> Documentation samples)
>


If config targets and build targets are given from the command line
(for example,  "make -j8 defconfig all"
they are processed one by one.

Kbuild does not cater to the mixture of clean targets and build targets,
but I do not know why.

I wrote as follows.



--- a/Makefile
+++ b/Makefile
@@ -482,7 +482,8 @@ uapi-asm-generic:
 version_h := include/generated/uapi/linux/version.h
 old_version_h := include/linux/version.h

-no-dot-config-targets := clean mrproper distclean \
+clean-targets := %clean mrproper cleandocs
+no-dot-config-targets := $(clean-targets) \
                         cscope gtags TAGS tags help% %docs check% coccicheck \
                         $(version_h) headers_% archheaders archscripts \
                         kernelversion %src-pkg
@@ -505,6 +506,14 @@ ifeq ($(KBUILD_EXTMOD),)
                 endif
         endif
 endif
+
+# For "make -j clean all", "make mrproper defconfig all", etc.
+ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
+       ifneq ($(filter-out $(clean-targets),$(MAKECMDGOALS)),)
+               mixed-targets := 1
+       endif
+endif
+
 # install and module_install need also be processed one by one
 ifneq ($(filter install,$(MAKECMDGOALS)),)
         ifneq ($(filter modules_install,$(MAKECMDGOALS)),)








-- 
Best Regards
Masahiro Yamada
