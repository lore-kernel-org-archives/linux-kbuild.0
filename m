Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34189 "EHLO
	mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753956AbcCIUu2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Mar 2016 15:50:28 -0500
Received: by mail-io0-f174.google.com with SMTP id m184so81442534iof.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Mar 2016 12:50:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160309090115.GA6964@davidb.org>
References: <20160307000208.1bec3e7dc874489d1b4fcbb4@gmail.com>
	<20160307000427.c82f18670568e1e656fc9532@gmail.com>
	<20160309090115.GA6964@davidb.org>
Date: Wed, 9 Mar 2016 12:50:26 -0800
Message-ID: <CAGXu5jLecg2HJqmEHoQr20ZNtgqvcD6b9s9_OsJ42a=7C0+egg@mail.gmail.com>
Subject: Re: [kernel-hardening] [PATCH v5 2/5] GCC plugin infrastructure
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Brown <david.brown@linaro.org>
Cc: Emese Revfy <re.emese@gmail.com>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 9, 2016 at 1:01 AM, David Brown <david.brown@linaro.org> wrote:
> On Mon, Mar 07, 2016 at 12:04:27AM +0100, Emese Revfy wrote:
>
>> This patch allows to build the whole kernel with GCC plugins. It was
>> ported from
>> grsecurity/PaX. The infrastructure supports building out-of-tree modules
>> and
>> building in a separate directory. Cross-compilation is supported too but
>> currently only the x86 architecture enables plugins.
>
>
> I've tested this with both ARM and ARM64.  There are some missing
> headers in the arm64 gcc, reported here:
> https://bugs.linaro.org/show_bug.cgi?id=2123 (also upstream), but this
> should work once that is fixed.
>
> Feel free to fold these into your patch, or, if you prefer, I can send
> out separate patches for them.

Ah-ha, great! Thanks for testing!

Emese, if you're not interested in carrying this, I can add it to my tree.

-Kees

>
> Signed-off-by: David Brown <david.brown@linaro.org>
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4f799e5..67ee8e3 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -54,6 +54,7 @@ config ARM
>         select HAVE_FUNCTION_GRAPH_TRACER if (!THUMB2_KERNEL)
>         select HAVE_FUNCTION_TRACER if (!XIP_KERNEL)
>         select HAVE_GENERIC_DMA_COHERENT
> +       select HAVE_GCC_PLUGINS
>         select HAVE_HW_BREAKPOINT if (PERF_EVENTS && (CPU_V6 || CPU_V6K ||
> CPU_V7))
>         select HAVE_IDE if PCI || ISA || PCMCIA
>         select HAVE_IRQ_TIME_ACCOUNTING
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 8cc6228..6d6e4f8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -70,6 +70,7 @@ config ARM64
>         select HAVE_FTRACE_MCOUNT_RECORD
>         select HAVE_FUNCTION_TRACER
>         select HAVE_FUNCTION_GRAPH_TRACER
> +       select HAVE_GCC_PLUGINS
>         select HAVE_GENERIC_DMA_COHERENT
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS
>         select HAVE_IRQ_TIME_ACCOUNTING
> --



-- 
Kees Cook
Chrome OS & Brillo Security
