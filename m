Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f66.google.com ([209.85.166.66]:32809 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbfAOICw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 03:02:52 -0500
Received: by mail-io1-f66.google.com with SMTP id t24so1407430ioi.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jan 2019 00:02:51 -0800 (PST)
MIME-Version: 1.0
References: <1547536740-1572-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547536740-1572-1-git-send-email-yamada.masahiro@socionext.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 15 Jan 2019 09:02:40 +0100
Message-ID: <CAKv+Gu9qt1HydS7J2q8g6f07XpSgCtRy-vc_shJqknYtAp2u9g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mark prepare0 as PHONY to fix external module build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Samuel Holland <samuel@sholland.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, "linux-stable # v4 . 20" <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, 15 Jan 2019 at 08:20, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
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

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

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
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
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
> --
> 2.7.4
>
