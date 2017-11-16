Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:45024 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933944AbdKPAil (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:38:41 -0500
MIME-Version: 1.0
In-Reply-To: <1510569780-28332-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510569780-28332-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:37:46 +0900
Message-ID: <CAK7LNAQgyiirR7i_JGjZpgQ-fvT8Q23yS0CYgNyFcainfr_Apw@mail.gmail.com>
Subject: Re: [PATCH] frv: .gitignore: ignore vmlinux.lds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-13 19:43 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/frv/kernel/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 arch/frv/kernel/.gitignore
>
> diff --git a/arch/frv/kernel/.gitignore b/arch/frv/kernel/.gitignore
> new file mode 100644
> index 0000000..c5f676c
> --- /dev/null
> +++ b/arch/frv/kernel/.gitignore
> @@ -0,0 +1 @@
> +vmlinux.lds
> --


Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
