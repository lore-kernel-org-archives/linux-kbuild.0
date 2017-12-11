Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26668 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752822AbdLKLsC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Dec 2017 06:48:02 -0500
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1zKD1VyG+hz13=2Ht9Q=zACiavoz54QdJpvZvz30SFrQ@mail.gmail.com>
References: <CAKwvOdmhuaLC6=vG2DMFAbhfXoUr74_aemM2DK7me6pQ0obW4g@mail.gmail.com>
 <20171106184756.24404-1-ndesaulniers@google.com> <CAK8P3a1zKD1VyG+hz13=2Ht9Q=zACiavoz54QdJpvZvz30SFrQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 11 Dec 2017 20:47:01 +0900
Message-ID: <CAK7LNATF_1wATj7FuDeY_bE9yNaDaMSU03Ggoi5+ChyCae2Aow@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Matthias Kaehlcke <mka@chromium.org>, Ingo Molnar <mingo@kernel.org>, Douglas Anderson <dianders@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Mark Charlebois <charlebm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-11 19:17 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Mon, Nov 6, 2017 at 7:47 PM, Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>> I was not seeing my linker flags getting added when using ld-option when
>> cross compiling with Clang. Upon investigation, this seems to be due to
>> a difference in how GCC vs Clang handle cross compilation.
>>
>> GCC is configured at build time to support one backend, that is implicit
>> when compiling.  Clang is explicit via the use of `-target <triple>` and
>> ships with all supported backends by default.
>>
>> GNU Make feature test macros that compile then link will always fail
>> when cross compiling with Clang unless Clang's triple is passed along to
>> the compiler. For example:
>>
>> $ clang -x c /dev/null -c -o temp.o
>> $ aarch64-linux-android/bin/ld -E temp.o
>> aarch64-linux-android/bin/ld:
>> unknown architecture of input file `temp.o' is incompatible with
>> aarch64 output
>> aarch64-linux-android/bin/ld:
>> warning: cannot find entry symbol _start; defaulting to
>> 0000000000400078
>> $ echo $?
>> 1
>>
>> $ clang -target aarch64-linux-android- -x c /dev/null -c -o temp.o
>> $ aarch64-linux-android/bin/ld -E temp.o
>> aarch64-linux-android/bin/ld:
>> warning: cannot find entry symbol _start; defaulting to 00000000004002e4
>> $ echo $?
>> 0
>>
>> This causes conditional checks that invoke $(CC) without the target
>> triple, then $(LD) on the result, to always fail.
>>
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>
> After this patch, I get the following warning in arm64 kernel builds
> with CONFIG_ARM64_ERRATUM_843419:
>
> arch/arm64/Makefile:27: ld does not support --fix-cortex-a53-843419;
> kernel may be susceptible to erratum
>
> This only happens on the first build though, when the cached variable
> is being set. On the second build we get the contents from the cache
> and the warning disappears.
>
> I've tried debugging it further but did not get anywhere with that.
>
>         Arnd


Hmm.  I cannot reproduce this issue.



With Linaro 4.9 compiler,
I got "Detected assembler with broken .inst",
which is I think expected behavior.


With Linaro 7.2 compiler,
I did not get the warning,
which is also I think expected behavior.



$ make clean
  CLEAN   .
  CLEAN   .tmp_versions
$ make ARCH=arm64
CROSS_COMPILE=~/toolchains/aarch64-linaro-4.9/bin/aarch64-linux-gnu-
arch/arm64/Makefile:48: Detected assembler with broken .inst;
disassembly will be unreliable
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/bin2c
  CC      kernel/bounds.s
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
   ...

$ make ARCH=arm64
CROSS_COMPILE=~/toolchains/aarch64-linaro-7.2/bin/aarch64-linux-gnu-
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  CHK     scripts/mod/devicetable-offsets.h
  CHK     include/generated/compile.h
    ...


Can you provide detailed steps to reproduce the problem?



-- 
Best Regards
Masahiro Yamada
