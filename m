Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f194.google.com ([209.85.221.194]:46432 "EHLO
	mail-qy0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbZKKFRR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Nov 2009 00:17:17 -0500
MIME-Version: 1.0
In-Reply-To: <4AF9FB6C.70003@oracle.com>
References: <4AF9FB6C.70003@oracle.com>
Date: Wed, 11 Nov 2009 13:17:22 +0800
Message-ID: <2375c9f90911102117q33f7ce4raed39f960ddcf1fc@mail.gmail.com>
Subject: Re: [PATCH] x86 VSDO: fix Kconfig help
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, x86@kernel.org, linux-kbuild@vger.kernel.org

On Wed, Nov 11, 2009 at 7:46 AM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> COMPAT_VDSO has 2 help text blocks, but kconfig only uses the
> last one found, so merge the 2 blocks.
>
> It would be real nice if kconfig would warn about this.
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Looks good.

Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

Thanks!

> ---
>  arch/x86/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- lnx-2632-rc6.orig/arch/x86/Kconfig
> +++ lnx-2632-rc6/arch/x86/Kconfig
> @@ -1601,12 +1601,12 @@ config COMPAT_VDSO
>        prompt "Compat VDSO support"
>        depends on X86_32 || IA32_EMULATION
>        ---help---
> -         Map the 32-bit VDSO to the predictable old-style address too.
> -       ---help---
>          Say N here if you are running a sufficiently recent glibc
>          version (2.3.3 or later), to remove the high-mapped
>          VDSO mapping and to exclusively use the randomized VDSO.
>
> +         Map the 32-bit VDSO to the predictable old-style address too.
> +
>          If unsure, say Y.
>
>  config CMDLINE_BOOL
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
