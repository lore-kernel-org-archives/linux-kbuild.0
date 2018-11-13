Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56187 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732474AbeKMV2N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 16:28:13 -0500
Date: Tue, 13 Nov 2018 12:30:25 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 2/2] x86: set a dependency on macros.S
Message-ID: <20181113113025.GC4788@gmail.com>
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-3-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112150215.508-3-namit@vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


* Nadav Amit <namit@vmware.com> wrote:

> Changes in macros.S should trigger the recompilation of all C files, as
> the macros might need to affect their compilation.
> 
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>  scripts/Makefile.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d2213b041408..ffe3e1a01210 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -312,13 +312,13 @@ cmd_undef_syms = echo
>  endif
>  
>  # Built-in and composite module parts
> -$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  
>  # Single-part modules are special since we need to mark them in $(MODVERDIR)
>  
> -$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> +$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  	@{ echo $(@:.o=.ko); echo $@; \

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
