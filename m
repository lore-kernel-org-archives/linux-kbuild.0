Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35212 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752892AbcLMI7F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Dec 2016 03:59:05 -0500
Received: by mail-wm0-f47.google.com with SMTP id a197so98993668wmd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Dec 2016 00:59:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481608665-26941-1-git-send-email-maninder1.s@samsung.com>
References: <1481608665-26941-1-git-send-email-maninder1.s@samsung.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 13 Dec 2016 09:58:42 +0100
Message-ID: <CACT4Y+bQLjn23Vdsyq-gZY55RA+=tRYpq3DwHdu5vQLKbNBykA@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: Support for r/w instrumentation control
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, kasan-dev <kasan-dev@googlegroups.com>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, PANKAJ MISHRA <pankaj.m@samsung.com>, Ajeet Kumar Yadav <ajeet.y@samsung.com>, Vaneet narang <v.narang@samsung.com>

On Tue, Dec 13, 2016 at 6:57 AM, Maninder Singh <maninder1.s@samsung.com> wrote:
> This provide option to control sanity of read and write operations
> Both read and write instrumentation increase size of uImage, So using
> this option read or write instrumentation can be avoided if not required.
> Useful in case of module sanity, using this uImage sanity can be avoided.
>
> Also user space ASAN provides this support for read/write instrumentation
> control.
>
> Signed-off-by: Vaneet narang <v.narang@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
> Reviewed-by: Ajeet Yadav <ajeet.y@samsung.com>
> ---
> v1 -> v2: Added Documentation for the same.
>
>  Documentation/dev-tools/kasan.rst | 16 ++++++++++++++++
>  lib/Kconfig.kasan                 | 16 ++++++++++++++++
>  scripts/Makefile.kasan            |  4 ++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index f7a18f2..b8147df 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -40,6 +40,22 @@ similar to the following to the respective kernel Makefile:
>
>      KASAN_SANITIZE := n
>
> +Control Over Read/Write Instrumentation of kernel::

double colon at the end of line

> +
> +- To Disable Read Instrumentation of kernel with:

Strange choice of capital letters.

> +
> +    CONFIG_KASAN_READS = n

Are configs ever set to = n? I can't find any cases in my .config file.
I thought configs are disabled with:

# CONFIG_KASAN_READS is not set

> +
> +Because in some cases we need to check only memory write sanitization
> +for better performance, read instrumentation can be disabled.
> +
> +- To Disable Write Instrumentation of kernel with:

I am not a native speaker but this looks malformed.
I would say either "Disable write instrumentation of kernel with" or
"To disable write instrumentation of kernel set"

> +    CONFIG_KASAN_WRITES = n
> +
> +In case when to instrument only external modules, not the entire kernel
> +for read or write intrumentation or both.
> +

I propose something along these lines:


--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -40,6 +40,14 @@ similar to the following to the respective kernel Makefile:

     KASAN_SANITIZE := n

+Sometimes it may be useful to disable instrumentation of reads, or writes
+or both for the entire kernel. For example, if binary size is a concern,
+it may be useful to disable instrumentation of reads to reduce binary size but
+still catch more harmful bugs on writes. Or, if one is interested only in
+sanitization of a particular module and performance is a concern, she can
+disable instrumentation of both reads and writes for kernel code.
+Instrumentation can be disabled with CONFIG_KASAN_READS and
CONFIG_KASAN_WRITES.
+
 Error reports
