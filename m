Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35195 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752955AbcKYMMO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 07:12:14 -0500
Received: by mail-lf0-f43.google.com with SMTP id b14so49262252lfg.2
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Nov 2016 04:12:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161122213434.14788-6-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20161122213434.14788-6-mmarek@suse.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Fri, 25 Nov 2016 14:12:11 +0200
Message-ID: <CAAqcGHmnGFgCjmsjerecy2Jf0YaCThGp5TxS1yNXqGzZnsXLBQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] deb-pkg: Remove the KBUILD_IMAGE workaround
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 22 November 2016 at 23:34, Michal Marek <mmarek@suse.com> wrote:
> The arch Makefile are fixed to set KBUILD_IMAGE to the full patch, so
> the workaround is no longer needed.
>
> Signed-off-by: Michal Marek <mmarek@suse.com>
> ---
Thanks for cleaning this up.

Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

>  scripts/package/builddeb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 8ea9fd2b6573..dab997343f1a 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -143,12 +143,7 @@ else
>         cp System.map "$tmpdir/boot/System.map-$version"
>         cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
>  fi
> -# Not all arches include the boot path in KBUILD_IMAGE
> -if [ -e $KBUILD_IMAGE ]; then
> -       cp $KBUILD_IMAGE "$tmpdir/$installed_image_path"
> -else
> -       cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
> -fi
> +cp "$($MAKE -s image_name)" "$tmpdir/$installed_image_path"
>
>  if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
>         # Only some architectures with OF support have this target
> --
> 2.10.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
