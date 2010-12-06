Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:56772 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753615Ab0LFRCn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Dec 2010 12:02:43 -0500
Received: by gwb20 with SMTP id 20so6672700gwb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2010 09:02:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CFD1B34020000780002625B@vpn.id2.novell.com>
References: <4CFD1B34020000780002625B@vpn.id2.novell.com>
Date: Mon, 6 Dec 2010 12:02:42 -0500
Message-ID: <AANLkTi=DwXe35qtXS3wyf6t-4AQ5Y7ZH1VqUQ8y6Ra=6@mail.gmail.com>
Subject: Re: [PATCH] allow exception table to be put in .rodata
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Mon, Dec 6, 2010 at 11:19 AM, Jan Beulich <JBeulich@novell.com> wrote:
> ... and actually do so for x86.
>
This is a technical change, not just a mechanical one. Could you
include in CC the relevant parties concerned by this change ?

Thanks,
 - Arnaud

> Signed-off-by: Jan Beulich <jbeulich@novell.com>
>
> ---
>  arch/x86/kernel/vmlinux.lds.S     |    5 +++--
>  include/asm-generic/vmlinux.lds.h |    5 +++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> --- linux-2.6.37-rc4/arch/x86/kernel/vmlinux.lds.S
> +++ 2.6.37-rc4-extable-in-rodata/arch/x86/kernel/vmlinux.lds.S
> @@ -20,6 +20,8 @@
>  #define LOAD_OFFSET __START_KERNEL_map
>  #endif
>
> +#define EXCEPTION_TABLE_RO EXCEPTION_TABLE(16)
> +
>  #include <asm-generic/vmlinux.lds.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/thread_info.h>
> @@ -113,8 +115,7 @@ SECTIONS
>        } :text = 0x9090
>
>        NOTES :text :note
> -
> -       EXCEPTION_TABLE(16) :text = 0x9090
> +       text_continues : {} :text /* switch back to regular text... */
>
>        X64_ALIGN_DEBUG_RODATA_BEGIN
>        RO_DATA(PAGE_SIZE)
> --- linux-2.6.37-rc4/include/asm-generic/vmlinux.lds.h
> +++ 2.6.37-rc4-extable-in-rodata/include/asm-generic/vmlinux.lds.h
> @@ -219,6 +219,7 @@
>                *(.rodata1)                                             \
>        }                                                               \
>                                                                        \
> +       EXCEPTION_TABLE_RO                                              \
>        BUG_TABLE                                                       \
>                                                                        \
>        JUMP_TABLE                                                      \
> @@ -439,6 +440,10 @@
>                VMLINUX_SYMBOL(__stop___ex_table) = .;                  \
>        }
>
> +#ifndef EXCEPTION_TABLE_RO
> +#define EXCEPTION_TABLE_RO
> +#endif
> +
>  /*
>  * Init task
>  */
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
