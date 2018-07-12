Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49831 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbeGLPho (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 11:37:44 -0400
MIME-Version: 1.0
In-Reply-To: <2d0bd4a4-98cb-380e-36c4-e46dc5d53991@molgen.mpg.de>
References: <89f15a49-d18b-6b01-adb7-1385f2844cb6@molgen.mpg.de>
 <557a23f8-8993-d832-3290-37481c37e340@molgen.mpg.de> <2d0bd4a4-98cb-380e-36c4-e46dc5d53991@molgen.mpg.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Jul 2018 00:26:53 +0900
Message-ID: <CAK7LNATB_hR_S4zQQ-jv=NQEnvNfkSPrZ6xbRE8bKNjNO6VTtQ@mail.gmail.com>
Subject: Re: [PATCH v3] tools/build/Build.include: fix # escaping in .cmd
 files for future Make
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zibeon@gmail.com

2018-07-10 23:50 GMT+09:00 Paul Menzel <pmenzel@molgen.mpg.de>:
> Date: Tue, 5 Jun 2018 19:00:22 +0200
>
> In 2016 GNU Make made a backwards incompatible change to the way '#'
> characters were handled in Makefiles when used inside functions or
> macros:
>
> http://git.savannah.gnu.org/cgit/make.git/commit/?id=c6966b323811c37acedff05b57
>
> Due to this change, when attempting to run `make prepare' I get a
> spurious make syntax error:
>
>     /home/earnest/linux/tools/objtool/.fixdep.o.cmd:1: *** missing separator.  Stop.
>
> When inspecting `.fixdep.o.cmd' it includes two lines which use
> unescaped comment characters at the top:
>
>     \# cannot find fixdep (/home/earnest/linux/tools/objtool//fixdep)
>     \# using basic dep data
>
> This is because `tools/build/Build.include' prints these '\#'
> characters:
>
>     printf '\# cannot find fixdep (%s)\n' $(fixdep) > $(dot-target).cmd; \
>     printf '\# using basic dep data\n\n' >> $(dot-target).cmd;           \
>
> This completes commit 9564a8cf (Kbuild: fix # escaping in .cmd files for
> future Make).
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=197847
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---



Applied to linux-kbuild/fixes.  Thanks!


> v2: Add stable@vger.kernel.org
> v3: Add tag PATCH to subject
>
>  tools/build/Build.include | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/build/Build.include b/tools/build/Build.include
> index a4bbb984941d..d9048f145f97 100644
> --- a/tools/build/Build.include
> +++ b/tools/build/Build.include
> @@ -63,8 +63,8 @@ dep-cmd = $(if $(wildcard $(fixdep)),
>             $(fixdep) $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;           \
>             rm -f $(depfile);                                                    \
>             mv -f $(dot-target).tmp $(dot-target).cmd,                           \
> -           printf '\# cannot find fixdep (%s)\n' $(fixdep) > $(dot-target).cmd; \
> -           printf '\# using basic dep data\n\n' >> $(dot-target).cmd;           \
> +           printf '$(pound) cannot find fixdep (%s)\n' $(fixdep) > $(dot-target).cmd; \
> +           printf '$(pound) using basic dep data\n\n' >> $(dot-target).cmd;           \
>             cat $(depfile) >> $(dot-target).cmd;                                 \
>             printf '\n%s\n' 'cmd_$@ := $(make-cmd)' >> $(dot-target).cmd)
>
> --
> 2.16.2
>



-- 
Best Regards
Masahiro Yamada
