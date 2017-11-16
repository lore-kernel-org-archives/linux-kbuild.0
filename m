Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bn3nam01on0051.outbound.protection.outlook.com ([104.47.33.51]:19253
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964872AbdKPNH4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 08:07:56 -0500
Date: Thu, 16 Nov 2017 16:07:42 +0300
From: Yury Norov <ynorov@caviumnetworks.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
 <20171116115433.GG9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116115433.GG9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:54:33AM +0000, Will Deacon wrote:
> On Wed, Nov 15, 2017 at 01:34:21PM -0800, Sami Tolvanen wrote:
> > From: Alex Matveev <alxmtvv@gmail.com>
> > 
> > Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
> > in-place and workaround gcc and clang limitations on redefining macros
> > across different assembler blocks.
> 
> What limitations? Can you elaborate please? Is this a fix?

Hi Will,

Regarding GCC.

When it joins preprocessed source files into single asm file,
mrs_s/msr_s becomes either not declared or declared multiple times.

./ccuFb68h.s:33120: Error: Macro `mrs_s' was already defined
./ccuFb68h.s:33124: Error: Macro `msr_s' was already defined

I'm not sure that GCC works correctly in this case, and I sent the
email to Linaro toolchain group to clarify it. See below.

Yury

[...]

Links:
My unfinished branch:
https://github.com/norov/linux/tree/lto
Andi Kleen tree:
https://github.com/andikleen/linux-misc/tree/lto-411-1
Sami Tolvanen's recent work for clang:
https://lkml.org/lkml/2017/11/3/606

Question we have for now:
There's mrs_s/msr_s macro that doesn't work with LTO - linker
complains very loudly that macro is either not declared, or declared
multiple times. (To reproduce - try to build my kernel branch w/o last
patch).

The same (?) problem is observed with clang, and people there
considered it as feature, not a bug.

https://bugs.llvm.org/show_bug.cgi?id=19749

We have the fix for both clang and gcc, but it looks hacky. Maybe it
worth to fix mrs/msr issue on toolchain side?
