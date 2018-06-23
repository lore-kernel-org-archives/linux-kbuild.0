Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17376 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbeFWIK6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 04:10:58 -0400
MIME-Version: 1.0
In-Reply-To: <874li0vvii.fsf@turtle.gmx.de>
References: <874li0vvii.fsf@turtle.gmx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Jun 2018 17:10:11 +0900
Message-ID: <CAK7LNARPOqbmhKOOMCZjeLFihs-1Fh7388vLtHzH3X5zz=EKDw@mail.gmail.com>
Subject: Re: [PATCH] stack-protector: Fix test with 32-bit userland and CONFIG_64BIT=y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-06-19 2:45 GMT+09:00 Sven Joachim <svenjoac@gmx.de>:
> When building a 64-bit 4.18-rc1 kernel with a 32-bit userland, I
> noticed that stack protection was silently disabled.  Adding -m64 in
> gcc-x86_64-has-stack-protector.sh fixed that, similar to what has been
> noticed in commit 2a61f4747eea ("stack-protector: test compiler
> capability in Kconfig and drop AUTO mode") for
> gcc-x86_32-has-stack-protector.sh.
>
> Signed-off-by: Sven Joachim <svenjoac@gmx.de>
> ---

Applied to linux-kbuild/fixes.  Thanks!



>  scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_64-has-stack-protector.sh
> index 3755af0cd9f7..75e4e22b986a 100755
> --- a/scripts/gcc-x86_64-has-stack-protector.sh
> +++ b/scripts/gcc-x86_64-has-stack-protector.sh
> @@ -1,4 +1,4 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>
> -echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
> +echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m64 -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
