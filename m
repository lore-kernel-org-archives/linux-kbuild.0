Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:57387 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935064AbdKPRJr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 12:09:47 -0500
Date: Thu, 16 Nov 2017 11:01:44 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116170144.GR10515@gate.crashing.org>
References: <20171115213428.22559-1-samitolvanen@google.com> <20171115213428.22559-12-samitolvanen@google.com> <20171116115433.GG9361@arm.com> <20171116130742.wijnukjetoupi4hc@yury-thinkpad> <20171116135650.GQ10515@gate.crashing.org> <20171116164608.GG94341@samitolvanen.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116164608.GG94341@samitolvanen.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Yury Norov <ynorov@caviumnetworks.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 08:46:08AM -0800, Sami Tolvanen wrote:
> On Thu, Nov 16, 2017 at 07:56:50AM -0600, Segher Boessenkool wrote:
> > The compiler is fine, the assembler is fine (and the linker has
> > nothing to do with it).  Your code is not fine.
> 
> Would you care to elaborate? The current code assumes that macros are
> visible in other inline assembly blocks, and LLVM developers seem to
> feel this isn't correct behavior. This patch fixes the current code so
> it works with both assemblers.

If you say e.g.

void f(void)
{
	asm(".macro something\n\t.endm");
}

there is nothing that prevents the compiler from emitting this more
than once.  Expecting things to be emitted in whatever order is a bad
idea, too.

The thing with .purgem can work.  Inelegant, sure, but it can work :-)
Just make sure you do the macro define, the code that uses it, and the
undefine, all in the same inline asm statement.


Segher
