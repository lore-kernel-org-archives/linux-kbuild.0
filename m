Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:16616 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFBe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 21:34:29 -0400
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
 <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com> <20200405235507.psjjhqa3cxw57xra@google.com>
In-Reply-To: <20200405235507.psjjhqa3cxw57xra@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 Apr 2020 10:33:40 +0900
Message-ID: <CAK7LNAS_SQg2nhJ8HKBTq3+dziGpaJZ87fOBRS-ZMdUpKGhX9Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>, Sandeep Patil <sspatil@google.com>

On Mon, Apr 6, 2020 at 8:55 AM 'Fangrui Song' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On 2020-04-06, Masahiro Yamada wrote:
> >On Sat, Apr 4, 2020 at 3:24 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >>
> >> On Thu, Apr 2, 2020 at 10:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> >
> >> > As Documentation/kbuild/llvm.rst implies, building the kernel with a
> >> > full set of LLVM tools gets very verbose and unwieldy.
> >> >
> >> > Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> >> > GCC and Binutils. You can pass LLVM=1 from the command line or as an
> >> > environment variable. Then, Kbuild will use LLVM toolchains in your
> >> > PATH environment.
> >> >
> >> > Please note LLVM=1 does not turn on the LLVM integrated assembler.
> >> > You need to explicitly pass AS=clang to use it. When the upstream
> >> > kernel is ready for the integrated assembler, I think we can make
> >> > it default.
> >>
> >> Having this behavior change over time may be surprising.  I'd rather
> >> that if you want to not use the integrated assembler, you explicitly
> >> negate it, or just don't use the LLVM=1 syntax, ie. `make CC=clang
> >> LD=ld.lld ...`.
> >>
> >> We could modify how `-no-integrated-as` is chosen when LLVM=1.
> >>
> >> make LLVM=1 LLVMIA=0 ... # add `-no-integrated-as`
> >> # what the flag is doesn't really matter to me, something shorter might be nice.
> >> make LLVM=1 # use all LLVM tools
> >>
> >> Since we got rid of $(AS), it would be appropriate to remove/change it
> >> there, since no one really relies on AS=clang right now. (We do have 1
> >> of our 60+ CI targets using it, but we can also change that trivially.
> >> So I think we have a lot of freedom to change how `-no-integrated-as`
> >> is set.
> >>
> >> This could even be independent of this patch.
> >
> >
> >I also thought a boolean flag is preferred.
> >
> >AS=clang will not live long anyway, and
> >I hesitated to break the compatibility
> >for the short-term workaround.
> >
> >But, if this is not a big deal, I can
> >replace AS=clang with LLVMIA=1.
>
> My mere complaint is that it may be difficult to infer the intention (integrated
> assembler) from the abbreviation "IA" in "LLVMIA" :/
>
> Something with "AS" in the name may be easier for a user to understand,
> e.g. CLANG_AS or LLVM_AS.




I see 'llvm-as' in my PATH,
but it is a different kind of tool, right?
(converter from LLVM assembler *.ll to LLVM bit code *.bc)

So, I thought "LLVM_AS" might be confusing.



-- 
Best Regards
Masahiro Yamada
