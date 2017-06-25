Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34575 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750944AbdFYD2r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2017 23:28:47 -0400
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com [209.85.161.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v5P3Sif3025616
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jun 2017 12:28:44 +0900
Received: by mail-yw0-f175.google.com with SMTP id t127so17020386ywc.3
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2017 20:28:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170622123929.15054-4-npiggin@gmail.com>
References: <20170622123929.15054-1-npiggin@gmail.com> <20170622123929.15054-4-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Jun 2017 12:28:43 +0900
Message-ID: <CAK7LNATU6=90_uUTZZAj1hsX8hvJ7w-Lb0T4gXiqyWwMomYimw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tile: thin archives fix linking
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Chris Metcalf <cmetcalf@mellanox.com>

2017-06-22 21:39 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> The VDSO symbols can't be linked into built-in.o when building with
> thin archives, so change this to linking a new object file that is
> included into the built-in.o.
>
> Cc: Chris Metcalf <cmetcalf@mellanox.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/tile/kernel/vdso/Makefile | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/arch/tile/kernel/vdso/Makefile b/arch/tile/kernel/vdso/Makefile
> index c54fff37b5ff..e140472d5be6 100644
> --- a/arch/tile/kernel/vdso/Makefile
> +++ b/arch/tile/kernel/vdso/Makefile
> @@ -11,7 +11,7 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>  # vdso32 is only for tilegx -m32 compat task.
>  VDSO32-$(CONFIG_COMPAT) := y
>
> -obj-y += vdso.o
> +obj-y += vdso.o vdso-syms.o
>  obj-$(VDSO32-y) += vdso32.o
>  extra-y += vdso.lds
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
> @@ -49,16 +49,18 @@ $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso)
>  # We also create a special relocatable object that should mirror the symbol
>  # table and layout of the linked DSO.  With ld -R we can then refer to
>  # these symbols in the kernel code rather than hand-coded addresses.
> -extra-y += vdso-syms.o
> -$(obj)/built-in.o: $(obj)/vdso-syms.o
> -$(obj)/built-in.o: ld_flags += -R $(obj)/vdso-syms.o
>
>  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>                              $(call cc-ldoption, -Wl$(comma)--hash-style=both)
> -SYSCFLAGS_vdso_syms.o = -r
> -$(obj)/vdso-syms.o: $(src)/vdso.lds $(obj)/vrt_sigreturn.o FORCE
> +SYSCFLAGS_vdso_dummy.o = -r
> +$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/vrt_sigreturn.o FORCE
>         $(call if_changed,vdsold)
>
> +quiet_cmd_vdso_sym = VDSOSYM $@
> +      cmd_vdso_sym = $(LD) -r -R $(obj)/vdso-dummy.o -o $@
> +
> +$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o
> +       $(call if_changed,vdso_sym)
>
>  # strip rule for the .so file
>  $(obj)/%.so: OBJCOPYFLAGS := -S
> --
> 2.11.0
>
> --

I updated thin-ar branch.

Just in case, the following is my local fix-up:

 - Fix incremental build
 - Do not repeat "$(obj)/vsyscall-dummy.o" in the build command



diff --git a/arch/tile/kernel/vdso/Makefile b/arch/tile/kernel/vdso/Makefile
index edb7809..c615ec0 100644
--- a/arch/tile/kernel/vdso/Makefile
+++ b/arch/tile/kernel/vdso/Makefile
@@ -5,7 +5,7 @@ vdso-syms = rt_sigreturn gettimeofday
 obj-vdso = $(patsubst %, v%.o, $(vdso-syms))

 # Build rules
-targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
+targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-dummy.o
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))

 # vdso32 is only for tilegx -m32 compat task.
@@ -56,9 +56,9 @@ $(obj)/vdso-dummy.o: $(src)/vdso.lds
$(obj)/vrt_sigreturn.o FORCE
        $(call if_changed,vdsold)

 quiet_cmd_vdso_sym = VDSOSYM $@
-      cmd_vdso_sym = $(LD) -r -R $(obj)/vdso-dummy.o -o $@
+      cmd_vdso_sym = $(LD) -r -o $@ -R $<

-$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o
+$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
        $(call if_changed,vdso_sym)

 # strip rule for the .so file



-- 
Best Regards
Masahiro Yamada
