Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:32864 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751041AbcKYLgY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 06:36:24 -0500
Received: by mail-lf0-f48.google.com with SMTP id c13so48495811lfg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Nov 2016 03:36:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161124012703.15704-1-kilobyte@angband.pl>
References: <20161124012703.15704-1-kilobyte@angband.pl>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 25 Nov 2016 13:36:21 +0200
Message-ID: <CAAqcGH=BMxduGp=sVwptTTONGuH-uo6vog=4u0HJDSDNekCShQ@mail.gmail.com>
Subject: Re: [PATCH ping] builddeb: fix cross-building to arm64 producing
 host-arch debs
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 24 November 2016 at 03:27, Adam Borowski <kilobyte@angband.pl> wrote:
> Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
> "aarch64".  Recognizing just the latter should be enough but let's
> accept both in case something regresses again or an user sets
> UTS_MACHINE=arm64.
>
> Regressed in cfa88c7: arm64: Set UTS_MACHINE in the Makefile.
>
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> Acked-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> As 4.9 is not only a LTS, but also the kernel Debian stretch will use,
> fixing this regression would be really nice.

Yes, this would be really appreciated.

Riku

>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 8ea9fd2..3c575cd0 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -51,7 +51,7 @@ set_debarch() {
>                 debarch=hppa ;;
>         mips*)
>                 debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
> -       arm64)
> +       aarch64|arm64)
>                 debarch=arm64 ;;
>         arm*)
>                 if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
> --
> 2.10.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
