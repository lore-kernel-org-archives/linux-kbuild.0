Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26127 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfEIOJC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 10:09:02 -0400
MIME-Version: 1.0
References: <1557146820-13059-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1557146820-13059-1-git-send-email-krzk@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 May 2019 23:08:11 +0900
Message-ID: <CAK7LNATFKHmgi+7LktGJg9FRJr3BoZb=r+OdPE4rf=q1WE0j3g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: kbuild: Add pattern for scripts/*vmlinux*
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, May 6, 2019 at 9:47 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> scripts/link-vmlinux.sh is part of kbuild so extend the pattern to match
> any vmlinux related scripts.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to linux-kbuild.

Thanks.


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c61c49dd3643..aa0a61c7736b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8523,6 +8523,7 @@ F:        scripts/Kbuild*
>  F:     scripts/Makefile*
>  F:     scripts/basic/
>  F:     scripts/mk*
> +F:     scripts/*vmlinux*
>  F:     scripts/mod/
>  F:     scripts/package/
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
