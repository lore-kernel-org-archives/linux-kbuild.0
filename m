Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40916 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfCMRmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 13:42:44 -0400
MIME-Version: 1.0
References: <1552024150-9831-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552024150-9831-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Mar 2019 02:42:01 +0900
Message-ID: <CAK7LNASJnjTi5hpOk4_ikB0zdUcP8k8Gyd88or7dBKY8PvPe+g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: source include/config/auto.conf instead of ${KCONFIG_CONFIG}
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Michael Forney <forney@google.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Nicolas Pitre <nicolas.pitre@linaro.org>

On Fri, Mar 8, 2019 at 2:50 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> As commit 423a8155facf ("kbuild: Fix reading of .config in
> link-vmlinux.sh") addressed, some shells fail to perform '.' if
> ${KCONFIG_CONFIG} does not contain a slash at all.
>
> Instead, we can source include/config/auto.conf, which obviously
> contain slashes, and we do not expect its file path overridden by
> a user. Perhaps, the performance might be slightly better since
> unset CONFIG options are stripped from include/config/auto.conf.
>
> scripts/setlocalversion already works this way.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/adjust_autoksyms.sh | 9 +--------
>  scripts/link-vmlinux.sh     | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 6e6d639..84bf6b5 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -39,14 +39,7 @@ case "$KBUILD_VERBOSE" in
>  esac
>
>  # We need access to CONFIG_ symbols
> -case "${KCONFIG_CONFIG}" in
> -*/*)
> -       . "${KCONFIG_CONFIG}"
> -       ;;
> -*)
> -       # Force using a file from the current directory
> -       . "./${KCONFIG_CONFIG}"
> -esac
> +. include/config/auto.conf
>
>  # Generate a new ksym list file with symbols needed by the current
>  # set of modules.
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index bc7f1fc..dc0e8c5 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -171,14 +171,7 @@ if [ "$1" = "clean" ]; then
>  fi
>
>  # We need access to CONFIG_ symbols
> -case "${KCONFIG_CONFIG}" in
> -*/*)
> -       . "${KCONFIG_CONFIG}"
> -       ;;
> -*)
> -       # Force using a file from the current directory
> -       . "./${KCONFIG_CONFIG}"
> -esac
> +. include/config/auto.conf
>
>  # Update version
>  info GEN .version
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
