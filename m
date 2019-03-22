Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41114 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728827AbfCVOyI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Mar 2019 10:54:08 -0400
Date: Fri, 22 Mar 2019 10:54:04 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 5/8] modpost: Integrate klp-convert
Message-ID: <20190322145404.GA31248@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-6-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-6-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:10AM -0300, Joao Moreira wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Create cmd_klp_convert and hook it into scripts/Makefile.modpost.
> cmd_klp_convert invokes klp-convert with the right arguments for the
> conversion of unresolved symbols inside a livepatch.
> 
> [khlebnikov:
> * save cmd_ld_ko_o into .module.cmd, if_changed_rule doesn't do that
> * fix bashisms for debian where /bin/sh is a symlink to /bin/dash
> * rename rule_link_module to rule_ld_ko_o, otherwise arg-check inside
>   if_changed_rule compares cmd_link_module and cmd_ld_ko_o
> * check modinfo -F livepatch only if CONFIG_LIVEPATCH is true
> ]
> 
> [mbenes:
> * remove modinfo call. LIVEPATCH_ in Makefiled
> ]
> 
> [jmoreira:
> * split up: move the .livepatch file-based scheme for identifying
> livepatches to a previous patch, as it was required for correctly
> building Symbols.list there.
> ]
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> ---
>  scripts/Kbuild.include   |  4 +++-
>  scripts/Makefile.modpost | 16 +++++++++++++++-
>  scripts/mod/modpost.c    |  6 +++++-
>  scripts/mod/modpost.h    |  1 +
>  4 files changed, 24 insertions(+), 3 deletions(-)
> 
>
> [ ... snip ... ]
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 7d4af0d0accb..da779a185218 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -125,8 +125,22 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>                   -o $@ $(filter-out FORCE,$^) ;                         \
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
> +SLIST = $(objtree)/Symbols.list
> +KLP_CONVERT = scripts/livepatch/klp-convert
> +quiet_cmd_klp_convert = KLP $@
> +      cmd_klp_convert = mv $@ $(@:.ko=.klp.o);				\
> +			$(KLP_CONVERT) $(SLIST) $(@:.ko=.klp.o) $@
> +
> +define rule_ld_ko_o
> +	$(call cmd,ld_ko_o) $(cmd_ld_ko_o) ;				\
                           ^
Should there be a ';' semicolon here (and maybe a line-break) between
$(call cmd,ld_ko_o) and $(cmd_ld_ko_o)?

I didn't see this in my x86_64 VM, but on a ppc64le box, I kept getting
really strange build errors that I traced to this line.  Without a
semicolon, the build was trying to run a make command with a linker
command smashed onto the end of it:

  make -f ./arch/powerpc/Makefile.postlink crypto/xts.ko ld -r  -EL -m elf64lppc -T ./scripts/module-common.lds -T ./arch/powerpc/kernel/module.lds --save-restore-funcs  --build-id  -o crypto/xts.ko crypto/xts.o crypto/xts.mod.o


Now, klp-convert looks like will need some ppc64le work as well, as it's
confused about .TOC. symbols:

    CC      samples/livepatch/livepatch-annotated-sample.mod.o
    CC      samples/livepatch/livepatch-callbacks-busymod.mod.o
    CC      samples/livepatch/livepatch-callbacks-demo.mod.o
    CC      samples/livepatch/livepatch-callbacks-mod.mod.o
    CC      samples/livepatch/livepatch-sample.mod.o
    CC      samples/livepatch/livepatch-shadow-fix1.mod.o
    CC      samples/livepatch/livepatch-shadow-fix2.mod.o
    CC      samples/livepatch/livepatch-shadow-mod.mod.o
    LD [M]  samples/livepatch/livepatch-annotated-sample.ko
    LD [M]  samples/livepatch/livepatch-callbacks-demo.ko
    KLP     samples/livepatch/livepatch-annotated-sample.ko
    LD [M]  samples/livepatch/livepatch-callbacks-mod.ko
    KLP     samples/livepatch/livepatch-callbacks-demo.ko
    LD [M]  samples/livepatch/livepatch-sample.ko
    LD [M]  samples/livepatch/livepatch-shadow-fix1.ko
  klp-convert: Define KLP_SYMPOS for the symbol: .TOC.
  Valid KLP_SYMPOS for symbol .TOC.:

  [ ... snip listing of all .TOC's across the kernel ... ]

but we can save that for another day.


-- Joe
