Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48324 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbfCKRno (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Mar 2019 13:43:44 -0400
MIME-Version: 1.0
References: <20190309154307.23039-1-ar@cs.msu.ru>
In-Reply-To: <20190309154307.23039-1-ar@cs.msu.ru>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Mar 2019 02:43:03 +0900
Message-ID: <CAK7LNAT4sM+pnQyxNVpE2O3ChEirpUq6LjLnvT6xhJ7LuFGKHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] scripts/package/Makefile: put proper config in
 source tarball
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

On Sun, Mar 10, 2019 at 12:44 AM Arseny Maslennikov <ar@cs.msu.ru> wrote:
>
> It is widely known that one can build a kernel without a .config in the
> source tree by setting KCONFIG_CONFIG equal to the actual configuration
> file path.
>
> When making a *-pkg target, make(1) prepares a source tarball and tries
> to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
> failing spectacularly if .config is absent and packing the wrong config
> if it exists.
> Let's fix that by including whatever KCONFIG_CONFIG points to in the
> archive under the traditional name `.config'.
>
> We have to pass --absolute-names to tar, since it seems to trim the
> paths of archive members first and only then consider --transform, which
> breaks KCONFIG_CONFIG=../../some.config, as well as absolute paths.
>
> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>


rpm-pkg will work in a strange way.
(probably snap-pkg too).

rpm package is compiled in $(HOME)/rpmbuild/BUILD.
The source package will contain the .config in the standard location,
but KCONFIG_CONFIG will point to a different path.

Rather, I'd like to stop the build.


quiet_cmd_src_tar = TAR     $(2).tar.gz
      cmd_src_tar = \
if test "$(objtree)" != "$(srctree)"; then \
        echo >&2; \
        echo >&2 "  ERROR:"; \
        echo >&2 "  Building source tarball is not possible outside the"; \
        echo >&2 "  kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
        echo >&2 "  binrpm-pkg or bindeb-pkg target instead."; \
        echo >&2; \
        false; \
fi ; \
if test "$(KCONFIG_CONFIG)" != .config; then \
        echo >&2; \
        echo >&2 "  ERROR:"; \
        echo >&2 "  Please do not override KCONFIG_CONFIG"; \
        echo >&2 "  for source package build"; \
        echo >&2; \
        false; \
fi ; \
$(srctree)/scripts/setlocalversion --save-scmversion; \
tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
rm -f $(objtree)/.scmversion



I am included to do the opposite;
replace KCONFIG_CONFIG with the hard-coded .config

KCONFIG_CONFIG does not work.
It is half-baked at best.



> ---
>  scripts/package/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 2c6de21e5152..134cefee068d 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -27,7 +27,7 @@ KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
>  KBUILD_PKG_ROOTCMD ?="fakeroot -u"
>  export KDEB_SOURCENAME
>  # Include only those top-level files that are needed by make, plus the GPL copy
> -TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
> +TAR_CONTENT := $(KBUILD_ALLDIRS) $(KCONFIG_CONFIG) .scmversion Makefile \
>                 Kbuild Kconfig COPYING $(wildcard localversion*)
>  MKSPEC     := $(srctree)/scripts/package/mkspec
>
> @@ -44,6 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
>  tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +       --absolute-names --transform 's:^$(KCONFIG_CONFIG)$$:.config:S' \
>         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
