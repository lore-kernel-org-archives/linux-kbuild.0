Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46812 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbeKPRtv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Nov 2018 12:49:51 -0500
MIME-Version: 1.0
References: <20181114204309.18645-1-namit@vmware.com> <20181114204309.18645-3-namit@vmware.com>
In-Reply-To: <20181114204309.18645-3-namit@vmware.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Nov 2018 16:37:46 +0900
Message-ID: <CAK7LNAR30CVQHBTXzY-cFcpa-mw2QSpqUZHEAs7n0Jn64dLBFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86: set a dependency on macros.S
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 15, 2018 at 1:01 PM Nadav Amit <namit@vmware.com> wrote:
>
> Changes in macros.S should trigger the recompilation of all C files, as
> the macros might need to affect their compilation.
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---

When we talked about this last time,
we agreed to not do this
because a single line change in asm headers
would cause global rebuilding.

Did you change your mind?




>  scripts/Makefile.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index b8d26bdf48b0..efec77991c2b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -313,13 +313,13 @@ cmd_undef_syms = echo
>  endif
>
>  # Built-in and composite module parts
> -$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
>         $(call cmd,force_checksrc)
>         $(call if_changed_rule,cc_o_c)
>
>  # Single-part modules are special since we need to mark them in $(MODVERDIR)
>
> -$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> +$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
>         $(call cmd,force_checksrc)
>         $(call if_changed_rule,cc_o_c)
>         @{ echo $(@:.o=.ko); echo $@; \
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
