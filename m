Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:55558 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752943AbdKIQvn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 11:51:43 -0500
Received: by mail-lf0-f65.google.com with SMTP id e143so7966786lfg.12
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Nov 2017 08:51:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS90eS+5m2LG_XYAva2Hy2usTX-=HuD6JwMny77V==jWw@mail.gmail.com>
References: <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
 <20171107194614.89371-1-ndesaulniers@google.com> <CAK7LNAS90eS+5m2LG_XYAva2Hy2usTX-=HuD6JwMny77V==jWw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 Nov 2017 08:51:40 -0800
Message-ID: <CAKwvOdnsmx43ocFqCLc5ymWkMP8mfju7w0TNbnKmzcbTn3=MAg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 8:31 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-11-08 4:46 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
>> We didn't notice this problem on Android, because we took the original
>> LLVMLinux patch into our 4.4 kernels, which did not have this issue. We
>> ran into this taking the proper upstream patch on newer kernel versions.
>> The original LLVMLinux patch can be seen at:
>>
>> http://git.linuxfoundation.org/?p=llvmlinux/kernel.git;a=blobdiff;f=Makefile;h=389006c4ef494cda3a1ee52bf355618673ab4f31;hp=e41a3356abee83f08288362950bfceebd25ec3c2;hb=ef9126da11b18ff34eb1f01561f53c378860336c;hpb=f800c25b7a762d445ba1439a2428c8362157eba6
>>
>> It seems that when the patch was re-upstreamed, a V2 was requested that
>> moved the definition of Clang's target triple to be later in the top
>> level Makefile than the inclusion of the arch specific Makefile,
>> breaking macros like ld-option when cross compiling. V2 was requested
>> at:
>>
>> https://lkml.org/lkml/2017/4/21/116
>
> IMO, this description is not helpful in any way in upstream.
>
> Moreover,
> 785f11aa595bc3d4e74096cbd598ada54ecc0d81
> did not break anything.   It sound unfair to me.

Ok, I will cut that part description on v3.

>> diff --git a/Makefile b/Makefile
>> index a7476e6934f1..d349734c7ef7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -472,6 +472,38 @@ ifneq ($(KBUILD_SRC),)
>>             $(srctree) $(objtree) $(VERSION) $(PATCHLEVEL)
>>  endif
>>
>> +ifeq ($(cc-name),clang)
>> +ifneq ($(CROSS_COMPILE),)
>> +CLANG_TARGET   := -target $(notdir $(CROSS_COMPILE:%-=%))
>> +GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
>> +endif
>> +ifneq ($(GCC_TOOLCHAIN),)
>> +CLANG_GCC_TC   := -gcc-toolchain $(GCC_TOOLCHAIN)
>> +endif
>> +KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>> +KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>> +KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>> +# Quiet clang warning: comparison of unsigned expression < 0 is always false
>> +KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>> +# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>> +# source of a reference will be _MergedGlobals and not on of the whitelisted names.
>> +# See modpost pattern 2
>> +KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
>> +KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>> +KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
>> +KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
>> +else
>> +
>> +# These warnings generated too much noise in a regular build.
>> +# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>> +endif
>> +
>
>
> Could you move this a bit later, please?
>
>
>
> # These warnings generated too much noise in a regular build.
> # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> endif
>
>   << INSERT HERE >>
>
> # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
> # values of the respective KBUILD_* variables
> ARCH_CPPFLAGS :=
> ARCH_AFLAGS :=
> ARCH_CFLAGS :=
> include arch/$(SRCARCH)/Makefile
>
>
>
>
>
>
> arch/$(SRCARCH)/Makefile is included for config targets
> for KBUILD_DEFCONFIG, but no reason to compute compiler flags.
> I want to cut unnecessary cc-option parsing.

With the new try-run-cached macros, if the arch/$(SRCARCH)/Makefile
gets included twice, with the compiler flags not set correctly for
clang to cross compile, and the results are cached, wont they be wrong
the second time the arch specific Makefile is included?
