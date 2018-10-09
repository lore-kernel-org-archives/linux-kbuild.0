Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17677 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeJIWOb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 18:14:31 -0400
MIME-Version: 1.0
References: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Oct 2018 23:56:29 +0900
Message-ID: <CAK7LNAS0oiqBDT73O_O+S4vxU1LRO9UZLh5aJ+Wk+KwXNRojyw@mail.gmail.com>
Subject: Re: [PATCH] samples: disable CONFIG_SAMPLES for UML
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, David Howells <dhowells@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

On Tue, Sep 18, 2018 at 12:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Some samples require headers installation, so commit 3fca1700c4c3
> ("kbuild: make samples really depend on headers_install") added
> such dependency in the top Makefile.  However, UML fails to build
> with CONFIG_SAMPLES=y because UML does not support headers_install.
>
> Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_install")
> Reported-by: Kees Cook <keescook@chromium.org>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

I did not get any more comment.
I applied to linux-kbuild/fixes.



>
>  samples/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/samples/Kconfig b/samples/Kconfig
> index bd133ef..ad1ec701 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -1,5 +1,6 @@
>  menuconfig SAMPLES
>         bool "Sample kernel code"
> +       depends on !UML
>         help
>           You can build and test sample kernel code here.
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
