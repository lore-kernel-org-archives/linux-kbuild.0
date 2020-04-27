Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:20948 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgEMWiJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 18:38:09 -0400
Date: Mon, 27 Apr 2020 17:22:53 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200427020830.GA260@Ryzen-7-3700X.localdomain>
Message-ID: <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
References: <20200419202128.20571-1-natechancellor@gmail.com> <20200423171807.29713-1-natechancellor@gmail.com> <20200423171807.29713-3-natechancellor@gmail.com> <20200426162737.GA9322@alpha.franken.de> <20200427020830.GA260@Ryzen-7-3700X.localdomain>
Content-Type: text/plain; charset=US-ASCII
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Sun, 26 Apr 2020, Nathan Chancellor wrote:

> > this causes build errors for me when (cross) compiling a big endian target:
> > 
> > target is little endian
> > mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> > mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o
> 
> Thanks for the report. I will look into it tomorrow and hopefully have a
> v4 by then.

 Can you actually record in the change description what the difference in 
the relevant link command is, as shown where `V=1' has been used with 
`make' invocation?

 Actually running `diff -bu' on the whole `V=1' build log obtained without 
and with your proposed change applied and ensuring there are no unwanted 
changes elsewhere will be a good measure of the correctness of your patch. 
You may have to prepare to be patient and run with `-j1' to make sure any 
`make' parallelism does not interfere with the order of commands printed.

  Maciej
