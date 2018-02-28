Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44718 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752450AbeB1PFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 10:05:14 -0500
MIME-Version: 1.0
In-Reply-To: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
References: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Mar 2018 00:04:18 +0900
Message-ID: <CAK7LNATafNCOBMsNezrCT8j_N2kJiLt7S063wRtjGsaJTgxLvA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Update ncurses package names for menuconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Prasanna <arvindprasanna@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-28 15:59 GMT+09:00 Arvind Prasanna <arvindprasanna@gmail.com>:
> The package name is ncurses-devel for Redhat based distros
> and libncurses-devel for Debian based distros.
>
> Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
> ---
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index a10bd9d..4353e40 100755
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -55,7 +55,8 @@ EOF
>             echo " *** required header files."                            1>&2
>             echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
>             echo " *** "                                                  1>&2
> -           echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
> +           echo " *** Install ncurses (ncurses-devel or libncurses-dev   1>&2
> +                  *** depending on your distribution) and try again."    1>&2
>             echo " *** "                                                  1>&2
>             exit 1
>         fi
> --
> 2.7.4


'echo' is missing in the line you added.
So, the error message will be displayed like follows:



 *** Unable to find the ncurses libraries or the
 *** required header files.
 *** 'make menuconfig' requires the ncurses libraries.
 ***
 *** Install ncurses (ncurses-devel or libncurses-dev   1>&2
           *** depending on your distribution) and try again.
 ***




I fixed it up locally, and applied to linux-kbuild/kconfig.
Thanks!





> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
