Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f202.google.com ([209.85.211.202]:60063 "EHLO
	mail-yw0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbZKCKTe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2009 05:19:34 -0500
MIME-Version: 1.0
In-Reply-To: <1257242782-10496-5-git-send-email-alan-jenkins@tuffmail.co.uk>
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
	<1257242782-10496-5-git-send-email-alan-jenkins@tuffmail.co.uk>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 3 Nov 2009 05:19:19 -0500
Message-ID: <8bd0f97a0911030219y685a1dafy2a8e066d7132ac45@mail.gmail.com>
Subject: Re: [PATCH 04/10] module: make MODULE_SYMBOL_PREFIX into a CONFIG
	option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au

On Tue, Nov 3, 2009 at 05:06, Alan Jenkins wrote:
> The next commit will require the use of MODULE_SYMBOL_PREFIX in
> .tmp_exports-asm.S.  Currently it is mixed in with C structure
> definitions in "asm/module.h".  Move the definition of this arch option
> into Kconfig, so it can be easily accessed by any code.
>
> This also lets modpost.c use the same definition.  Previously modpost
> relied on a hardcoded list of architectures in mk_elfconfig.c.

this should also let us push VMLINUX_SYMBOL() out of
arch/*/kernel/vmlinux.lds.S and into asm-generic/vmlinux.lds.h ...

> A build test for blackfin, one of the two MODULE_SYMBOL_PREFIX archs,
> showed the generated code was unchanged.  vmlinux was identical save
> for build ids, and an apparently randomized suffix on a single "__key"
> symbol in the kallsyms data).

when you get localized (static) namespace collisions, the linker
automatically does that

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1171,6 +1171,17 @@ config MODULE_SRCVERSION_ALL
>
>  endif # MODULES
>
> +config HAVE_SYMBOL_PREFIX
> +       bool
> +       help
> +         Some arch toolchains use a `_' prefix for all user symbols.
> +         This option will be taken into account when loading modules.
> +
> +config SYMBOL_PREFIX
> +       string
> +       default "_" if HAVE_SYMBOL_PREFIX
> +       default ""

in practice, the symbol prefix is an underscore.  but there is no
technical limitation here -- the toolchain could use whatever prefix
they wanted

so if the Kconfig option was pushed to arch/*/Kconfig, we could drop
HAVE_SYMBOL_PREFIX and let the arch declare the exact SYMBOL_PREFIX
value itself
-mike
