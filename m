Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33255 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbeHIH3u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 03:29:50 -0400
MIME-Version: 1.0
In-Reply-To: <patch-1.thread-dc1802.git-dc180286abb1.your-ad-here.call-01533563120-ext-8550@work.hours>
References: <cover.thread-dc1802.your-ad-here.call-01533563120-ext-8550@work.hours>
 <patch-1.thread-dc1802.git-dc180286abb1.your-ad-here.call-01533563120-ext-8550@work.hours>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 Aug 2018 14:06:03 +0900
Message-ID: <CAK7LNAQ3O+5C2+sPVey_vX1OtmRQJi-RxUrXh+oxev3720tWxw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: allow alternate src for target's implicit prerequisite
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-08-06 23:37 GMT+09:00 Vasily Gorbik <gor@linux.ibm.com>:
> With kbuild there is no easy way to re-compile source files from another
> directory, which is required for the decompressor on some platforms
> (files like lib/ctype.c, lib/cmdline.c, etc). Writing custom build
> rules for those files is not feasible since original rules are complex
> and kbuild functions and variables are not exposed.
>
> The simplest solution is to reverse include source files either into
> existing files or separate files. That eliminates the need to tackle
> with the kbuild rules, but is ugly.
>
> Here is another solution to that problem, utilizing secondary expansion.
> Build rules are in a form:
> $(obj)/%.o: $(src)/%.c ...
> $(obj)/%.o: $(src)/%.S ...
>
> "src" variable could be changed to cover the need of specifying alternate
> source file directory.
> src := $(if $(SRCDIR_$(@F)),$(SRCDIR_$(@F)),$(src))
>
> So, if there is SRCDIR_<target> set, it will be used, original "src" is
> used otherwise. But that wouldn't work as it is. To be able to utilize
> automatic variables in implicit prerequisite secondary expansion has to
> be used and src value has to be additionally escaped.
>
> Alternate src dir then could be specified in Makefile as:
> obj-y := file1.o file2.o
> SRCDIR_file1.o := file1/src/dir
> SRCDIR_file2.o := file2/src/dir
>
> Which is enough to build $(obj)/file1.o from file1/src/dir/file1.(c|S),
> and $(obj)/file2.o from file2/src/dir/file2.(c|S)


Is this a simple solution compared with existing ones?
Kind of.

However, it is just moving the complexity around
from Makefiles to the core build scripts, after all.


I guess the increase of build time is not too big,
( 1 % or so for the incremental build of allmodconfig)
but I do not like performing the second expansion for every directory
to save some a few Makefiles.



> Secondary expansion has been introduced with make 3.81, which is
> minimal supported version by kbuild itself.
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---
>  scripts/Makefile.build | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 514ed63ff571..97c6ece96cfb 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -70,6 +70,10 @@ $(warning kbuild: Makefile.build is included improperly)
>  endif
>
>  # ===========================================================================
> +# Allow to specify alternate source directory of target's implicit prerequisite
> +# e.g. 'SRCDIR_cmdline.o := lib'


This does not work for single targets.

'make foo/bar/cmdline.o' works,
but 'make foo/bar/cmdline.i' does not.


> +.SECONDEXPANSION:
> +srcdir := $$(if $$(SRCDIR_$$(@F)),$$(SRCDIR_$$(@F)),$(src))
>


-- 
Best Regards
Masahiro Yamada
