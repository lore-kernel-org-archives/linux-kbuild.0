Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39839 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753008AbeBTTfE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 14:35:04 -0500
Received: by mail-lf0-f65.google.com with SMTP id h78so5838839lfg.6
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 11:35:03 -0800 (PST)
Date: Tue, 20 Feb 2018 20:34:46 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180220193446.o3ivudqtnb76okhc@huvuddator>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
 <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220192508.GA12089@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180220192508.GA12089@vmlxhi-102.adit-jv.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Feb 20, 2018 at 08:25:08PM +0100, Eugeniu Rosca wrote:
> Fwiw, both solutions display reverse dependencies of certain choices
> like below:
> 
> Prompt: Compiler optimization level
>    Location:
>      -> General setup
>   Defined at init/Kconfig:1021
>   Selected by:
>    - m
> 
> I can notice this output at least for:
>   prompt "Cputime accounting"
>   prompt "Compiler optimization level"
>   prompt "Choose SLAB allocator"
>   prompt "Processor family"
>   prompt "Preemption Model"
>   prompt "Timer frequency"
>   prompt "IO delay type"
>   prompt "Choose kernel unwinder"
>   prompt "Default security module"
> 
> I'm not sure if `Selected by:\n  - m` is of any use/help. Omitting it,
> if desired, is probably subject of a different patch?

This is due to some obscure Kconfig internals. I added a comment in
scripts/kconfig/menu.c to explain it recently:

	/*
	 * For non-optional choices, add a reverse dependency (corresponding to
	 * a select) of '<visibility> && m'. This prevents the user from
	 * setting the choice mode to 'n' when the choice is visible.
	 *
	 * This would also work for non-choice symbols, but only non-optional
	 * choices clear SYMBOL_OPTIONAL as of writing. Choices are implemented
	 * as a type of symbol.
	 */
	if (sym && !sym_is_optional(sym) && parent->prompt) {
		sym->rev_dep.expr = expr_alloc_or(sym->rev_dep.expr,
				expr_alloc_and(parent->prompt->visible.expr,
					expr_alloc_symbol(&symbol_mod)));
	}

It doesn't hurt to show it, IMO. Might cause some confusion at worst,
but it's probably pretty minimal.

Cheers,
Ulf
