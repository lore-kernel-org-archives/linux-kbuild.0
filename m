Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgD0CIf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Apr 2020 22:08:35 -0400
Date: Sun, 26 Apr 2020 19:08:30 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200427020830.GA260@Ryzen-7-3700X.localdomain>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426162737.GA9322@alpha.franken.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Sun, Apr 26, 2020 at 06:27:37PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Apr 23, 2020 at 10:18:06AM -0700, Nathan Chancellor wrote:
> > Currently, the VDSO is being linked through $(CC). This does not match
> > how the rest of the kernel links objects, which is through the $(LD)
> > variable.
> 
> this causes build errors for me when (cross) compiling a big endian target:
> 
> target is little endian
> mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o

Thanks for the report. I will look into it tomorrow and hopefully have a
v4 by then.

Cheers,
Nathan
