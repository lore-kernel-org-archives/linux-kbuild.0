Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29381 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdK3MKJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 07:10:09 -0500
MIME-Version: 1.0
In-Reply-To: <CAKwvOdndEfdXuRCeSsr04pAt0d0tE_z72DUYc2Z9LCnXAQc4Hw@mail.gmail.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171129000011.55235-2-samitolvanen@google.com> <CAKwvOdndEfdXuRCeSsr04pAt0d0tE_z72DUYc2Z9LCnXAQc4Hw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 30 Nov 2017 21:09:21 +0900
Message-ID: <CAK7LNATDYV0p8KvA6dL+7or3osNNBBwO2CjUaFz2UV_2iOYADQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: add clang-version.sh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

2017-11-30 2:39 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> +# clang-version [-p] clang-command
> +#
> +# Prints the compiler version of `command' in a canonical 4-digit form
>
> small nit: `command` should be `clang-command`, but its just a comment
> (maybe the maintainer can make that change when/if applying).


I would be happy to fix it up locally if there were no other issue.


> The conditional at the end to see if $with_patchlevel using "x" is
> odd, but this is what scripts/gcc-version.sh does and this patch does
> work as expected.
>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
