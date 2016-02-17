Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33928 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030340AbcBQXDf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Feb 2016 18:03:35 -0500
Received: by mail-io0-f180.google.com with SMTP id 9so53581122iom.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Feb 2016 15:03:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160206004438.GA21780@www.outflux.net>
References: <20160206004438.GA21780@www.outflux.net>
Date: Wed, 17 Feb 2016 15:03:35 -0800
Message-ID: <CAGXu5jKOqnAGkpgr0iY47gFYAuJXQnsF5dQO655D00voVkX5UQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: disable Android-specific compiler features
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Feb 5, 2016 at 4:44 PM, Kees Cook <keescook@chromium.org> wrote:
> The Android compilers enable some non-standard features by default. While
> most Android build systems inject the needed "-mno-android" option via
> KCFLAGS, it happens too late (at least on x86_64), since KBUILD_CFLAGS
> gains KCFLAGS after running (and failing) many cc-option tests. (For
> example, the stack-protector tests happen after arch-specific
> KBUILD_CFLAGS are added but before the external KCFLAGS are added.) As
> such, we should notice this option and immediately turn it on as the
> first cc-option test we run.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Michal, is this okay? I'd like to get it into -next soon if possible.

Thanks!

-Kees

> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 6c1a3c247988..126c98b582bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -393,6 +393,10 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                    -Wno-format-security \
>                    -std=gnu89
>
> +# We must turn off the Android-specific compiler options as early as possible
> +# otherwise cc-option calls below may erroneously fail.
> +KBUILD_CFLAGS  += $(call cc-option,-mno-android,)
> +
>  KBUILD_AFLAGS_KERNEL :=
>  KBUILD_CFLAGS_KERNEL :=
>  KBUILD_AFLAGS   := -D__ASSEMBLY__
> --
> 2.6.3
>
>
> --
> Kees Cook
> Chrome OS & Brillo Security



-- 
Kees Cook
Chrome OS & Brillo Security
