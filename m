Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:30285 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752972AbeGBBY1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Jul 2018 21:24:27 -0400
MIME-Version: 1.0
In-Reply-To: <1df7f847-484c-a368-9dc2-50d191f8be9b@infradead.org>
References: <1df7f847-484c-a368-9dc2-50d191f8be9b@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 2 Jul 2018 10:23:31 +0900
Message-ID: <CAK7LNAQh9jgxTYTUue7j9QjkFmUV-cdLGvMpGhrjivU1km7cWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check for /sbin/depmod installed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Michal Marek <michal.lkml@markovi.net>, Chih-Wei Huang <cwhuang@linux.org.tw>

2018-07-02 2:12 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Verify that 'depmod' ($DEPMOD) is installed.
> This is a partial revert of 620c231c7a7f (from 2012):
>   ("kbuild: do not check for ancient modutils tools")
>
> Fixes kernel bugzilla #198965:
> https://bugzilla.kernel.org/show_bug.cgi?id=198965
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
> Cc: stable@vger.kernel.org # any kernel since 2012
> ---
>  scripts/depmod.sh |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> --- lnx-418-rc2.orig/scripts/depmod.sh
> +++ lnx-418-rc2/scripts/depmod.sh
> @@ -10,10 +10,16 @@ fi
>  DEPMOD=$1
>  KERNELRELEASE=$2
>
> -if ! test -r System.map -a -x "$DEPMOD"; then
> +if ! test -r System.map ; then
>         exit 0
>  fi
>
> +if [ -z $(command -v $DEPMOD) ]; then
> +       echo "'make *install' requires $DEPMOD. Please install it." >&2



I think depmod is required by 'make modules_install'

Is there any reason to make this ambiguous like 'make *install' ?




> +       echo "This is probably in the module-init-tools package." >&2
> +       exit 1
> +fi
> +
>  # older versions of depmod require the version string to start with three
>  # numbers, so we cheat with a symlink here
>  depmod_hack_needed=true
>
>



-- 
Best Regards
Masahiro Yamada
