Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:56587 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751365AbdJ3Gvr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 02:51:47 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT56EEHbQguD1pbFiurU9MMa55WAUptX16KWhpOOF_BHg@mail.gmail.com>
References: <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
 <20171027201345.87383-1-ndesaulniers@google.com> <CAK7LNAT56EEHbQguD1pbFiurU9MMa55WAUptX16KWhpOOF_BHg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 30 Oct 2017 15:50:44 +0900
Message-ID: <CAK7LNAQuZ3iWB+_RSh5hCTundm4-rfCP2WzmnkdzLNSQYzaG0w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Douglas Anderson <dianders@chromium.org>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Mark Charlebois <charlebm@gmail.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-29 0:00 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2017-10-28 5:13 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
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
>> ---
>> Changes since v1:
>> * base patch off of
>>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>>   kbuild branch, per Masahiro.
>> * Use $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) rather than $(CLANG_TRIPLE), per
>>   Masahiro.
>>
>>  scripts/Kbuild.include | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index 064f477dfdca..0f09e4508554 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -228,12 +228,13 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
>>  # cc-ldoption
>>  # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
>>  cc-ldoption = $(call try-run-cached,\
>> -       $(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
>> +       $(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
>>
>>  # ld-option
>>  # Usage: LDFLAGS += $(call ld-option, -X)
>>  ld-option = $(call try-run-cached,\
>> -       $(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
>> +       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -x c /dev/null -c -o "$$TMPO"; \
>> +       $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
>>
>>  # ar-option
>>  # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
>> --
>> 2.15.0.rc2.357.g7e34df9404-goog
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> Applied to linux-kbuild/kbuild.  Thanks!



I do not know the cause of the problem reported by the 0-day bot, but
if the problem happens in the following line,

ifeq ($(CONFIG_X86_32),y)
LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
else



Does the following solve the issue?    (adding $(LDFLAGS))

ld-option = $(call try-run,\
        $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -x c /dev/null -c
-o "$$TMPO"; \
        $(LD) $(LDFLAGS) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))




-- 
Best Regards
Masahiro Yamada
