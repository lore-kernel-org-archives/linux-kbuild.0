Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef008-v.nifty.com ([210.131.4.245]:44549 "EHLO
        condef008-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbcJTHAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 03:00:48 -0400
MIME-Version: 1.0
In-Reply-To: <1476920573-14384-2-git-send-email-nicolas.pitre@linaro.org>
References: <1476920573-14384-1-git-send-email-nicolas.pitre@linaro.org> <1476920573-14384-2-git-send-email-nicolas.pitre@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 20 Oct 2016 15:53:28 +0900
Message-ID: <CAK7LNAQ3UCFXOsCU6t_RJfe4Suxz3BmJGaBw7fMTy=z8JoJ2Bw@mail.gmail.com>
Subject: Re: [PATCH 1/4] kconfig: introduce the "imply" keyword
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Yann E MORIN <yann.morin.1998@free.fr>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, netdev@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2016-10-20 8:42 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 069fcb3eef..c96127f648 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -113,6 +113,33 @@ applicable everywhere (see syntax).
>         That will limit the usefulness but on the other hand avoid
>         the illegal configurations all over.
>
> +- weak reverse dependencies: "imply" <symbol> ["if" <expr>]
> +  This is similar to "select" as it enforces a lower limit on another
> +  symbol except that the "implied" config symbol's value may still be
> +  set to n from a direct dependency or with a visible prompt.
> +  Given the following example:
> +
> +  config FOO
> +       tristate
> +       imply BAZ
> +
> +  config BAZ
> +       tristate
> +       depends on BAr


s/BAr/BAR/  ?





-- 
Best Regards
Masahiro Yamada
