Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36307 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751774AbbJVK2O (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Oct 2015 06:28:14 -0400
Received: by wicfx6 with SMTP id fx6so128932934wic.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2015 03:28:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1443404080.2517.30.camel@decadent.org.uk>
References: <1443404080.2517.30.camel@decadent.org.uk>
Date: Thu, 22 Oct 2015 13:28:13 +0300
Message-ID: <CAAqcGHnhF1CbaX5j=MedNybM_2hc-31q7w+JDDUFyFFU1URFxw@mail.gmail.com>
Subject: Re: [PATCH v3] deb-pkg: Add automatic support for armhf architecture
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, debian-arm@lists.debian.org, Ian Campbell <ijc@hellion.org.uk>

On 28 September 2015 at 04:34, Ben Hutchings <ben@decadent.org.uk> wrote:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Acked-by: Ian Campbell <ijc@hellion.org.uk>
> Acked-by: Fathi Boudra <fathi.boudra@linaro.org>

Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

> ---
> v2: rebased
> v3: rebased
>
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -52,7 +52,16 @@ set_debarch() {
>         arm64)
>                 debarch=arm64 ;;
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
>                 debarch=$(dpkg --print-architecture)
>                 echo "" >&2
> --
> Ben Hutchings
> All extremists should be taken out and shot.
