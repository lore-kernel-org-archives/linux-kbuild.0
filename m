Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52388 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752686AbdLGPE2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Dec 2017 10:04:28 -0500
MIME-Version: 1.0
In-Reply-To: <1441199479-12576-1-git-send-email-ulfalizer.lkml@gmail.com>
References: <1441199479-12576-1-git-send-email-ulfalizer.lkml@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Dec 2017 00:03:33 +0900
Message-ID: <CAK7LNAQKve7Uha3_3hMNiMP8VMyJz9A7iXKj06MJWC8dxXvkQw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: .PHONY is not a variable, but PHONY is
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ulfalizer.lkml@gmail.com, Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>

Hi Ulf,




2015-09-02 22:11 GMT+09:00  <ulfalizer.lkml@gmail.com>:
> From: Ulf Magnusson <ulfalizer@gmail.com>
>
> .PHONY is a target, not a variable.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 24c9e3d..4835d24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1609,6 +1609,6 @@ endif     # skip-makefile
>  PHONY += FORCE
>  FORCE:
>
> -# Declare the contents of the .PHONY variable as phony.  We keep that
> +# Declare the contents of the PHONY variable as phony.  We keep that
>  # information in a variable so we can use it in if_changed and friends.
>  .PHONY: $(PHONY)
> --


I found this patch by chance.


Can you fix other files in scripts/ as well?

I see the same pattern in

Makefile.build
Makefile.clean
Makefile.modbuiltin
Makefile.modinst
Makefile.modpost
Makefile.modsign

Then, I will apply it quickly.



-- 
Best Regards
Masahiro Yamada
