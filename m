Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34528 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934113AbdKPQbL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:31:11 -0500
Date: Thu, 16 Nov 2017 17:30:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Message-ID: <20171116163054.kcsdsomr7u2mqql2@hirez.programming.kicks-ass.net>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com>
 <20171116115810.GH9361@arm.com>
 <20171116161731.GA94341@samitolvanen.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116161731.GA94341@samitolvanen.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, paulmck@linux.vnet.ibm.com

On Thu, Nov 16, 2017 at 08:17:31AM -0800, Sami Tolvanen wrote:
> On Thu, Nov 16, 2017 at 11:58:11AM +0000, Will Deacon wrote:
> > I'll be honest with you: I'm absolutely terrified about enabling this.
> 
> That's understandable, I wouldn't want to enable this by default
> quite yet either. This patch doesn't enable LTO for arm64, just makes
> it possible to enable the feature. I'm perfectly fine with marking
> CONFIG_LTO_CLANG experimental if it makes people more comfortable.
> 
> > How much testing has this seen?
> 
> I've been running clang LTO kernels for a few months on a Pixel 2 device
> without any issues. This is on a 4.4 kernel though.
> 
> > Right now, the C standard isn't on our side here and we're relying on
> > the compiler not doing this kind of thing. Can we continue to rely on
> > that in the face of LTO?
> 
> I'll have to check with our LLVM experts, but I have not run into these
> issues with current compiler versions. Looking at Andi's old patches,
> looks like gcc might be more aggressive in reordering things with LTO
> than clang.

Ideally we'd get the toolchain people to commit to supporting the kernel
memory model along side the C11 one. That would help a ton.
