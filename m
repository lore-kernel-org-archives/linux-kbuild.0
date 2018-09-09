Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:22569 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbeIILp4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Sep 2018 07:45:56 -0400
MIME-Version: 1.0
In-Reply-To: <dde798fd-9fef-6ac0-a3bc-6aa7193c5d89@infradead.org>
References: <dde798fd-9fef-6ac0-a3bc-6aa7193c5d89@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 9 Sep 2018 15:56:26 +0900
Message-ID: <CAK7LNAQRru9+9_EtNJAgYx-84R7qGt7hNuDqmta5Uk2dJo7CvQ@mail.gmail.com>
Subject: Re: [PATCH v2] modules_install: warn when missing System.map file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-09-07 8:37 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> If there is no System.map file for "make modules_install",
> scripts/depmod.sh will silently exit with success, having done
> nothing.  Since this is an unexpected situation, change it to
> report a Warning for the missing file.  The behavior is not
> changed except for the Warning message.
>
> The (previous) silent success and new Warning can be reproduced
> by:
> $ make mrproper; make defconfig
> $ make modules; make modules_install
>
> and since System.map is produced by "make vmlinux", the steps
> above omit producing the System.map file.
>
> Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: add Yamada-san's suggestions for >&2 and Skipping depmod.


Applied to linux-kbuild/fixes. Thanks!


>  scripts/depmod.sh |    1 +
>  1 file changed, 1 insertion(+)
>
> --- lnx-419-rc1.orig/scripts/depmod.sh
> +++ lnx-419-rc1/scripts/depmod.sh
> @@ -11,6 +11,7 @@ DEPMOD=$1
>  KERNELRELEASE=$2
>
>  if ! test -r System.map ; then
> +       echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
>         exit 0
>  fi
>
>



-- 
Best Regards
Masahiro Yamada
