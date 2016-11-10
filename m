Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:32898 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752371AbcKJIYl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2016 03:24:41 -0500
Received: by mail-lf0-f41.google.com with SMTP id c13so183350257lfg.0
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2016 00:24:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161104161407.10354-1-kilobyte@angband.pl>
References: <20161104161407.10354-1-kilobyte@angband.pl>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 10 Nov 2016 10:24:39 +0200
Message-ID: <CAAqcGH=zgWkO4LiF5U22v-mpaaY6ZdabkKrkSDtsrkctp2at=Q@mail.gmail.com>
Subject: Re: [PATCH] builddeb: fix cross-building to arm64 producing host-arch debs
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 4 November 2016 at 18:14, Adam Borowski <kilobyte@angband.pl> wrote:
> Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
> "aarch64".

I cross-compile arm64 kernels all the time and they come out as arm64.deb.
What exact command are you using to build your kernel to see host arch.deb?

Riku

> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
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
