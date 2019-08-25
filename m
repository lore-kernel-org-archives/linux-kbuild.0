Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54903 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfHYBfq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Aug 2019 21:35:46 -0400
MIME-Version: 1.0
References: <20190819041807.11433-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190819041807.11433-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Aug 2019 10:34:57 +0900
Message-ID: <CAK7LNAS9UoQYsreSSW4EJ4JtQengZ8VQtUO_PWGZC3O9axiT0A@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore modules.order explicitly
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Aug 19, 2019 at 1:18 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The pattern '*.order' was added by commit c6025f4c8bbe ("kbuild: ignore
> *.order files") to ignore modules.order files.
>
> I do not see any other user of the '.order' extension.
>
> Ignore 'modules.order' explicitly instead of '*.order'.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild.




> ---
>
>  .gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index 2030c7a4d2f8..ce2c6348d372 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -34,7 +34,6 @@
>  *.mod.c
>  *.o
>  *.o.*
> -*.order
>  *.patch
>  *.s
>  *.so
> @@ -46,6 +45,7 @@
>  *.xz
>  Module.symvers
>  modules.builtin
> +modules.order
>
>  #
>  # Top-level generic files
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
