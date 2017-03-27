Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35805 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751911AbdC0F3Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 01:29:24 -0400
MIME-Version: 1.0
In-Reply-To: <1489496093-15315-12-git-send-email-nicolas.dichtel@6wind.com>
References: <CAK7LNARpx7f0eV5_AiPmNYT7MsRbGFOygJwjfAzX_7aCpuHwuw@mail.gmail.com>
 <1489496093-15315-1-git-send-email-nicolas.dichtel@6wind.com> <1489496093-15315-12-git-send-email-nicolas.dichtel@6wind.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 27 Mar 2017 14:27:49 +0900
Message-ID: <CAK7LNASihZAunuAR2TwfWUFnk+SNiVgzZjfDKBHzOEtwVnxVHw@mail.gmail.com>
Subject: Re: [PATCH v10 11/11] uapi: export all arch specifics directories
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org, David Airlie <airlied@linux.ie>, "David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>, bp@alien8.de, slash.tmp@free.fr, Daniel Vetter <daniel.vetter@ffwll.ch>, rmk+kernel@armlinux.org.uk, msalter@redhat.com, jengelh@inai.de, hch@infradead.org, Tobias Klauser <tklauser@distanz.ch>, mpe@ellerman.id.au, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Dmitry V. Levin" <ldv@altlinux.org>, Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org

Hi Nicolas,


2017-03-14 21:54 GMT+09:00 Nicolas Dichtel <nicolas.dichtel@6wind.com>:
> diff --git a/arch/cris/include/uapi/asm/Kbuild b/arch/cris/include/uapi/asm/Kbuild
> index d0c5471856e0..b15bf6bc0e94 100644
> --- a/arch/cris/include/uapi/asm/Kbuild
> +++ b/arch/cris/include/uapi/asm/Kbuild
> @@ -1,5 +1,2 @@
>  # UAPI Header export list
>  include include/uapi/asm-generic/Kbuild.asm
> -
> -subdir-y += ../arch-v10/arch/
> -subdir-y += ../arch-v32/arch/


Can you remove
arch/cris/include/arch-v32/arch/Kbuild
arch/cris/include/arch-v10/arch/Kbuild
as well?

Or, not sure if they are still needed?



> diff --git a/arch/tile/include/uapi/asm/Kbuild b/arch/tile/include/uapi/asm/Kbuild
> index e0a50111e07f..0c74c3c5ebfa 100644
> --- a/arch/tile/include/uapi/asm/Kbuild
> +++ b/arch/tile/include/uapi/asm/Kbuild
> @@ -2,5 +2,3 @@
>  include include/uapi/asm-generic/Kbuild.asm
>
>  generic-y += ucontext.h
> -
> -subdir-y += ../arch

Can you remove  arch/tile/include/arch/Kbuild as well?




-- 
Best Regards
Masahiro Yamada
