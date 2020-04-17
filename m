Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17652 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgDQMIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 08:08:06 -0400
MIME-Version: 1.0
References: <20200415133648.1306956-1-leon@kernel.org> <20200415133648.1306956-5-leon@kernel.org>
In-Reply-To: <20200415133648.1306956-5-leon@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 17 Apr 2020 21:07:10 +0900
Message-ID: <CAK7LNASacDbi-2sQ9uk+37gaU5J6p7YrucyWbzxYP1wQiU+NZA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/4] kernel/module: Hide vermagic header file
 from general use
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@mellanox.com>, Borislav Petkov <bp@suse.de>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Networking <netdev@vger.kernel.org>

On Wed, Apr 15, 2020 at 10:37 PM Leon Romanovsky <leon@kernel.org> wrote:
>
> From: Leon Romanovsky <leonro@mellanox.com>
>
> VERMAGIC* definitions are not supposed to be used by the drivers,
> see this [1] bug report, so simply move this header file to be visible
> to kernel/* and scripts files only.
>
> In-tree module build:
> =E2=9E=9C  kernel git:(vermagic) =E2=9C=97 make clean
> =E2=9E=9C  kernel git:(vermagic) =E2=9C=97 make M=3Ddrivers/infiniband/hw=
/mlx5
> =E2=9E=9C  kernel git:(vermagic) =E2=9C=97 modinfo drivers/infiniband/hw/=
mlx5/mlx5_ib.ko
> filename:       /images/leonro/src/kernel/drivers/infiniband/hw/mlx5/mlx5=
_ib.ko
> <...>
> vermagic:       5.6.0+ SMP mod_unload modversions
>
> Out-of-tree module build:
> =E2=9E=9C  mlx5 make -C /images/leonro/src/kernel clean M=3D/tmp/mlx5
> =E2=9E=9C  mlx5 make -C /images/leonro/src/kernel M=3D/tmp/mlx5
> =E2=9E=9C  mlx5 modinfo /tmp/mlx5/mlx5_ib.ko
> filename:       /tmp/mlx5/mlx5_ib.ko
> <...>
> vermagic:       5.6.0+ SMP mod_unload modversions
>
> [1] https://lore.kernel.org/lkml/20200411155623.GA22175@zn.tnic
> Reported-by: Borislav Petkov <bp@suse.de>
> Acked-by: Borislav Petkov <bp@suse.de>
> Signed-off-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  kernel/module.c                      | 2 +-
>  {include/linux =3D> kernel}/vermagic.h | 0
>  scripts/mod/modpost.c                | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename {include/linux =3D> kernel}/vermagic.h (100%)
>
> diff --git a/kernel/module.c b/kernel/module.c
> index 3447f3b74870..fce06095d341 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -29,7 +29,6 @@
>  #include <linux/moduleparam.h>
>  #include <linux/errno.h>
>  #include <linux/err.h>
> -#include <linux/vermagic.h>
>  #include <linux/notifier.h>
>  #include <linux/sched.h>
>  #include <linux/device.h>
> @@ -55,6 +54,7 @@
>  #include <linux/audit.h>
>  #include <uapi/linux/module.h>
>  #include "module-internal.h"
> +#include "vermagic.h"
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/module.h>
> diff --git a/include/linux/vermagic.h b/kernel/vermagic.h
> similarity index 100%
> rename from include/linux/vermagic.h
> rename to kernel/vermagic.h
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5c3c50c5ec52..91f86261bcfe 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2252,7 +2252,7 @@ static void add_header(struct buffer *b, struct mod=
ule *mod)
>          * inherit the definitions.
>          */
>         buf_printf(b, "#include <linux/build-salt.h>\n");
> -       buf_printf(b, "#include <linux/vermagic.h>\n");
> +       buf_printf(b, "#include <../kernel/vermagic.h>\n");


I hate this.


#error can break the build if the header is included in a wrong way.

For example, include/acpi/platform/aclinux.h



I prefer something like this if a big hammer is needed here.

diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 9aced11e9000..d69fa4661715 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -1,4 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef INCLUDE_VERMAGIC
+#error "This header can be included from kernel/module.c or *.mod.c"
+#endif
+
 #include <generated/utsrelease.h>

 /* Simply sanity version stamp for modules. */
diff --git a/kernel/module.c b/kernel/module.c
index 646f1e2330d2..8833e848b73c 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4,6 +4,9 @@
    Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.

 */
+
+#define INCLUDE_VERMAGIC
+
 #include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5c3c50c5ec52..7f7d4ee7b652 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2251,6 +2251,7 @@ static void add_header(struct buffer *b, struct
module *mod)
         * Include build-salt.h after module.h in order to
         * inherit the definitions.
         */
+       buf_printf(b, "#define INCLUDE_VERMAGIC\n");
        buf_printf(b, "#include <linux/build-salt.h>\n");
        buf_printf(b, "#include <linux/vermagic.h>\n");
        buf_printf(b, "#include <linux/compiler.h>\n");




--=20
Best Regards
Masahiro Yamada
