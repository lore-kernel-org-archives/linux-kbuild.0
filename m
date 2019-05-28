Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:50687 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfE1Ae0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 20:34:26 -0400
MIME-Version: 1.0
References: <20190527235423.153853-1-tgb.kernel@gmail.com>
In-Reply-To: <20190527235423.153853-1-tgb.kernel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 28 May 2019 09:33:43 +0900
Message-ID: <CAK7LNARj12T2vtBmVcDLoF2Z7G-TiDhXc0JZ7yRqAwMZCo47mQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: tar-pkg: enable communication with jobserver
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Trevor Bourget <tgb.kernel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 28, 2019 at 8:55 AM Trevor Bourget <tgb.kernel@gmail.com> wrote:
>
> The buildtar script might want to invoke a make, so tell the parent
> make to pass the jobserver token pipe to the subcommand by prefixing
> the command with a +.
>
> This addresses the issue seen here:
>
>         /bin/sh ../scripts/package/buildtar tar-pkg
>         make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>
> See https://www.gnu.org/software/make/manual/html_node/Job-Slots.html
> for more information.
>
> Signed-off-by: Trevor Bourget <tgb.kernel@gmail.com>
> ---

Applied to linux-kbuild/fixes. Thanks.

>  scripts/package/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 27b42d5b6c4f..ca7f46b562a4 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -104,7 +104,7 @@ clean-dirs += $(objtree)/snap/
>  # ---------------------------------------------------------------------------
>  tar%pkg: FORCE
>         $(MAKE) -f $(srctree)/Makefile
> -       $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> +       +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
>
>  clean-dirs += $(objtree)/tar-install/
>
> --
> 2.22.0.rc1.257.g3120a18244-goog
>


-- 
Best Regards
Masahiro Yamada
