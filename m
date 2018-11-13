Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41028 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732474AbeKMV1r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 16:27:47 -0500
Date: Tue, 13 Nov 2018 12:30:00 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Message-ID: <20181113113000.GB4788@gmail.com>
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112150215.508-2-namit@vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


* Nadav Amit <namit@vmware.com> wrote:

> Introducing the use of asm macros in c-code broke distcc, since it only
> sends the preprocessed source file. The solution is to break the
> compilation into two separate phases of compilation and assembly, and
> between the two concatanate the assembly macros and the compiled (yet

s/concatenate

> not assembled) source file. Since this is less efficient, this
> compilation mode is only used when make is called with the "DISTCC=y"
> parameter.
> 
> Note that the assembly stage should also be distributed, if distcc is
> configured using "CFLAGS=-DENABLE_REMOTE_ASSEMBLE".

It's a bit sad that we regressed distcc performance ...

> +# If distcc is used, then when an assembly macro files is needed, the
> +# compilation stage and the assembly stage need to be separated. Providing
> +# "DISTCC=y" option enables the separate compilation and assembly.

Let's fix the various typos:

  > +# If distcc is used, and when assembly macro files are needed, the
  > +# compilation stage and the assembly stage needs to be separated. 
  > +# Providing the "DISTCC=y" option enables separate compilation and 
  > +# assembly.



> +cmd_cc_o_c_direct = $(CC) $(c_flags) -c -o $(1) $<
> +
> +ifeq ($(DISTCC),y)
> +a_flags_no_debug = $(filter-out $(AFLAGS_DEBUG_INFO), $(a_flags))
> +c_flags_no_macros = $(filter-out $(ASM_MACRO_FLAGS), $(c_flags))
> +
> +cmd_cc_o_c_two_steps =							\
> +	$(CC) $(c_flags_no_macros) $(DISABLE_LTO) -fverbose-asm -S	\
> +		-o $(@D)/.$(@F:.o=.s) $< ;				\
> +	cat $(ASM_MACRO_FILE) $(@D)/.$(@F:.o=.s) >			\
> +		$(@D)/.tmp_$(@F:.o=.s);					\
> +	$(CC) $(a_flags_no_debug) -c -o $(1) $(@D)/.tmp_$(@F:.o=.s) ; 	\
> +	rm -f $(@D)/.$(@F:.o=.s) $(@D)/.tmp_$(@F:.o=.s)			\
> +
> +cmd_cc_o_c_helper =    							\
> +	$(if $(findstring $(ASM_MACRO_FLAGS),$(c_flags)),		\
> +		$(call cmd_cc_o_c_two_steps, $(1)),			\
> +		$(call cmd_cc_o_c_direct, $(1)))

There are various stray <space>+<tab> whitespace noise errors in the 
chunks above.

Thanks,

	Ingo
