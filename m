Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37742 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFTPqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:46:36 -0400
MIME-Version: 1.0
References: <20190614165242.79257-1-natechancellor@gmail.com>
In-Reply-To: <20190614165242.79257-1-natechancellor@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Jun 2019 00:45:29 +0900
Message-ID: <CAK7LNASn9wDnhbP=FAg8tvXyXSQTUqQu_JY-+HqCds5c8Tor8g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wuninitialized
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>

On Sat, Jun 15, 2019 at 1:53 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This helps fine very dodgy behavior through both -Wuninitialized
> (warning that a variable is always uninitialized) and
> -Wsometimes-uninitialized (warning that a variable is sometimes
> uninitialized, like GCC's -Wmaybe-uninitialized). These warnings
> catch things that GCC doesn't such as:
>
> https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
>
> We very much want to catch these so turn this warning on so that CI is
> aware of it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/381
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild.
Thanks!


-- 
Best Regards
Masahiro Yamada
