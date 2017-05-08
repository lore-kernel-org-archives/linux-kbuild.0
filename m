Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:39960 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751057AbdEHI3c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 May 2017 04:29:32 -0400
MIME-Version: 1.0
In-Reply-To: <20170504195034.GZ128305@google.com>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-3-mka@chromium.org>
 <CAK7LNATD-KbP6GtV_j6NMgcPQYRigz5pA8fdos7hQSzQpL8czw@mail.gmail.com> <20170504195034.GZ128305@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 May 2017 17:29:14 +0900
Message-ID: <CAK7LNARykfPkKg8GR6a-kThRXt7Nuog6xe53esRHS-V_wcGGmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

Hi Matthias,


2017-05-05 4:50 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Hi Masahiro,
>
> El Sun, Apr 30, 2017 at 11:01:11PM +0900 Masahiro Yamada ha dit:
>
>> 2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>> > clang generates plenty of these warnings in different parts of the code.
>> > They are mostly caused by container_of() and other macros which declare
>> > a "const <type> *" variable for their internal use which triggers a
>> > "duplicate 'const' specifier" warning if the <type> is already const
>> > qualified.
>> >
>> > Wording-mostly-from: Michael Davidson <md@google.com>
>> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>>
>>
>>
>> I think container_of() can be more simple,
>> dropping the 'const'.
>>
>> The following patch worked for me.
>>
>>
>> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
>> index 4c26dc3..d53672b 100644
>> --- a/include/linux/kernel.h
>> +++ b/include/linux/kernel.h
>> @@ -846,11 +846,9 @@ static inline void ftrace_dump(enum
>> ftrace_dump_mode oops_dump_mode) { }
>>   * @ptr:       the pointer to the member.
>>   * @type:      the type of the container struct this is embedded in.
>>   * @member:    the name of the member within the struct.
>> - *
>>   */
>>  #define container_of(ptr, type, member) ({                     \
>> -       const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
>> -       (type *)( (char *)__mptr - offsetof(type,member) );})
>> +       (type *)((void *)(ptr) - offsetof(type, member));})
>>
>>  /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
>>  #ifdef CONFIG_FTRACE_MCOUNT_RECORD
>
> Thanks, this eliminates indeed a huge amount of these warnings.


I noticed this solution will drop precious type checking
from container_of().  So, my workaround is not nice.



> The other big source of warnings is MODULE_DEVICE_TABLE which declares
> a const alias of a type that in most cases is already const. One possible
> solution would be to remove the 'additional' const qualifier, which
> might leave some tables non-const. Another option could be some
> hackery to suppress the warning just for the macro. Not sure if any of
> this would be acceptable.

Me neither.


>> For also this one,
>> I'd like to try to fix the code rather than hiding warnings.
>
> I totally agree with the general approach. My clang kernel builds
> started with plenty of warnings disabled. I fixed the code for most of
> them until I was left with these two extremely noisy ones, for which I
> didn't see a clear path.


If we do not come up with a good solution,
I will pick up this patch.





-- 
Best Regards
Masahiro Yamada
