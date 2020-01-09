Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48787 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731362AbgAIQgJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:36:09 -0500
MIME-Version: 1.0
References: <20200109161724.9546-1-brgl@bgdev.pl>
In-Reply-To: <20200109161724.9546-1-brgl@bgdev.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2020 01:35:18 +0900
Message-ID: <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: ignore temporary generated files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Fri, Jan 10, 2020 at 1:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> If building gconfig fails, a temporary gtk config file is left in the
> kconfig directory and is not ignored by git. Add an appropriate pattern
> to .gitignore.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  scripts/kconfig/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> index b5bf92f66d11..d22e6753397d 100644
> --- a/scripts/kconfig/.gitignore
> +++ b/scripts/kconfig/.gitignore
> @@ -3,6 +3,7 @@
>  #
>  *.moc
>  *conf-cfg
> +*conf-cfg.tmp

I have no idea in which situation this pattern is left.

Could you tell me the way to reproduce it?


>
>  #
>  # configuration programs
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
