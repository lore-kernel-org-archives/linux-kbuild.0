Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:39429 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933634AbdKPPlH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 10:41:07 -0500
Date: Thu, 16 Nov 2017 07:56:50 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116135650.GQ10515@gate.crashing.org>
References: <20171115213428.22559-1-samitolvanen@google.com> <20171115213428.22559-12-samitolvanen@google.com> <20171116115433.GG9361@arm.com> <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yury Norov <ynorov@caviumnetworks.com>
Cc: Will Deacon <will.deacon@arm.com>, Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 04:07:42PM +0300, Yury Norov wrote:
> > > Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
> > > in-place and workaround gcc and clang limitations on redefining macros
> > > across different assembler blocks.
> > 
> > What limitations? Can you elaborate please? Is this a fix?

> Regarding GCC.
> 
> When it joins preprocessed source files into single asm file,
> mrs_s/msr_s becomes either not declared or declared multiple times.
> 
> ./ccuFb68h.s:33120: Error: Macro `mrs_s' was already defined
> ./ccuFb68h.s:33124: Error: Macro `msr_s' was already defined
> 
> I'm not sure that GCC works correctly in this case, and I sent the
> email to Linaro toolchain group to clarify it. See below.

The compiler is free to inline code, reorder code, duplicate code, etc.
Inline assembler is not exempt from this.

The compiler is fine, the assembler is fine (and the linker has nothing
to do with it).  Your code is not fine.


Segher
