Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63614 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdJEUES (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 16:04:18 -0400
MIME-Version: 1.0
In-Reply-To: <1506342310-21490-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1506342310-21490-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Oct 2017 05:03:26 +0900
Message-ID: <CAK7LNAS2zTEvNRC4Wza-2WnL6nN4QRpsui9uGsK8auD9f25E+Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop unused symverfile in Makefile.modpost
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2017-09-25 21:25 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Since commit 040fcc819, symverfile has been replaced with kernelsymfile
> and modulesymfile.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  scripts/Makefile.modpost | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 16923ba..756d14f 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -97,7 +97,6 @@ vmlinux.o: FORCE
>         $(call cmd,kernel-mod)
>
>  # Declare generated files as targets for modpost
> -$(symverfile):         __modpost ;
>  $(modules:.ko=.mod.c): __modpost ;
>
>

Applied to linux-kbuild/fixes.  Thanks.

-- 
Best Regards
Masahiro Yamada
