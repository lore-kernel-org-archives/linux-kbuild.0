Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38037 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbfAOKoa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 05:44:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id e5so1114821plb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jan 2019 02:44:30 -0800 (PST)
Subject: Re: [PATCH] kbuild: mark prepare0 as PHONY to fix external module
 build
References: <1547536740-1572-1-git-send-email-yamada.masahiro@socionext.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <54f84ad6-279f-aa64-8c2c-59becd64a6ad@ozlabs.ru>
Date: Tue, 15 Jan 2019 21:44:22 +1100
MIME-Version: 1.0
In-Reply-To: <1547536740-1572-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Samuel Holland <samuel@sholland.org>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, "linux-stable # v4 . 20" <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org



On 15/01/2019 18:19, Masahiro Yamada wrote:
> Commit c3ff2a5193fa ("powerpc/32: add stack protector support")
> caused kernel panic on PowerPC if an external module is used with
> CONFIG_STACKPROTECTOR because the 'prepare' target was not executed
> for the external module build.
> 
> Commit e07db28eea38 ("kbuild: fix single target build for external
> module") turned it into a build error because the 'prepare' target is
> now executed but the 'prepare0' target is missing for the external
> module build.
> 
> External module on arm/arm64 with CONFIG_STACKPROTECTOR_PER_TASK is
> also broken in the same way.
> 
> Move 'PHONY += prepare0' to the common place. Make is fine with missing
> rule for phony targets.
> 
> I minimize the change so it can be easily backported to 4.20.x
> 
> To fix v4.20 for external modules of PowerPC, please backport
> e07db28eea38 ("kbuild: fix single target build for external module"),
> and then this commit.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201891
> Fixes: e07db28eea38 ("kbuild: fix single target build for external module")
> Fixes: c3ff2a5193fa ("powerpc/32: add stack protector support")
> Fixes: 189af4657186 ("ARM: smp: add support for per-task stack canaries")
> Fixes: 0a1213fa7432 ("arm64: enable per-task stack canaries")
> Cc: linux-stable <stable@vger.kernel.org> # v4.20
> Reported-by: Samuel Holland <samuel@sholland.org>
> Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks for fixing this! Out of curiosity - how does this work?
arch/powerpc/Makefile's stack_protector_prepare still depends on
prepare0 which is still defined only if KBUILD_EXTMOD=="" but somehow it
does not bother ./Makefile? Thanks,


> ---
> 
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 499b968..789b332 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -955,6 +955,7 @@ ifdef CONFIG_STACK_VALIDATION
>    endif
>  endif
>  
> +PHONY += prepare0
>  
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
> @@ -1061,8 +1062,7 @@ scripts: scripts_basic scripts_dtc
>  # archprepare is used in arch Makefiles and when processed asm symlink,
>  # version.h and scripts_basic is processed / created.
>  
> -# Listed in dependency order
> -PHONY += prepare archprepare prepare0 prepare1 prepare2 prepare3
> +PHONY += prepare archprepare prepare1 prepare2 prepare3
>  
>  # prepare3 is used to check if we are building in a separate output directory,
>  # and if so do:
> 

-- 
Alexey
