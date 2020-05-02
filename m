Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63019 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 18:42:24 -0400
Date: Sat, 2 May 2020 14:34:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200428225401.7yrld7u2xr67t4xf@google.com>
Message-ID: <alpine.LFD.2.21.2005021408420.3602499@eddie.linux-mips.org>
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-5-natechancellor@gmail.com> <20200428225401.7yrld7u2xr67t4xf@google.com>
Content-Type: text/plain; charset=US-ASCII
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Tue, 28 Apr 2020, Fangrui Song wrote:

> Sigh...  -G 0. This is an option ignored by LLD. GCC devs probably should
> have used the long option --gpsize rather than take the short option -G.
> Even better, -z gpsize= or similar if this option is specific to ELF.

 Well, the `-G' option is some 30 years old and comes from RISC-OS where 
the vendor linker had it; it was already present with the initial MIPS 
port of GCC:

commit fe3ec4f798ceea52e1b542b481670b83c12347fd
Author: Michael Meissner <meissner@gcc.gnu.org>
Date:   Sun Dec 1 05:02:56 1991 +0000

    Initial revision

    From-SVN: r88

specifically:

+#define LINK_SPEC	"%{G*}						\

there, so I don't know of what GCC developers' choice you are talking 
about.

 Much of GCC legacy comes from various vendors' compilation systems; in 
this case it was the MIPS Computer Systems (aka MIPSCO) compiler.  There 
may not have been a GNU linker port to RISC-OS at that point (or ever), 
and the assembler and linker invocation interfaces were kept compatible as 
ports were added to individual GNU development tools, for obvious reasons.  
I still remember using GCC with vendor's assembler and linker on DEC 
Ultrix/MIPS myself many years ago, to overcome some vendor compiler's 
limitations.

 And FTR this was still a few years before ELF was even invented; MIPS OSs 
used the COFF binary format back then.

 Sorry.  I think it's LLVM/LLD that ignores compatibility, not the other 
way round.

  Maciej
