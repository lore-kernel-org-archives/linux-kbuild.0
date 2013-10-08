Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:62214 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586Ab3JHAXt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Oct 2013 20:23:49 -0400
Received: by mail-lb0-f174.google.com with SMTP id w6so6151225lbh.19
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2013 17:23:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
References: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
Date: Tue, 8 Oct 2013 02:23:48 +0200
Message-ID: <CAODfWeFOB8ciUUTkdFn7_TUELVQC48XCC1oz+aYhZotewDtqzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] deb-pkg: Add automatic support for armhf architecture
From: Hector Oron <hector.oron@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, Debian ARM <debian-arm@lists.debian.org>

Hello,

2013/10/6 Ben Hutchings <ben@decadent.org.uk>:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.

Debian armel userland can be run on any device, so it is suggested to
better rely on toolchain configuration rather than kernel config
symbols.

For arm-gnueabi(hf) toolchain something like:
  $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q soft && echo
"This is armel"
  $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q hard && echo
"This is armhf"
could be checked instead.

Best regards

> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
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



-- 
 Héctor Orón  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . .-.
