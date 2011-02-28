Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:56084 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754776Ab1B1VHj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Feb 2011 16:07:39 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH -v4] kbuild: Add extra gcc checks
Date: Mon, 28 Feb 2011 22:07:33 +0100
References: <20110221110322.GA9819@liondog.tnic>
In-Reply-To: <20110221110322.GA9819@liondog.tnic>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201102282207.33489.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, linux-kbuild@vger.kernel.org, bp@amd64.org

On Monday 21 February 2011 12:03:22 Borislav Petkov wrote:
> Add a 'W=1' Makefile switch which adds additional checking per build
> object.
>
> The idea behind this option is targeted at developers who, in the
> process of writing their code, want to do the occasional
>
> make W=1 [target.o]

Great stuff, I really like the idea!

> +# $(call cc-option... ) handles gcc -W.. options which
> +# are not supported by all versions of the compiler
> +ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
> +ifneq ($(call cc-version),)
> +KBUILD_EXTRA_WARNINGS := -Wextra
> +KBUILD_EXTRA_WARNINGS += -Wunused -Wno-unused-parameter
> +KBUILD_EXTRA_WARNINGS += -Waggregate-return
> +KBUILD_EXTRA_WARNINGS += -Wbad-function-cast
> +KBUILD_EXTRA_WARNINGS += -Wcast-qual
> +KBUILD_EXTRA_WARNINGS += -Wcast-align
> +KBUILD_EXTRA_WARNINGS += -Wconversion
> +KBUILD_EXTRA_WARNINGS += -Wdisabled-optimization
> +KBUILD_EXTRA_WARNINGS += -Wlogical-op
> +KBUILD_EXTRA_WARNINGS += -Wmissing-declarations
> +KBUILD_EXTRA_WARNINGS += -Wmissing-format-attribute
> +KBUILD_EXTRA_WARNINGS += $(call cc-option, -Wmissing-include-dirs,)
> +KBUILD_EXTRA_WARNINGS += -Wmissing-prototypes
> +KBUILD_EXTRA_WARNINGS += -Wnested-externs
> +KBUILD_EXTRA_WARNINGS += -Wold-style-definition
> +KBUILD_EXTRA_WARNINGS += $(call cc-option, -Woverlength-strings,)
> +KBUILD_EXTRA_WARNINGS += -Wpacked
> +KBUILD_EXTRA_WARNINGS += -Wpacked-bitfield-compat
> +KBUILD_EXTRA_WARNINGS += -Wpadded
> +KBUILD_EXTRA_WARNINGS += -Wpointer-arith
> +KBUILD_EXTRA_WARNINGS += -Wredundant-decls
> +KBUILD_EXTRA_WARNINGS += -Wshadow
> +KBUILD_EXTRA_WARNINGS += -Wswitch-default
> +KBUILD_EXTRA_WARNINGS += $(call cc-option, -Wvla,)
> +KBUILD_CFLAGS += $(KBUILD_EXTRA_WARNINGS)
> +endif
> +endif

I would be a little more selective here. Maybe we can have two levels
W=1 and W=2, with the full set getting enabled by W=2, and the smaller
set getting enabled in W=1. The reason is that many of the warnings
are pointless or even hurting code quality, while others (e.g.
-Wmissing-declarations) are generally useful and the only reason for
not enabling them is that they cause too many warnings with existing
code.

	Arnd
