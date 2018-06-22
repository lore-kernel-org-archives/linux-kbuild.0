Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51711 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933353AbeFVCYH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jun 2018 22:24:07 -0400
Date: Fri, 22 Jun 2018 04:24:02 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v6 3/3] x86: paravirt: make native_save_fl extern inline
Message-ID: <20180622022402.GA24194@gmail.com>
References: <20180621162324.36656-1-ndesaulniers@google.com>
 <20180621162324.36656-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621162324.36656-4-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: mingo@redhat.com, tglx@linutronix.de, akpm@linux-foundation.org, hpa@zytor.com, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, virtualization@lists.linux-foundation.org, astrachan@google.com, manojgupta@google.com, ghackmann@google.com, sedat.dilek@gmail.com, tstellar@redhat.com, keescook@google.com, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, geert@linux-m68k.org, will.deacon@arm.com, mawilcox@microsoft.com, arnd@arndb.de, rientjes@google.com, acme@redhat.com, pombredanne@nexb.com, aryabinin@virtuozzo.com, kstewart@linuxfoundation.org, boris.ostrovsky@oracle.com, jan.kiszka@siemens.com, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, ard.biesheuvel@linaro.org, akataria@vmware.com, brijesh.singh@amd.com, caoj.fnst@cn.fujitsu.com, gregkh@linuxfoundation.org, jarkko.sakkinen@linux.intel.com, jgross@suse.com, jpoimboe@redhat.com, mka@chromium.org, thomas.lendacky@amd.com, tweek@google.com, mjg59@google.com, joe@perches.com, andrea.parri@amarulasolutions.com


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> native_save_fl() is marked static inline, but by using it as
> a function pointer in arch/x86/kernel/paravirt.c, it MUST be outlined.

> --- a/arch/x86/include/asm/irqflags.h
> +++ b/arch/x86/include/asm/irqflags.h
> @@ -13,7 +13,7 @@
>   * Interrupt control:
>   */
>  
> -static inline unsigned long native_save_fl(void)
> +extern inline unsigned long native_save_fl(void)
>  {
>  	unsigned long flags;
>  

What's the code generation effect of this on say a defconfig kernel vmlinux with 
paravirt enabled?

Thanks,

	Ingo
