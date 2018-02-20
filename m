Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37623 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750871AbeBTJRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 04:17:07 -0500
MIME-Version: 1.0
In-Reply-To: <20180216214117.1947175-4-arnd@arndb.de>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-4-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 18:16:17 +0900
Message-ID: <CAK7LNAQVSVtXzWXjLRAQXynSvHHbiF1xYLhjLBwPfFOpnX_NRA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kconfig: add a default allrandom.config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> Building randconfig kernels frequently leads to build errors from
> drivers that have additional build dependencies, or that we don't
> want to build for compile-testing for some other reason.

Can you fix the former case?

The latter seems OK.


> We already have a couple of compile-time options that can deal with this
> problem, but the complete set is not documented well.  We also have a
> method to override some options during 'make randconfig' and a couple
> of other make targets. However, we don't yet combine those two.


From this statement,

kernel/configs/compile_test.config

would make more sense?




> This adds a new allrandom.config file to turn on CONFIG_COMPILE_TEST,
> CONFIG_STANDALONE and CONFIG_PREVENT_FIRMWARE_BUILD for all randconfig
> builds. This in turn disables some other options that we already try
> to avoid in 'allmodconfig' builds and that make no sense in a general
> randconfig build.
>
> Building with 'make randconfig KCONFIG_ALLCONFIG=1' should now always


Can you type 'make randconfig compile_test.config', instead?

(Or 'make allmodconfig compile_test.config' for full-build test)


The merge_config has a little bit different logic
from KCONFIG_ALLCONFIG=1, but I guess it leads to the almost same result.



> succeed without warnings on x86 and arm64, aside from recent regressions.
> Other architectures probably need additional bugfixes.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/configs/allrandom.config | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 kernel/configs/allrandom.config
>
> diff --git a/kernel/configs/allrandom.config b/kernel/configs/allrandom.config
> new file mode 100644
> index 000000000000..67294ef2e3a2
> --- /dev/null
> +++ b/kernel/configs/allrandom.config
> @@ -0,0 +1,6 @@
> +# maximize search space, disable options not worth testing
> +CONFIG_COMPILE_TEST=y
> +
> +# reduce compile-time dependencies
> +CONFIG_STANDALONE=y
> +CONFIG_PREVENT_FIRMWARE_BUILD=y
> --
> 2.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
