Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:51150 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752293Ab3JGPBz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Oct 2013 11:01:55 -0400
Received: by mail-la0-f52.google.com with SMTP id ev20so5597151lab.39
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2013 08:01:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
References: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
Date: Mon, 7 Oct 2013 18:01:52 +0300
Message-ID: <CAGNsrLCWnS_DDm3GonPx9c9Pv2Qv9s6SLE=i=8vNyy7xYCuh-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] deb-pkg: Add automatic support for armhf architecture
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, debian-arm@lists.debian.org

On 6 October 2013 20:04, Ben Hutchings <ben@decadent.org.uk> wrote:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Acked-by: Fathi Boudra <fathi.boudra@linaro.org>

> ---
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 90e521f..e14c56e 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,16 @@ create_package() {
>         mips*)
>                 debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el) ;;
>         arm*)
> -               debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el) ;;
> +               if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
> +                   if grep -q CONFIG_VFP=y $KCONFIG_CONFIG; then
> +                       debarch=armhf
> +                   else
> +                       debarch=armel
> +                   fi
> +               else
> +                   debarch=arm
> +               fi
> +               ;;
>         *)
>                 echo "" >&2
>                 echo "** ** **  WARNING  ** ** **" >&2
>
>
> --
> Ben Hutchings
> Who are all these weirdos? - David Bowie, reading IRC for the first time
