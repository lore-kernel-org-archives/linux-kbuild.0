Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63707 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbfIUGbZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 02:31:25 -0400
MIME-Version: 1.0
References: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 21 Sep 2019 15:30:25 +0900
Message-ID: <CAK7LNATHu6M8zKQi4O30Dvijg0zi8Lvxv6EBbWOE+H_s=E6m+Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: binrpm-pkg: Propagate O= to rpmbuild
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jeffrey,

On Sat, Sep 21, 2019 at 4:01 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> If the user specifies O= to indicate a specific output directory for the
> build, rpmbuild does not honor this, and will use its default, which could
> be the user's home directory.  In cases where the user has limited home
> directory space, this could cause the build to outright fail.
>
> In the case of the binrpm-pkg target, redefine the top directory for output
> to be what the user specified in O=, thus the user will find a "rpmbuild"
> subdirectory in that location with all of the RPM artifacts.
>
> This does not apply to rpm-pkg, since we already cannot handle creating
> the source tarball out of tree.
>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>


binrpm-pkg creates intermediate build artifacts in $(objtree)/,
but puts only the final .rpm into ${HOME}/rpmbuild/RPMS/${ARCH}/.

It has worked like that since a long time before
probably in order to respect the default of rpmbuild.


If you change this behavior, it should be consistent.
The 'rpmbuild' should be always located in the kernel tree
instead of the user's home directory.

But, doing so might give impact to other users who
rely on having 'rpmbuild' in the home directory.
I have to hear opinions from others
if this change is desired.

Meanwhile, if you are unhappy with that, one solution is to use RPMOPTS.
RPMOPTS exists to tweak the default behavior.


Thanks.


> ---
>  scripts/Makefile.package | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 56eadcc..aab0711 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -21,7 +21,7 @@ include $(srctree)/scripts/Kbuild.include
>  # - Use /. to avoid tar packing just the symlink
>
>  # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
> -# but the binrpm-pkg target can; for some reason O= gets ignored.
> +# but the binrpm-pkg target can
>
>  # Remove hyphens since they have special meaning in RPM filenames
>  KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
> @@ -33,6 +33,12 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
>                 Kbuild Kconfig COPYING $(wildcard localversion*)
>  MKSPEC     := $(srctree)/scripts/package/mkspec
>
> +RPM_OUTDIR :=
> +ifneq ($(objtree),$(srctree))
> +# Using absolute path as relative path will cause parts of rpmbuild to fail
> +        RPM_OUTDIR := --define "_topdir $(abs_objtree)/rpmbuild"
> +endif
> +
>  quiet_cmd_src_tar = TAR     $(2).tar.gz
>        cmd_src_tar = \
>  if test "$(objtree)" != "$(srctree)"; then \
> @@ -65,8 +71,8 @@ PHONY += binrpm-pkg
>  binrpm-pkg:
>         $(MAKE) -f $(srctree)/Makefile
>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
> -       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
> -               $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
> +       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" $(RPM_OUTDIR) \
> +               --target $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>
>  PHONY += deb-pkg
>  deb-pkg:
> --
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
>


--
Best Regards
Masahiro Yamada
