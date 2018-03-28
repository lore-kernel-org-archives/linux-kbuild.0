Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51490 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbeC1DVk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:21:40 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJMEG6WZo8qEjGpFBkU7FkjyFbjf5diZqa8sz+XqCxHuQ@mail.gmail.com>
References: <1522204848-11803-1-git-send-email-yamada.masahiro@socionext.com> <CAGXu5jJMEG6WZo8qEjGpFBkU7FkjyFbjf5diZqa8sz+XqCxHuQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 28 Mar 2018 12:20:33 +0900
Message-ID: <CAK7LNAQ69JWJU_RJzr39b4gtF1ss-qm_b_AzLBFf2+m2-bx+Xg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move <linux/compiler_types.h> out of <linux/kconfig.h>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Michal Marek <michal.lkml@markovi.net>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

2018-03-28 12:10 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Tue, Mar 27, 2018 at 7:40 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Since commit 28128c61e08e ("kconfig.h: Include compiler types to avoid
>> missed struct attributes"), <linux/kconfig.h> pulls in kernel-space
>> headers to unrelated file.
>>
>> Commit 0f9da844d877 ("MIPS: boot: Define __ASSEMBLY__ for its.S build")
>> suppressed the build error by defining __ASSEMBLY__, but ITS (i.e. DTS)
>> is not assembly, and should not include <linux/compiler_types.h> in the
>> first place.
>>
>> Looking at arch/s390/tools/Makefile, host programs gen_facilities and
>> gen_opcode_table now pull in <linux/compiler_types.h> as well.
>>
>> The motivation for that commit was to define necessary attributes
>> before any struct is defined.  Obviously, this happens only in C.
>>
>> It is enough to include <linux/compiler_types.h> only when compiling
>> C files, and only when compiling kernel space.
>>
>> Move the <linux/compiler_types.h> inclusion to c_flags.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> I will also send a correct fix-up for MIPS Makefile later.
>
> As long as the result is the same: it's impossible to define a
> structure without defined attributes, I'm fine with it. :)
>
> Question below...
>
>>
>>
>>
>>  include/linux/kconfig.h | 3 ---
>>  scripts/Makefile.lib    | 1 +
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
>> index dcde947..cc8fa10 100644
>> --- a/include/linux/kconfig.h
>> +++ b/include/linux/kconfig.h
>> @@ -70,7 +70,4 @@
>>   */
>>  #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
>>
>> -/* Make sure we always have all types and struct attributes defined. */
>> -#include <linux/compiler_types.h>
>> -
>>  #endif /* __LINUX_KCONFIG_H */
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index c114ce5..07d0740 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -152,6 +152,7 @@ __cpp_flags     = $(call flags,_cpp_flags)
>>  endif
>>
>>  c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>> +                -include $(srctree)/include/linux/compiler_types.h       \
>
> Why here instead of adding it to LINUXINCLUDE ?
>


LINUXINCLUDE contains '-include $(srctree)/include/linux/kconfig.h'

If you add compier_types.h there, nothing would change.


My intention is to include <linux/compiler_types.h> only for C.
Not assembly, linker scripts, or anything else.






-- 
Best Regards
Masahiro Yamada
