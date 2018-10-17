Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:43360 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbeJQRUy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 13:20:54 -0400
MIME-Version: 1.0
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
 <1539681053-24388-4-git-send-email-yamada.masahiro@socionext.com>
 <20181016195420.GE27990@zn.tnic> <CAK7LNAS7wzJ+L-2kC2fyi9Ta9qq1jiM0-UOAisGL2CZuSEoE7w@mail.gmail.com>
 <20181017091059.GB22571@zn.tnic>
In-Reply-To: <20181017091059.GB22571@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Oct 2018 18:25:23 +0900
Message-ID: <CAK7LNARV5SPkuDkA0i85PoRzGmA3DoKX0WbSD9oEcpL6D8dQjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: check the presence of lzo and lz4 tools when necessary
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 17, 2018 at 6:12 PM Borislav Petkov <bp@suse.de> wrote:
>
> On Wed, Oct 17, 2018 at 05:59:02PM +0900, Masahiro Yamada wrote:
> > >   DESCEND  objtool
> > >   CALL    scripts/checksyscalls.sh
> > >   CHK     include/generated/compile.h
> > >   Building modules, stage 2.
> > >   CC      arch/x86/boot/compressed/misc.o
> > >   LZ4     arch/x86/boot/compressed/vmlinux.bin.lz4
> > > /bin/sh: 1: lz4c: not found
> > > make[2]: *** [arch/x86/boot/compressed/Makefile:143: arch/x86/boot/compressed/vmlinux.bin.lz4] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [arch/x86/boot/Makefile:112: arch/x86/boot/compressed/vmlinux] Error 2
> > > make: *** [arch/x86/Makefile:290: bzImage] Error 2
> > > make: *** Waiting for unfinished jobs....
> > >   MODPOST 956 modules
> > >
> > > What am I missing?
> >
> >
> > I have no idea.
> >
> > With liblz4-tool package installed on my machine,
> > I can build x86 kernel with CONFIG_KERNEL_LZ4.
>
> What happens if you remove the lz4c executable? Do you see the ugly
> error above or the "lz4 tool not found. Please install it." message with
> my config?
>

I tried that.
I can see the expected error message.



masahiro@pug:~/ref/linux$ git log  --oneline  | head -n 4
6cd6271 kbuild: check the presence of lzo and lz4 tools when necessary
b72cfb7 objtool: move libelf check out of top Makefile
e3061d8 kbuild: provide a new place to check necessary host tools
b955a91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc
masahiro@pug:~/ref/linux$ git clean -dqfx
masahiro@pug:~/ref/linux$ cp ~/Downloads/config.lz4  .config
masahiro@pug:~/ref/linux$ sudo mv /usr/bin/lz4c /usr/bin/lz4c.backup
[sudo] password for masahiro:
masahiro@pug:~/ref/linux$ make
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
  LEX     scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
*
* Restart config...
*
*
* GCC plugins
*
GCC plugins (GCC_PLUGINS) [N/y/?] (NEW)
*
* lz4 tool not found. Please install it.
*
make[1]: *** [scripts/Makefile.toolcheck;46: check_lz4] Error 1
Makefile:595: include/config/auto.conf: No such file or directory
make: *** [Makefile;636: include/config/auto.conf] Error 2
make: *** Deleting file 'include/config/auto.conf'





-- 
Best Regards
Masahiro Yamada
