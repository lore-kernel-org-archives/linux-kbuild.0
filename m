Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:37309 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757556AbbFQGef (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Jun 2015 02:34:35 -0400
Received: by wifx6 with SMTP id x6so41252495wif.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2015 23:34:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434421046-4020-1-git-send-email-tytso@mit.edu>
References: <1434421046-4020-1-git-send-email-tytso@mit.edu>
Date: Wed, 17 Jun 2015 09:34:34 +0300
Message-ID: <CAAqcGHkcmFxPtCxnNgdoKyPerZXQSVpQ-FVWz7PU01TF=rzMbA@mail.gmail.com>
Subject: Re: [PATCH] builddeb: sign the modules after splitting out the
 debuginfo files
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On 16 June 2015 at 05:17, Theodore Ts'o <tytso@mit.edu> wrote:
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>

A similar patch is already in Michals tree:

https://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/commit/?h=misc&id=64178cb62c329350fe06622cd215264d849b27b1

Riku

> ---
>  scripts/package/builddeb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..159ec7c 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -163,6 +163,9 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>                         $OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
>                 done
>         fi
> +       if grep -q '^CONFIG_MODULE_SIG=y' $KCONFIG_CONFIG ; then
> +               INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_sign
> +       fi
>  fi
>
>  if [ "$ARCH" != "um" ]; then
> --
> 2.3.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
