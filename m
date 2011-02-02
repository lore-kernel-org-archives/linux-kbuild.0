Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:42012 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1BBJee (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Feb 2011 04:34:34 -0500
Received: by fxm20 with SMTP id 20so7799781fxm.19
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Feb 2011 01:34:33 -0800 (PST)
Message-ID: <4D492525.20402@gmail.com>
Date: Wed, 02 Feb 2011 10:34:29 +0100
From: =?UTF-8?B?Tmljb2xhcyBkZSBQZXNsb8O8YW4=?=
	<nicolas.2p.debian@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
References: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr>
In-Reply-To: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Nikolai Kondrashov <spbnick@gmail.com>, maximilian attems <max@stro.at>

Le 24/01/2011 14:41, Nicolas de Pesloüan a écrit :

Hi Michal,

Any troubles with my patch? I still don't find it in any branchs of 
git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git

It depends on commit 1b9a50d931a04ba007cc1a926fead3ff4b5afa9b, from Maximilian Attems, (in 
for-next), because it changes the same lines in scripts/package/builddeb.

But, as the problem it fixes cause make deb-pkg to fail, it might be pushed to rc-fixes... ?

Do you want me to rebase it on rc-fixes? (This would cause a future merge to fail when applying the 
patch from Maximilian, but...).

	Nicolas.

> When building linux-headers package using deb-pkg, builddeb erroneously assume
> current directory is the source tree. This is not true if building in another
> directory, using make O=... deb-pkg.
>
> This patch fix this problem.
>
> Signed-off-by: Nicolas de Pesloüan<nicolas.2p.debian@free.fr>

Tested-by: Nikolai Kondrashov <spbnick@gmail.com>
Acked-by: maximilian attems <max@stro.at>

> ---
>   scripts/package/builddeb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index ebc6d6e..f6cbc3d 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -238,12 +238,12 @@ EOF
>   fi
>
>   # Build header package
> -find . -name Makefile -o -name Kconfig\* -o -name \*.pl>  /tmp/files$$
> -find arch/$SRCARCH/include include scripts -type f>>  /tmp/files$$
> +(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl>  /tmp/files$$)
> +(cd $srctree; find arch/$SRCARCH/include include scripts -type f>>  /tmp/files$$)
>   (cd $objtree; find .config Module.symvers include scripts -type f>>  /tmp/objfiles$$)
>   destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>   mkdir -p "$destdir"
> -tar -c -f - -T /tmp/files$$ | (cd $destdir; tar -xf -)
> +(cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
>   (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
>   rm -f /tmp/files$$ /tmp/objfiles$$
>   arch=$(dpkg --print-architecture)

