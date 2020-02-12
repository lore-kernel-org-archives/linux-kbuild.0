Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51212 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLQBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 11:01:19 -0500
MIME-Version: 1.0
References: <20200210200634.950-1-masahiroy@kernel.org>
In-Reply-To: <20200210200634.950-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Feb 2020 01:00:30 +0900
Message-ID: <CAK7LNASYsNcdL8L_do7McOKf1sJJRvBbMS_wQeU-HefYJnfU3Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix mismatch between .version and include/generated/compile.h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Feb 11, 2020 at 5:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 56d589361572 ("kbuild: do not create orphan built-in.a or
> obj-y objects"), scripts/link-vmlinux.sh does nothing when descending
> into init/.
>
> Once the version number becomes out of sync between .version and
> include/generated/compile.h, it is not self-healing.
>
> [How to reproduce]
>
>  $ echo 100 > .version
>  $ make
>
> You will see the number in the .version is always bigger than that in
> compile.h by one. After this, every time you run 'make', the vmlinux is
> re-linked even when none of source files is updated.
>
> Fixes: 56d589361572 ("kbuild: do not create orphan built-in.a or obj-y objects")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied.


>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 1919c311c149..dd484e92752e 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -239,7 +239,7 @@ else
>  fi;
>
>  # final build of init/
> -${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
> +${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
>
>  #link vmlinux.o
>  info LD vmlinux.o
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
