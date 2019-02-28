Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20447 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1Ngz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Feb 2019 08:36:55 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x1SDamFe023985
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Feb 2019 22:36:49 +0900
Received: by mail-ua1-f45.google.com with SMTP id v26so18852721uap.4
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Feb 2019 05:36:48 -0800 (PST)
MIME-Version: 1.0
References: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
In-Reply-To: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Feb 2019 22:36:12 +0900
Message-ID: <CAK7LNAS3a8u+khVim4bOOSi=QBHnEE35nEp=kfFCB5FYXkeG-A@mail.gmail.com>
Subject: Re: [PATCH] objtool: remove generated files with make clean
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robin Meijboom <robin@meijboom.info>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>

On Fri, Feb 15, 2019 at 11:15 AM Robin Meijboom <robin@meijboom.info> wrote:
>
> Make clean currently does not remove the generated files for objtool:
> tools/objtool/objtool, tools/objtool/fixdep, and
> tools/objtool/arch/x86/lib/inat-tables.c.
>
> Clean these files up as part of make clean.
>
> Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
> bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).
>
> Signed-off-by: Robin Meijboom <robin@meijboom.info>
> ---
> In the discussions I didn't find a reason for keeping the files, so I
> assume it is an oversight. Otherwise I would have expected them to be
> removed at least by make distconfig (which they are not).
>
> Tested by compiling, cleaning, compiling again, and booting on x86_64.
>
> diff --git a/Makefile b/Makefile
> index 141653226f3c..81a8149a805f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES
>
>   # Directories & files removed with 'make clean'
>   CLEAN_DIRS  += $(MODVERDIR) include/ksym
> +CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
> +           tools/objtool/arch/$(ARCH)/lib/inat-tables.c
>
>   # Directories & files removed with 'make mrproper'
>   MRPROPER_DIRS  += include/config usr/include include/generated          \
>



I see the same artifacts are cleaned up by tools/objtool/Makefile:

https://github.com/torvalds/linux/blob/v5.0-rc7/tools/objtool/Makefile#L59


So, this patch proves the 'clean' target
in tools/objtool/Makefile is useless.


BTW, 'make clean' must keep all the generated files
that are needed to compile external modules.

I guess cleaning objtool is wrong.



--
Best Regards
Masahiro Yamada
