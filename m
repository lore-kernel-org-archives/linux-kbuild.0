Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33564 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932976AbdCaIsz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 04:48:55 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNASJU0rQ2oiGnoi7knNvqLGvT8FryJJ4-ap+7isHuuBnsQ@mail.gmail.com>
References: <20170314213410.3762842-1-arnd@arndb.de> <20170314213724.3836900-1-arnd@arndb.de>
 <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com>
 <CAK8P3a101M6u2hjkEh47t5ZWfpGk80uHuFYFgfJi+vCLmvzaQg@mail.gmail.com> <CAK7LNASJU0rQ2oiGnoi7knNvqLGvT8FryJJ4-ap+7isHuuBnsQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 31 Mar 2017 10:48:53 +0200
Message-ID: <CAK8P3a3ph=9f0LV1JoAhP8ZO4-9GGqmSmV6ajXZzw2zJPSXOPw@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20170314] [v333kbuild: disable
 -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung.with.foss@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Charlebois <charlebm@gmail.com>

On Thu, Mar 30, 2017 at 5:42 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-03-29 18:30 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> On Wed, Mar 29, 2017 at 4:07 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> 2017-03-15 6:37 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>>> [2]
>>> This question is more technical.
>>>
>>> The cause of the problem seems that GCC warns it cannot support the
>>> two at the same time,
>>> but it does handle it as an error.  So, cc-option assumes this
>>> combination is OK.
>>>
>>> Is it a good idea to add -Werror to cc-option checking?
>>
>> Hmm, I've actually been running with that change as a side-effect
>> of having the llvmlinux patches applied, which contain this one:
>>
>> commit 03497934e211325fc2913476897daf7a5ddb008a
>> Author: Mark Charlebois <charlebm@gmail.com>
>> Date:   Mon Sep 22 14:33:05 2014 -0700
>>
>>     kbuild, LLVMLinux: Add -Werror to cc-option to support clang
>>
>>     Clang will warn about unknown warnings but will not return false
>>     unless -Werror is set. GCC will return false if an unknown
>>     warning is passed.
>>
>>     Adding -Werror make both compiler behave the same.
>>
>>     Signed-off-by: Mark Charlebois <charlebm@gmail.com>
>>     Signed-off-by: Behan Webster <behanw@converseincode.com>
>>     Reviewed-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index 285acc57c0a4..3629bd9c7e79 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -116,12 +116,12 @@ CC_OPTION_CFLAGS =3D $(filter-out
>> $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>>  # Usage: cflags-y +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di5=
86)
>>
>>  cc-option =3D $(call try-run,\
>> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
>> /dev/null -o "$$TMP",$(1),$(2))
>> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
>> -x c /dev/null -o "$$TMP",$(1),$(2))
>>
>>  # cc-option-yn
>>  # Usage: flag :=3D $(call cc-option-yn,-march=3Dwinchip-c6)
>>  cc-option-yn =3D $(call try-run,\
>> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
>> /dev/null -o "$$TMP",y,n)
>> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
>> -x c /dev/null -o "$$TMP",y,n)
>>
>>  # cc-option-align
>>  # Prefix align with either -falign or -malign
>> @@ -131,7 +131,7 @@ cc-option-align =3D $(subst -functions=3D0,,\
>>  # cc-disable-warning
>>  # Usage: cflags-y +=3D $(call cc-disable-warning,unused-but-set-variabl=
e)
>>  cc-disable-warning =3D $(call try-run,\
>> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1))
>> -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip
>> $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>>
>>  # cc-name
>>  # Expands to either gcc or clang
>>
>> This is identical to your version, except it applies the same
>> thing to cc-disable-warning.
>
> Ah, I see.
>
> I'm also moving
> KBUILD_CFLAGS  +=3D $(call cc-option,-ffunction-sections,)
> below
> CC_FLAGS_FTRACE :=3D -pg
> to fix the warning.
>
>
>
>
>> I think this is good to get merged,
>> and there are probably a couple of other patches in that series
>> that we may want to look at again.
>
>
> I agree.
>
>
> At least, 03497934e21 looks good to be merged.
> (I need to get access to Mark, and ask him to send this patch.)
>
> Then, swap the -ffunction-sections and -pg order.
>
> I hope this will make you and clang guys happy.

I may have a number of clang related patches in the future,
and can also forward this patch. I suspect that Mark (added to
Cc) is currently not able to send a tested patch for the latest
kernel, he worked on it in 2014, but I don't think he's following
llvmlinux at the moment.

     Arnd
