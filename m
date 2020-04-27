Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726204AbgD0XYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 19:24:09 -0400
Date: Mon, 27 Apr 2020 16:24:06 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
 <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Mon, Apr 27, 2020 at 05:22:53PM +0100, Maciej W. Rozycki wrote:
> On Sun, 26 Apr 2020, Nathan Chancellor wrote:
> 
> > > this causes build errors for me when (cross) compiling a big endian target:
> > > 
> > > target is little endian
> > > mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> > > mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o
> > 
> > Thanks for the report. I will look into it tomorrow and hopefully have a
> > v4 by then.
> 
>  Can you actually record in the change description what the difference in 
> the relevant link command is, as shown where `V=1' has been used with 
> `make' invocation?

That will be rather unweildy to put in the commit message since
currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
really desired. Otherwise, I can just put it where I put the changelog.

>  Actually running `diff -bu' on the whole `V=1' build log obtained without 
> and with your proposed change applied and ensuring there are no unwanted 
> changes elsewhere will be a good measure of the correctness of your patch. 
> You may have to prepare to be patient and run with `-j1' to make sure any 
> `make' parallelism does not interfere with the order of commands printed.
> 
>   Maciej
> 

Thanks for the input, I will take a look.

Cheers,
Nathan
