Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49692 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfLROK6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 09:10:58 -0500
MIME-Version: 1.0
References: <20191217135539.17157-1-info@metux.net>
In-Reply-To: <20191217135539.17157-1-info@metux.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Dec 2019 23:09:59 +0900
Message-ID: <CAK7LNASVmO3i3BVSHHLAE3p10E5+POhBn9m9HpYqG5VeR1_NAw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: package: mkdebian: add missing rsync dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>

On Tue, Dec 17, 2019 at 10:56 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> We've missed the dependency to rsync, so build fails on
> minimal containers.
>
> Fixes: 59b2bd05f5f4 ("kbuild: add 'headers' target to build up uapi headers in usr/include")
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---

Applied to linux-kbuild .Thanks.

>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index e0750b70453f..7c230016b08d 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -174,7 +174,7 @@ Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> -Build-Depends: bc, kmod, cpio, bison, flex | flex:native $extra_build_depends
> +Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
>  Homepage: http://www.kernel.org/
>
>  Package: $packagename
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
