Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751475AbdJ3PyT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:54:19 -0400
MIME-Version: 1.0
In-Reply-To: <1509377627-11362-4-git-send-email-yamada.masahiro@socionext.com>
References: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com> <1509377627-11362-4-git-send-email-yamada.masahiro@socionext.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Oct 2017 10:53:57 -0500
Message-ID: <CAL_Jsq+WU=kYLvfTipEUxEa4BL_57TdHhDitqrgftPFzTa=XCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: clean up *.dtb and *.dtb.S patterns from
 top-level Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>

On Mon, Oct 30, 2017 at 10:33 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> We need to add "clean-files" in Makfiles to clean up DT blobs, but we
> often miss to do so.
>
> Since there are no source files that end with .dtb or .dtb.S, so we
> can clean-up those files from the top-level Makefile.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 63a4c0e..c577c63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1544,7 +1544,7 @@ clean: $(clean-dirs)
>         $(call cmd,rmfiles)
>         @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
>                 \( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
> -               -o -name '*.ko.*' \
> +               -o -name '*.ko.*' -o -name '*.dtb' -o -name '*.dtb.S' \

With this we can remove all the occurrences in the kernel:

$ git grep 'clean.*dtb'

Otherwise, the series looks good to me. I'm happy to apply it if the
kbuild folks don't.

Rob
