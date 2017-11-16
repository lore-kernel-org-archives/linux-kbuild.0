Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:46691 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966626AbdKPSO6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 13:14:58 -0500
Date: Thu, 16 Nov 2017 18:14:54 +0000
From: Alex Matveev <alxmtvv@gmail.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with
 LTO
Message-ID: <20171116181454.79ecb9fc@delmar.localdomain>
In-Reply-To: <20171116115433.GG9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
        <20171115213428.22559-12-samitolvanen@google.com>
        <20171116115433.GG9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, 16 Nov 2017 11:54:33 +0000
Will Deacon <will.deacon@arm.com> wrote:

> On Wed, Nov 15, 2017 at 01:34:21PM -0800, Sami Tolvanen wrote:
> > From: Alex Matveev <alxmtvv@gmail.com>
> > 
> > Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
> > in-place and workaround gcc and clang limitations on redefining
> > macros across different assembler blocks.  
> 
> What limitations? Can you elaborate please? Is this a fix?

Ok, here's the detailed explanation. Current state after preprocessing
is like this:

asm volatile(".macro mXX_s ... .endm");
void f()
{
	asm volatile("mXX_s a, b");
}

With GCC, it gives macro redefinition error because sysreg.h is
included in multiple source files, and assembler code for all of them
is later combined for LTO (I've seen an intermediate file with hundreds
of identical definitions).

With clang, it gives macro undefined error because clang doesn't allow
sharing macros between inline asm statements.

I also seem to remember catching another sort of undefined error with
GCC due to reordering of macro definition asm statement and generated
asm code for function that uses the macro.

Solution with defining and undefining for each use, while certainly not
elegant, satisfies both GCC and clang, LTO and non-LTO.

Regards,
Alex
