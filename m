Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57118 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbeHaUc4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 16:32:56 -0400
MIME-Version: 1.0
In-Reply-To: <07334982-98f0-561e-f8a1-ba42e36da80e@infradead.org>
References: <07334982-98f0-561e-f8a1-ba42e36da80e@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Sep 2018 01:23:35 +0900
Message-ID: <CAK7LNASetukWY0fV8zu06ECfwcdm7_u0xVVxA=Q0W0VM91hmug@mail.gmail.com>
Subject: Re: [PATCH v4] modules_install: make missing $DEPMOD a Warning
 instead of an Error
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, stable <stable@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>

2018-08-29 4:59 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> When $DEPMOD is not found, only print a warning instead of exiting
> with an error message and error status:
>
> Warning: 'make modules_install' requires /sbin/depmod. Please install it.
> This is probably in the kmod package.
>
> Change the Error to a Warning because "not all build hosts for cross
> compiling Linux are Linux systems and are able to provide a working
> port of depmod, especially at the file patch /sbin/depmod."
>
> I.e., "make modules_install" may be used to copy/install the
> loadable modules files to a target directory on a build system and
> then transferred to an embedded device where /sbin/depmod is run
> instead of it being run on the build system.
>
> Fixes: 934193a654c1 ("kbuild: verify that $DEPMOD is installed")
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: stable@vger.kernel.org
> Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
> Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Jessica Yu <jeyu@kernel.org>
> Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> ---


Applied to linux-kbuild/fixes.  Thanks!


> v2: add missing "exit 0" and update the commit message (no Error).
> v3: add Fixes: and Cc: stable
> v4: add Reported-by: and more explanation for the patch.
>
>  scripts/depmod.sh |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- lnx-418.orig/scripts/depmod.sh
> +++ lnx-418/scripts/depmod.sh
> @@ -15,9 +15,9 @@ if ! test -r System.map ; then
>  fi
>
>  if [ -z $(command -v $DEPMOD) ]; then
> -       echo "'make modules_install' requires $DEPMOD. Please install it." >&2
> +       echo "Warning: 'make modules_install' requires $DEPMOD. Please install it." >&2
>         echo "This is probably in the kmod package." >&2
> -       exit 1
> +       exit 0
>  fi
>
>  # older versions of depmod require the version string to start with three
>
>



-- 
Best Regards
Masahiro Yamada
