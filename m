Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58748 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726691AbeJQRmY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 13:42:24 -0400
Date: Wed, 17 Oct 2018 11:47:11 +0200
From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH 3/3] kbuild: check the presence of lzo and lz4 tools when
 necessary
Message-ID: <20181017094711.GD22571@zn.tnic>
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
 <1539681053-24388-4-git-send-email-yamada.masahiro@socionext.com>
 <20181016195420.GE27990@zn.tnic>
 <CAK7LNAS7wzJ+L-2kC2fyi9Ta9qq1jiM0-UOAisGL2CZuSEoE7w@mail.gmail.com>
 <20181017091059.GB22571@zn.tnic>
 <CAK7LNARV5SPkuDkA0i85PoRzGmA3DoKX0WbSD9oEcpL6D8dQjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARV5SPkuDkA0i85PoRzGmA3DoKX0WbSD9oEcpL6D8dQjg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 17, 2018 at 06:25:23PM +0900, Masahiro Yamada wrote:
> masahiro@pug:~/ref/linux$ git log  --oneline  | head -n 4
> 6cd6271 kbuild: check the presence of lzo and lz4 tools when necessary
> b72cfb7 objtool: move libelf check out of top Makefile
> e3061d8 kbuild: provide a new place to check necessary host tools
> b955a91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc
> masahiro@pug:~/ref/linux$ git clean -dqfx
> masahiro@pug:~/ref/linux$ cp ~/Downloads/config.lz4  .config
> masahiro@pug:~/ref/linux$ sudo mv /usr/bin/lz4c /usr/bin/lz4c.backup
> [sudo] password for masahiro:
> masahiro@pug:~/ref/linux$ make
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   YACC    scripts/kconfig/zconf.tab.c
>   LEX     scripts/kconfig/zconf.lex.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --syncconfig Kconfig
> *
> * Restart config...
> *
> *
> * GCC plugins
> *
> GCC plugins (GCC_PLUGINS) [N/y/?] (NEW)
> *
> * lz4 tool not found. Please install it.
> *
> make[1]: *** [scripts/Makefile.toolcheck;46: check_lz4] Error 1
> Makefile:595: include/config/auto.conf: No such file or directory
> make: *** [Makefile;636: include/config/auto.conf] Error 2
> make: *** Deleting file 'include/config/auto.conf'

Ok, gotcha. The difference is the "make oldconfig" I do.

[boris@zn: ~/kernel/linux> git log  --oneline  | head -n 3
57ac85467970 kbuild: check the presence of lzo and lz4 tools when necessary
92a3b44ab988 objtool: move libelf check out of top Makefile
23b142c064a7 kbuild: provide a new place to check necessary host tools
[boris@zn: ~/kernel/linux> git clean -dqfx
[boris@zn: ~/kernel/linux> cp ~/tmp/config.lz4 .config
[boris@zn: ~/kernel/linux> make oldconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
  LEX     scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --oldconfig Kconfig
#
# configuration written to .config
#
[boris@zn: ~/kernel/linux> make
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  HYPERCALLS arch/x86/include/generated/asm/xen-hypercalls.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
...

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
