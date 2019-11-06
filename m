Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18370 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbfKFCSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:18:06 -0500
MIME-Version: 1.0
References: <20191105150415.13098-1-hi@alyssa.is> <20191105150735.17200-1-hi@alyssa.is>
In-Reply-To: <20191105150735.17200-1-hi@alyssa.is>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Nov 2019 11:17:16 +0900
Message-ID: <CAK7LNARFER=4bVMMB0SCViVMHrd1kQa-MQO2O4jAm_-zFBCXnA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: be more helpful if pkg-config is missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alyssa Ross <hi@alyssa.is>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 6, 2019 at 12:08 AM Alyssa Ross <hi@alyssa.is> wrote:
>
> If ncurses is installed, but at a non-default location, the previous
> error message was not helpful in resolving the situation.  Now it will
> suggest that pkg-config might need to be installed in addition to
> ncurses.
>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>

Applied to linux-kbuild.
Thanks.


> ---
> Apologies -- was a little too hasty in sending v2, and it only
> included the updated message in one of the two files that needed to be
> changed.
>
>  scripts/kconfig/mconf-cfg.sh | 3 +++
>  scripts/kconfig/nconf-cfg.sh | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index c812872d7f9d..aa68ec95620d 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
>  echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
>  echo >&2 "* depending on your distribution)."
>  echo >&2 "*"
> +echo >&2 "* You may also need to install pkg-config to find the"
> +echo >&2 "* ncurses installed in a non-default location."
> +echo >&2 "*"
>  exit 1
> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> index 001559ef0a60..c212255070c0 100755
> --- a/scripts/kconfig/nconf-cfg.sh
> +++ b/scripts/kconfig/nconf-cfg.sh
> @@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
>  echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
>  echo >&2 "* depending on your distribution)."
>  echo >&2 "*"
> +echo >&2 "* You may also need to install pkg-config to find the"
> +echo >&2 "* ncurses installed in a non-default location."
> +echo >&2 "*"
>  exit 1
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
