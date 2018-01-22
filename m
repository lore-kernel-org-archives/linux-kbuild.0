Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:45131 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751102AbeAVSMf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 13:12:35 -0500
Received: by mail-wr0-f178.google.com with SMTP id 16so9688948wry.12
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2018 10:12:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAeHK+z=7UBwVyyDLi8jLbMg5PHdqr-RaqiUFgkdLcMFfie4Vg@mail.gmail.com>
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
 <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com> <CAAeHK+z=7UBwVyyDLi8jLbMg5PHdqr-RaqiUFgkdLcMFfie4Vg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 Jan 2018 13:12:32 -0500
Message-ID: <CAKwvOdnjobhjpaer7ve178daMNnDxfUrffLGTTR7iayYf1DWow@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Majnemer <majnemer@google.com>, Chandler Carruth <chandlerc@google.com>, Michael Kuperstein <mkuper@google.com>

On Mon, Jan 22, 2018 at 12:22 PM, Andrey Konovalov
<andreyknvl@google.com> wrote:
> On Fri, Jan 19, 2018 at 8:06 PM, Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>> Hmm... I had mentioned this patch to some coworkers who have much more
>> knowledge about LLVM than me.  They had concern that LLVM needs memset
>> to be defined, and that there were discussions on the llvm mailing
>> list about this.
>>
>> I'm digging through trying to find anything relevant, maybe this one
>> about memcpy: https://lists.llvm.org/pipermail/llvm-dev/2012-May/050108.html
>>
>> I wonder if -ffreestanding is more appropriate?
>
> I don't mind using either of those, they both fix the issue.
>
> I'm struggling to understand the difference though. GCC documentation
> doesn't really explain it [1] and Clang documentation [2] is
> completely useless in this case.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Standards.html
> [2] https://clang.llvm.org/docs/CommandGuide/clang.html

There's always the source, which is the ultimate source of truth. In LLVM,

lib/Transforms/Utils/SimplifyLibCalls.cpp
lib/Transforms/Scalar/MemCpyOptimizer.cpp
include/llvm/Analysis/TargetLibraryInfo.h

are the only things with mentions of `no-builtin` or `freestanding`.

The driver is what parses these options:

build/tools/clang/include/clang/Driver/Options.inc:
 774 OPTION(prefix_1, "ffreestanding", ffreestanding, Flag, f_Group,
INVALID, nullptr, CC1Option, 0,
 775        "Assert that the compilation takes place in a freestanding
environment", nullptr, nullptr)
...
1004 OPTION(prefix_1, "fno-builtin-", fno_builtin_, Joined, f_Group,
INVALID, nullptr, CC1Option, 0,
1005        "Disable implicit builtin knowledge of a specific
function", nullptr, nullptr)
1006 OPTION(prefix_1, "fno-builtin", fno_builtin, Flag, f_Group,
INVALID, nullptr, CC1Option, 0,
1007        "Disable implicit builtin knowledge of functions", nullptr, nullptr)

It looks like the TargetLibraryInfo#disableAllFunctions() method is
called in a few different drivers.  The options table generates all
kinds of code, but places that parse command line flags look for
`OPT_` + 3rd arg to OPTION.

In Clang, looking for OPT_no_fbuiltin and OPT_ffreestanding:

lib/Driver/ToolChains/Clang.cpp
lib/Frontend/CompilerInvocation.cpp

the second seems to set:

 559   Opts.SimplifyLibCalls = !(Args.hasArg(OPT_fno_builtin) ||
 560                             Args.hasArg(OPT_ffreestanding));
...
2201   Opts.Freestanding = Args.hasArg(OPT_ffreestanding);

which are then used back in LLVM.

Opts.Freestanding seems to be used from lots of LTO handling code in LLVM.

If ffreestanding implies fno-builtin, but does additional things with
LTO, then we might regress LTO (there's 2 patch sets in the works that
I know of) with KASAN by using ffreestanding rather than fno-builtin.
But lets cross that bridge when we get there (if we decide for some
reason that we need LTO+KASAN; I like both and if we start shipping
LTO kernels then you can bet we'd want to test them with KASAN).

So I don't think it hurts to keep v2 as is (sorry for the noise).

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
