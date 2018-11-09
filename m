Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44599 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbeKJEQM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 23:16:12 -0500
Received: by mail-pg1-f194.google.com with SMTP id w3-v6so1184431pgs.11
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Nov 2018 10:34:25 -0800 (PST)
Subject: Re: [PATCH v2 2/2] kbuild: consolidate Clang compiler flags
References: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
 <1541473495-25262-2-git-send-email-yamada.masahiro@socionext.com>
 <CAKwvOd=JwjVu=uk3egVJxTm9vPcF=Jx2Bexx1Wx=Z-PC38X3Uw@mail.gmail.com>
From: Greg Hackmann <ghackmann@google.com>
Message-ID: <9c4868dd-82fa-aa5c-843e-e1f78ffbc7e2@google.com>
Date: Fri, 9 Nov 2018 10:34:22 -0800
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=JwjVu=uk3egVJxTm9vPcF=Jx2Bexx1Wx=Z-PC38X3Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, Matthias Kaehlcke <mka@chromium.org>, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>

On 11/09/2018 10:29 AM, Nick Desaulniers wrote:
> On Mon, Nov 5, 2018 at 7:05 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Collect basic Clang options such as --target, --prefix, --gcc-toolchain,
>> -no-integrated-as into a single variable CLANG_FLAGS so that it can be
>> easily reused in other parts of Makefile.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v2:
>>   - Use := flavor instead of = because $(CLANG_FLAGS) is expanded soon anyway
>>
>>   Makefile | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index da11700..e173a73 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -487,18 +487,17 @@ endif
>>
>>   ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>>   ifneq ($(CROSS_COMPILE),)
>> -CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
>> +CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
>>   GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
>> -CLANG_PREFIX   := --prefix=$(GCC_TOOLCHAIN_DIR)
>> +CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
>>   GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>>   endif
>>   ifneq ($(GCC_TOOLCHAIN),)
>> -CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
>> +CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>>   endif
>> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>> -KBUILD_CFLAGS += -no-integrated-as
>> -KBUILD_AFLAGS += -no-integrated-as
>> +CLANG_FLAGS    += -no-integrated-as
>> +KBUILD_CFLAGS  += $(CLANG_FLAGS)
>> +KBUILD_AFLAGS  += $(CLANG_FLAGS)
>>   endif
>>
>>   RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
>> --
>> 2.7.4
>>
> 
> Thanks for this patch, Masahiro, it's a good simplification.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> Would you mind waiting for a tested-by from Stefan, and maybe an ack
> from Greg (added to cc)?
> 

Acked-by: Greg Hackmann <ghackmann@google.com>
