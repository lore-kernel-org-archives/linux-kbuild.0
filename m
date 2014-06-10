Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:40990 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbaFJIKC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 04:10:02 -0400
Received: by mail-la0-f41.google.com with SMTP id e16so3793284lan.28
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 01:10:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
References: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
Date: Tue, 10 Jun 2014 11:10:01 +0300
Message-ID: <CAGNsrLBtKRXL7gZqd-P65ycOmK8ipHiDw7=s-Z8S=pFp1=8HMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf architecture
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>

On 9 June 2014 03:21, Ben Hutchings <ben@decadent.org.uk> wrote:
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
> v2: rebased
>
> After discussion with Hector, we agreed this would be a worthwhile
> change.  Hector may later improve this by using gcc specs.
>
> Ben.
>
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..6756ed6 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,16 @@ create_package() {
>         mips*)
>                 debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
>         arm*)
> -               debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
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
> One of the nice things about standards is that there are so many of them.
