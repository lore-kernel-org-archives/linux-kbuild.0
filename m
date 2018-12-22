Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-08.nifty.com ([202.248.20.73]:40934 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbeLVQ7u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Dec 2018 11:59:50 -0500
MIME-Version: 1.0
References: <1545361961-31990-1-git-send-email-yamada.masahiro@socionext.com> <1545361961-31990-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545361961-31990-3-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 22 Dec 2018 18:09:07 +0900
Message-ID: <CAK7LNATnbbmffjZ5ZVD5q9Xag0Hk143jKpywHjdO8w8xNOoM6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] firmware: rewrite Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 21, 2018 at 5:43 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Clean up the Makefile. Equivalent *.gen.S files are produced.
>
>  - Use filechk to remove ugly wordsize_deps
>
>  - Get FWNAME, FWSTR, ASM_WORD, ASM_ALIGN, and PROGBITS out of the
>    recipe for readability
>
>  - Move mkdir into the recipe
>
>  - Clean up generated directories by 'make clean'
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

> -targets := $(patsubst $(obj)/%,%, \
> -                                $(shell find $(obj) -name \*.gen.S 2>/dev/null))
> +targets := $(shell cd $(obj) && find * -name '*.gen.S')
> +clean-dirs := $(shell cd $(obj) && find * -maxdepth 0 -type d)

This 'find' emits a warning for out-of-tree build.
So, I will get it back to the original code.


-- 
Best Regards
Masahiro Yamada
