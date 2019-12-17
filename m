Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57920 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfLQBKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 20:10:35 -0500
MIME-Version: 1.0
References: <20191216200719.30479-1-info@metux.net>
In-Reply-To: <20191216200719.30479-1-info@metux.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 10:09:44 +0900
Message-ID: <CAK7LNASxcne9kryTsW2+7TQxuH+tp4Z4OT+1BjUHSE2Cfp_qxA@mail.gmail.com>
Subject: Re: [PATCH] scripts: package: mkdebian: add missing rsync dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org

On Tue, Dec 17, 2019 at 5:08 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> We've missed the dependency to rsync, so build fails on
> minimal containers.

Ah, right.

Did it fail in headers_install?

If so, I will add this tag.

Fixes: 59b2bd05f5f4 ("kbuild: add 'headers' target to build up uapi
headers in usr/include")





> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
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
