Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:38111 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbdK3Jbn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 04:31:43 -0500
Received: by mail-it0-f68.google.com with SMTP id r6so7686592itr.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 01:31:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129234442.655-8-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com> <20171129234442.655-8-samitolvanen@google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 30 Nov 2017 09:31:42 +0000
Message-ID: <CAKv+Gu_j7wnJcVmB0sHqiehK-fv4EGV2MXTJM4PTGpMY-P7MVQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: add a workaround for GNU gold with ARM64_MODULE_PLTS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On 29 November 2017 at 23:44, Sami Tolvanen <samitolvanen@google.com> wrote:
> All current versions of GNU gold crash when linking kernel modules
> with ARM64_MODULE_PLTS due to a known bug:
>
>   https://sourceware.org/bugzilla/show_bug.cgi?id=14592
>
> To work around the problem, this change removes NOLOAD from .plt
> and .init.plt.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  arch/arm64/kernel/module.lds | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/module.lds b/arch/arm64/kernel/module.lds
> index f7c9781a9d48..eacb5c67f61e 100644
> --- a/arch/arm64/kernel/module.lds
> +++ b/arch/arm64/kernel/module.lds
> @@ -1,4 +1,4 @@
>  SECTIONS {
> -       .plt (NOLOAD) : { BYTE(0) }
> -       .init.plt (NOLOAD) : { BYTE(0) }
> +       .plt : { BYTE(0) }
> +       .init.plt : { BYTE(0) }
>  }
> --
> 2.15.0.531.g2ccb3012c9-goog
>
