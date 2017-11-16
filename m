Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:51502 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757682AbdKPNzl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 08:55:41 -0500
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
 <20171116115433.GG9361@arm.com>
 <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c0c19191-e090-4768-3c46-b813713d2908@arm.com>
Date: Thu, 16 Nov 2017 13:55:31 +0000
MIME-Version: 1.0
In-Reply-To: <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yury Norov <ynorov@caviumnetworks.com>, Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 16/11/17 13:07, Yury Norov wrote:
> On Thu, Nov 16, 2017 at 11:54:33AM +0000, Will Deacon wrote:
>> On Wed, Nov 15, 2017 at 01:34:21PM -0800, Sami Tolvanen wrote:
>>> From: Alex Matveev <alxmtvv@gmail.com>
>>>
>>> Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
>>> in-place and workaround gcc and clang limitations on redefining macros
>>> across different assembler blocks.
>>
>> What limitations? Can you elaborate please? Is this a fix?
> 
> Hi Will,
> 
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
> 
> Yury
> 
> [...]
> 
> Links:
> My unfinished branch:
> https://github.com/norov/linux/tree/lto
> Andi Kleen tree:
> https://github.com/andikleen/linux-misc/tree/lto-411-1
> Sami Tolvanen's recent work for clang:
> https://lkml.org/lkml/2017/11/3/606
> 
> Question we have for now:
> There's mrs_s/msr_s macro that doesn't work with LTO - linker
> complains very loudly that macro is either not declared, or declared
> multiple times. (To reproduce - try to build my kernel branch w/o last
> patch).
> 
> The same (?) problem is observed with clang, and people there
> considered it as feature, not a bug.
> 
> https://bugs.llvm.org/show_bug.cgi?id=19749
> 
> We have the fix for both clang and gcc, but it looks hacky. Maybe it
> worth to fix mrs/msr issue on toolchain side?

Given that this whole mrs_s infrastructure is a workaround for older 
assemblers which don't support the "S<op0>_<op1>_<Cn>_<Cm>_<op2>" syntax 
for arbitrary unnamed system registers (which IIRC was a fairly late 
addition to the architecture), the only way it could be "fixed" on the 
toolchain side is by removing all those older toolchains from existence. 
Good luck with that ;)

In *theory*, it might be possible to do something similar to what we do 
with CONFIG_BROKEN_GAS_INST to detect offending assemblers and only 
define and use these macros when necessary (hopefully Clang and other 
LTO-capable toolchains do accept the proper syntax), but I've no idea 
how invasive or difficult that might turn out to be.

Robin.
