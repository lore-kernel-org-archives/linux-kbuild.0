Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgEBPts (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 11:49:48 -0400
Date: Sat, 2 May 2020 08:49:45 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200502154945.GA3361319@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200428221419.2530697-5-natechancellor@gmail.com>
 <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Sat, May 02, 2020 at 02:50:34PM +0100, Maciej W. Rozycki wrote:
> On Tue, 28 Apr 2020, Nathan Chancellor wrote:
> 
> > Before this patch, LD=ld.lld did nothing:
> > 
> > $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> > String dump of section '.comment':
> > [     0] ClangBuiltLinux clang version 11.0.0
> 
>  What does it mean "did nothing", is `arch/mips/vdso/vdso.so.dbg.raw' not 
> produced?  Where does `arch/mips/vdso/vdso.so.dbg' come from then?
> 
>   Maciej

A better wording might be "Before this patch, specifying a linker like
ld.lld via the LD variable was not respected by the MIPS VDSO". I should
also probably expand on the second paragraph, maybe something like:

When clang is built in a default configuration, it first attempts to use
the target triple's default linker then the system's default linker,
which is almost always ld.bfd. To use ld.lld, '-fuse-ld=lld' must be
passed to clang. However, we do not use -fuse-ld=lld because it can be
brittle and we have support for invoking $(LD) directly because we have
separate compilation and link steps. See commit fe00e50b2db8c ("ARM:
8858/1: vdso: use $(LD) instead of $(CC) to link VDSO") and
commit 691efbedc60d2 ("arm64: vdso: use $(LD) instead of $(CC) to link
VDSO") for examples of doing this in the VDSO.
