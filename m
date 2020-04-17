Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49844 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbgDQSNy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 14:13:54 -0400
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org>
In-Reply-To: <20200414012132.32721-1-vitor@massaru.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 18 Apr 2020 03:12:41 +0900
Message-ID: <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: ensure mrproper removes arch/$(SUBARCH)/include/generated/
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Shuah Khan <skhan@linuxfoundation.org>

Hi.

On Tue, Apr 14, 2020 at 10:21 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> In the following use case, when compiling the kernel for the UML
> architecture, for example:
>
>  * `make ARCH=um defconfig && make ARCH=um -j8`,
>
> SUBARCH files are generated, however when we run the command:
>
>  * `mrproper ARCH=um`


      make ARCH=um mrproper


> the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
>
> This generates compilation errors by running the following command:
>
>  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um`
>
> This PATCH fix that problem.

  This patch fixes ...

>
> This makes it possible to compile on different architectures that use the
> SUBARCH variable, in different build directories and root directory of the
> linux directory. This is important because we can compile without the object
> files being overwritten. This reduces the re-compilation time in this use case.

Sorry, I do not understand this paragraph.


Brendan Higgins just reported the build error
in the out-of-tree build after in-tree build.


[1] make ARCH=um defconfig all
[2] make ARCH=um mrproper
[3] make ARCH=um O=foo defconfig all

  -> build error

Ins't it?



>
> Besides that, in the workflow of developing unit tests, using kunit, and
> compiling in different architectures to develop or test a PATCH, this use case
> applies.
>
>  * This bug was introduced in this commit a788b2ed81abe


Instead, adding Fixes tag is the convention.

Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
before out-of-tree build")


>
>  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219


Maybe, this can be also a tag.


Link: https://bugzilla.kernel.org/show_bug.cgi?id=205219




>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>


Reported-by: Brendan Higgins <brendanhiggins@google.com>



> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> v2:
>  * Explains what this PATCH does and the importance as suggested
>    by Brendan Higgins.
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 70def4907036..e1a79796032e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -532,7 +532,8 @@ outputmakefile:
>  ifdef building_out_of_srctree
>         $(Q)if [ -f $(srctree)/.config -o \
>                  -d $(srctree)/include/config -o \
> -                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> +                -d $(srctree)/arch/$(SRCARCH)/include/generated -o \
> +                -d $(srctree)/arch/$(SUBARCH)/include/generated ]; then \


This hunk is unneeded.



>                 echo >&2 "***"; \
>                 echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>                 echo >&2 "*** in $(abs_srctree)";\
> @@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_DIRS  += include/config include/generated          \
>                   arch/$(SRCARCH)/include/generated .tmp_objdiff \
> +                 arch/$(SUBARCH)/include/generated \
>                   debian/ snap/ tar-install/
>  MRPROPER_FILES += .config .config.old .version \
>                   Module.symvers \
> --
> 2.25.1
>


This problem is only related to ARCH=um builds.
So, it should be fixed in arch/um/Makefile.




diff --git a/arch/um/Makefile b/arch/um/Makefile
index d2daa206872d..275f5ffdf6f0 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS)
$(LD_FLAGS_CMDLINE)
 # When cleaning we don't include .config, so we don't include
 # TT or skas makefiles and don't clean skas_ptregs.h.
 CLEAN_FILES += linux x.i gmon.out
+MRPROPER_DIRS += arch/$(SUBARCH)/include/generated

 archclean:
        @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \





--
Best Regards
Masahiro Yamada
