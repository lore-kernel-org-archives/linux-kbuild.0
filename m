Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47208 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbeF3OUX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Jun 2018 10:20:23 -0400
MIME-Version: 1.0
In-Reply-To: <c2541256-d3de-e0cf-077c-cdb590c3c152@infradead.org>
References: <c2541256-d3de-e0cf-077c-cdb590c3c152@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 30 Jun 2018 23:19:36 +0900
Message-ID: <CAK7LNAS288qs50R=bL0R7mZfw0WhGsda409u6rbZ84PTNM98Rg@mail.gmail.com>
Subject: Re: [PATCH v4] kconfig: check for pkg-config on make {menu,n,g,x}config
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>

2018-06-29 8:39 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Each of 'make {menu,n,g,x}config' uses (needs) pkg-config to make sure
> that other required files are present and to determine build flags
> settings, but none of these check that pkg-config itself is present.
> Add a check for all 4 of these targets and update
> Documentation/process/changes.rst to mention 'pkg-config'.
>
> Fixes kernel bugzilla #77511:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D77511
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
> ---

Applied to linux-kbuild/kconfig.   Thanks!


> v4: apply Masahiro's suggestions
>
> Strictly speaking, pkg-config is not required if someone is only
> using 'make {menu,n}config' since there are fallbacks for those
> two targets.
>
>  Documentation/process/changes.rst  |    8 ++++++++
>  scripts/kconfig/Makefile           |    1 +
>  scripts/kconfig/check-pkgconfig.sh |    8 ++++++++
>  3 files changed, 17 insertions(+)
>
> --- linux-next-20180628.orig/scripts/kconfig/Makefile
> +++ linux-next-20180628/scripts/kconfig/Makefile
> @@ -215,6 +215,7 @@ $(obj)/zconf.tab.o: $(obj)/zconf.lex.c
>
>  # check if necessary packages are available, and configure build flags
>  define filechk_conf_cfg
> +       $(CONFIG_SHELL) $(srctree)/scripts/kconfig/check-pkgconfig.sh; \
>         $(CONFIG_SHELL) $<
>  endef
>
> --- /dev/null
> +++ linux-next-20180628/scripts/kconfig/check-pkgconfig.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Check for pkg-config presence
> +
> +if [ -z $(command -v pkg-config) ]; then
> +       echo "'make *config' requires 'pkg-config'. Please install it." 1=
>&2
> +       exit 1
> +fi
> --- linux-next-20180628.orig/Documentation/process/changes.rst
> +++ linux-next-20180628/Documentation/process/changes.rst
> @@ -81,6 +81,14 @@ The build system has, as of 4.13, switch
>  rather than incremental linking (`ld -r`) for built-in.a intermediate st=
eps.
>  This requires binutils 2.20 or newer.
>
> +pkg-config
> +----------
> +
> +The build system, as of 4.18, requires pkg-config to check for installed
> +kconfig tools and to determine flags settings for use in
> +'make {menu,n,g,x}config'.  Previously pkg-config was being used but not
> +verified or documented.
> +
>  Flex
>  ----
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
