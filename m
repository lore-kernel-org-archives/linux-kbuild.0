Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49838 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732079AbeISUga (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Sep 2018 16:36:30 -0400
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=CRw+5T6Us-Pw+t02PYWFEh=SM49C+28x7_oH+hcPOzQ@mail.gmail.com>
References: <20180918023157.23951-1-stefan@agner.ch> <CAKwvOd=CRw+5T6Us-Pw+t02PYWFEh=SM49C+28x7_oH+hcPOzQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Sep 2018 23:57:05 +0900
Message-ID: <CAK7LNASvCQ-uPYXFv4u4a0kk_yXoBWwHPmA-ggOr_NpQxz7Xrg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow to use GCC toolchain not in Clang search path
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Stefan Agner <stefan@agner.ch>, Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Hines <srhines@google.com>

2018-09-19 2:16 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> On Mon, Sep 17, 2018 at 7:32 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> When using a GCC cross toolchain which is not in a compiled in
>> Clang search path, Clang reverts to the system assembler and
>> linker. This leads to assembler or linker errors, depending on
>> which tool is first used for a given architecture.
>>
>> It seems that Clang is not searching $PATH for a matching
>> assembler or linker.
>
> Yes, Clang uses what's called a sysroot, which is meant to be more
> hygenic than $PATH, IIUC.  This is surprising to folks familiar with
> $PATH, but really helps include the correct headers and use the
> correct toolchain when cross compiling, at the cost of freedom to put
> the cross toolchain wherever in the filesystem. (this is my
> understanding of sysroot, I just learned about it yesterday, so take
> this with a grain of salt).
>
>>
>> Make sure that Clang picks up the correct assembler or linker by
>> passing the cross compilers bin directory as search path.
>>
>> This allows to use Clang provided by distributions with GCC
>> toolchains not in /usr/bin.
>
> IIUC, its just utilities in binutils we're using (as, bfd.ld,
> objcopy), not GCC, but maybe that's just being pedantic.
>
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/78
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> Nick, I removed your Reviewed-by since I had to change variable
>> assignment slightly...
>
> Yes, thank you, that's the right thing to do.
>
>>
>>  Makefile | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 4d5c883a98e5..d5de2db4b549 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -495,13 +495,15 @@ endif
>>  ifeq ($(cc-name),clang)
>>  ifneq ($(CROSS_COMPILE),)
>>  CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
>> -GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
>> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
>> +CLANG_PREFIX   := --prefix=$(GCC_TOOLCHAIN_DIR)
>
> Yep: https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-b-dir
>
>> +GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>>  endif
>>  ifneq ($(GCC_TOOLCHAIN),)
>>  CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
>>  endif
>> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>> +KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>> +KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>>  KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
>>  KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
>>  endif
>> --
>> 2.19.0
>>
>
> Thanks for this patch Stefan.
> Reviewed-and-tested-by: Nick Desaulniers <ndesaulniers@google.com>
> --
> Thanks,
> ~Nick Desaulniers




Applied to linux-kbuild/fixes. Thanks!

-- 
Best Regards
Masahiro Yamada
