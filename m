Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:34868 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932657AbbD1I5e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 04:57:34 -0400
Received: by wgyo15 with SMTP id o15so143364306wgy.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2015 01:57:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1430153019-31596-1-git-send-email-chris.j.arges@canonical.com>
References: <553E4633.8080606@suse.cz>
	<1430153019-31596-1-git-send-email-chris.j.arges@canonical.com>
Date: Tue, 28 Apr 2015 11:57:33 +0300
Message-ID: <CAAqcGHm_WN+E1_EZ52FWfGzbWZX6=7_WRiUv_SU3rU794_mgag@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: parallelize debug module installation
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris J Arges <chris.j.arges@canonical.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, linux-kernel@vger.kernel.org

On 27 April 2015 at 19:43, Chris J Arges <chris.j.arges@canonical.com> wrote:
> When building the dbg package, we use a large 'for module in $(find' loop that
> can be easily parallelized by using 'find | xargs'. This patch modifies this
> loop to use the later paradigm.
>
> In addition, ensure we add '-n1 -P0' to xargs to run as many processes as
> possible.
>
> Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
> ---
>  scripts/package/builddeb | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..538f829 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -152,16 +152,17 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>                 rmdir "$tmpdir/lib/modules/$version"
>         fi
>         if [ -n "$BUILD_DEBUG" ] ; then
> -               for module in $(find $tmpdir/lib/modules/ -name *.ko -printf '%P\n'); do
> -                       module=lib/modules/$module
> -                       mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
> +               find $tmpdir/lib/modules/ -name *.ko -printf '%P\n' | xargs -n1 -P0 -I {} sh -c '

I would go with -P`getconf _NPROCESSORS_ONLN`. There can be thousands
of modules (allmodconfig will make 4500).

> +                       mkdir -p $(dirname '"$dbg_dir"'/usr/lib/debug/lib/modules/$1);'"
>                         # only keep debug symbols in the debug file
> -                       $OBJCOPY --only-keep-debug $tmpdir/$module $dbg_dir/usr/lib/debug/$module
> +                       $OBJCOPY --only-keep-debug $tmpdir/lib/modules/{} \
> +                               $dbg_dir/usr/lib/debug/lib/modules/{};
>                         # strip original module from debug symbols
> -                       $OBJCOPY --strip-debug $tmpdir/$module
> +                       $OBJCOPY --strip-debug $tmpdir/lib/modules/{};
>                         # then add a link to those
> -                       $OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
> -               done
> +                       $OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/lib/modules/{} \
> +                               $tmpdir/lib/modules/{};
> +               " -- {}
>         fi
>  fi
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
