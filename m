Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26069 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgDSXA3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Apr 2020 19:00:29 -0400
MIME-Version: 1.0
References: <20200419141850.126507-1-leon@kernel.org> <20200419155506.129392-1-leon@kernel.org>
In-Reply-To: <20200419155506.129392-1-leon@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Apr 2020 07:59:35 +0900
Message-ID: <CAK7LNASdOf0inF_-f8Gn7_mn1QSdXEi1HTR2zj3DEs38sf96xA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] kernel/module: Hide vermagic header file
 from general use
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@mellanox.com>, Borislav Petkov <bp@suse.de>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Networking <netdev@vger.kernel.org>

Hi,

On Mon, Apr 20, 2020 at 12:55 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> From: Leon Romanovsky <leonro@mellanox.com>
>
> VERMAGIC* definitions are not supposed to be used by the drivers,
> see this [1] bug report, so introduce special define to guard inclusion
> of this header file and define it in kernel/modules.h and in internal
> script that generates *.mod.c files.
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
> Acked-by: Jessica Yu <jeyu@kernel.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Leon Romanovsky <leonro@mellanox.com>
> ---


I did not read the full thread of [1],
and perhaps may miss something.

But, this series is trying to solve a different problem
"driver code should not include <linux/vermagic.h>"
isn't it?


IIUC, Borislav reported conflict of MODULE_ARCH_VERMAGIC
if <linux/vermagic.h> is included before <linux/module.h>.

With your cleanups, the include site of <linux/vermagic.h>
will be limited to kernel/module.c and scripts/mod/module.c

Assuming those two files include them in the *correct* order,
this problem will be suppressed.

But, I do not think it addresses the problem properly.


If
  #include <foo.h>
  #include <bar.h>

works, but

  #include <bar.h>
  #include <foo.h>

does not, the root cause is very likely
that <bar.h> is not self-contained.
The problem is solved by including <foo.h> from <bar.h>


Please see my thoughts in this:
https://lore.kernel.org/patchwork/patch/1227024/


Of course, we are solving different issues, so I think
we can merge both.


What do you think?




>  include/linux/vermagic.h | 5 +++++
>  kernel/module.c          | 3 +++
>  scripts/mod/modpost.c    | 1 +
>  3 files changed, 9 insertions(+)
>
> diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> index 9aced11e9000..7768d20ada39 100644
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -1,4 +1,9 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef INCLUDE_VERMAGIC
> +#error "This header can be included from kernel/module.c or *.mod.c only=
"
> +#endif
> +
>  #include <generated/utsrelease.h>
>
>  /* Simply sanity version stamp for modules. */
> diff --git a/kernel/module.c b/kernel/module.c
> index 646f1e2330d2..8833e848b73c 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -4,6 +4,9 @@
>     Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.
>
>  */
> +
> +#define INCLUDE_VERMAGIC
> +
>  #include <linux/export.h>
>  #include <linux/extable.h>
>  #include <linux/moduleloader.h>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5c3c50c5ec52..7f7d4ee7b652 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2251,6 +2251,7 @@ static void add_header(struct buffer *b, struct mod=
ule *mod)
>          * Include build-salt.h after module.h in order to
>          * inherit the definitions.
>          */
> +       buf_printf(b, "#define INCLUDE_VERMAGIC\n");
>         buf_printf(b, "#include <linux/build-salt.h>\n");
>         buf_printf(b, "#include <linux/vermagic.h>\n");
>         buf_printf(b, "#include <linux/compiler.h>\n");
> --
> 2.25.2
>


--
Best Regards
Masahiro Yamada
