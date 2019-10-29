Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41073 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfJ2B47 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 21:56:59 -0400
MIME-Version: 1.0
References: <20191028155639.30330-1-e5ten.arch@gmail.com> <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
 <CAMEGPiq+Z7kbjJSNA0m=1TAymamQExud_7v5yzakSPdciPbq1Q@mail.gmail.com>
In-Reply-To: <CAMEGPiq+Z7kbjJSNA0m=1TAymamQExud_7v5yzakSPdciPbq1Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 29 Oct 2019 10:56:05 +0900
Message-ID: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support byacc as alternative YACC to bison
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ethan Sommer <e5ten.arch@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ethan,

On Tue, Oct 29, 2019 at 10:41 AM Ethan Sommer <e5ten.arch@gmail.com> wrote:
>
> > I applied this patch, and tried the latest byacc,
> > but I still cannot build kconfig probably because
> > %destructor is not supported.
> > byacc does not seem to work anyway.
>
> Hi Masahiro, because I hadn't built it in a while I completely forgot
> that to support %destructor byacc needs to be built with
> --enable-btyacc, should I update the commit message to include that
> detail?

OK, I was able to build kconfig with --enable-btyacc.

byacc still cannot build scripts/dtc/dtc-parser.y
Thought?

dtc is not compiled for x86.
Please try ARCH=arm.


masahiro@pug:~/ref/linux$ make ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- YACC=/home/masahiro/bin/yacc
scripts/kconfig/conf  --syncconfig Kconfig
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-common.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-oabi.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-eabi.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
/home/masahiro/bin/yacc: e - line 120 of "scripts/dtc/dtc-parser.y",
syntax error
ERROR(&@2, "Header flags don't match earlier ones");
       ^
make[1]: *** [scripts/Makefile.host;17: scripts/dtc/dtc-parser.tab.h] Error 1
make[1]: *** Deleting file 'scripts/dtc/dtc-parser.tab.h'
make[1]: *** [scripts/dtc/dtc-parser.tab.h] Deleting file
'scripts/dtc/dtc-parser.tab.c'
make: *** [Makefile;1260: scripts_dtc] Error 2




-- 
Best Regards
Masahiro Yamada
