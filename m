Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38183 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753901AbcLLKF7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 05:05:59 -0500
Received: by mail-wm0-f42.google.com with SMTP id f82so59319351wmf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Dec 2016 02:05:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481535157-24628-1-git-send-email-maninder1.s@samsung.com>
References: <1481535157-24628-1-git-send-email-maninder1.s@samsung.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 12 Dec 2016 11:05:37 +0100
Message-ID: <CACT4Y+aXgQHrLWHmNdHKPef5VBVHE2zBULyi0GNk3z_nvy67ow@mail.gmail.com>
Subject: Re: [PATCH 1/1] kasan: Support for r/w instrumentation control
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, pankaj.m@samsung.com, ajeet.y@samsung.com, Vaneet narang <v.narang@samsung.com>

On Mon, Dec 12, 2016 at 10:32 AM, Maninder Singh
<maninder1.s@samsung.com> wrote:
> This provide option to control sanity of read and write operations
> Both read and write instrumentation increase size of uImage, So using
> this option read or write instrumentation can be avoided if not required.
> Useful in case of module sanity, using this uImage sanity can be avoided.
>
> Also user space ASAN provides this support for read/write instrumentation
> control.

Hi,

Do you actually hit an issue with image size? In what context?
Do you use inline/outline instrumentation? Does switching to the other
option help?
Does it make sense to ever disable writes? I assume that you are
disabling reads, right?
Disabling both certainly does not make sense.


> Signed-off-by: Vaneet narang <v.narang@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
> Reviewed-by: Ajeet Yadav <ajeet.y@samsung.com>
> ---
>  lib/Kconfig.kasan      | 16 ++++++++++++++++
>  scripts/Makefile.kasan |  4 ++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index bd38aab..6f0f774 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -45,6 +45,22 @@ config KASAN_INLINE
>
>  endchoice
>
> +config KASAN_READS
> +               prompt "Read instrumentation"
> +               bool
> +               default y
> +               depends on KASAN
> +               help
> +                       This configuration controls the sanity of  memory read.

/\/\/\

double space in "of  memory"

> +
> +config KASAN_WRITES
> +               prompt "Write instrumentation"
> +               bool
> +               default y
> +               depends on KASAN
> +               help
> +                       This configuration controls the sanity of memory write.
> +
>  config TEST_KASAN
>         tristate "Module for testing kasan for bug detection"
>         depends on m && KASAN
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 37323b0..a61b18e 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -29,3 +29,7 @@ else
>      endif
>  endif
>  endif
> +
> +CFLAGS_KASAN += $(call cc-option, \
> +               $(if $(CONFIG_KASAN_READS),, --param asan-instrument-reads=0) \
> +               $(if $(CONFIG_KASAN_WRITES),, --param asan-instrument-writes=0))
> --
> 1.9.1
>
