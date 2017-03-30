Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19166 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933443AbdC3PnH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Mar 2017 11:43:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a101M6u2hjkEh47t5ZWfpGk80uHuFYFgfJi+vCLmvzaQg@mail.gmail.com>
References: <20170314213410.3762842-1-arnd@arndb.de> <20170314213724.3836900-1-arnd@arndb.de>
 <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com> <CAK8P3a101M6u2hjkEh47t5ZWfpGk80uHuFYFgfJi+vCLmvzaQg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Mar 2017 00:42:39 +0900
Message-ID: <CAK7LNASJU0rQ2oiGnoi7knNvqLGvT8FryJJ4-ap+7isHuuBnsQ@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20170314] [v333kbuild: disable
 -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung.with.foss@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Arnd,

2017-03-29 18:30 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wed, Mar 29, 2017 at 4:07 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi Arnd,
>>
>>
>> 2017-03-15 6:37 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>>> When ftrace is enabled and we build with gcc-4.7 or older, we
>>> get a warning for each file on architectures that select
>>> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:
>>>
>>> warning: -ffunction-sections disabled; it makes profiling impossible [e=
nabled by default]
>>>
>>> This turns off function sections in that specific case, leaving
>>> it enabled for all other configurations.
>>>
>>> Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data=
 elimination")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Namhyung Kim <namhyung.with.foss@gmail.com>
>>> ---
>>> v2: accidentally resend the same patch as before
>>> v3: send the exact same patch once more, without doing the change I wan=
ted
>>> v4: actually fixed version number in check as pointed out by Namhyung K=
im (I hope)
>>> ---
>>>  Makefile | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 6e7e644a0b84..3a964fa3a787 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -662,7 +662,11 @@ KBUILD_CFLAGS      +=3D -Wextra
>>>  KBUILD_CFLAGS  +=3D $(call cc-disable-warning,frame-address,)
>>>
>>>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
>>> +ifdef CONFIG_FUNCTION_TRACER
>>> +KBUILD_CFLAGS  +=3D $(call cc-ifversion, -ge,0408,$(call cc-option,-ff=
unction-sections,))
>>> +else
>>>  KBUILD_CFLAGS  +=3D $(call cc-option,-ffunction-sections,)
>>> +endif
>>>  KBUILD_CFLAGS  +=3D $(call cc-option,-fdata-sections,)
>>>  endif
>>>
>>
>>
>> I have two questions.
>>
>> [1]
>> How did you produce this warning?
>> I do not see any architecture that selects this option at this point of =
time.
>
> I saw it on ARM randconfig builds
>
>> Did you edit Kconfig locally to select LD_DEAD_CODE_DATA_ELIMINATION?
>> If so, is this patch not so urgent as the "Fixes" tag claims?
>
> Good point, I forgot that I had enabled this manually on ARM in an
> earlier patch in my randconfig-fixup series. I thought this was selected
> on powerpc, but that part of Nick's series apparently didn't make it in
> yet.
>
> I don't see the 'Fixes' tag as claiming the patch to be urgent, just
> documenting what patch introduced the problem, but you could
> argue here that it only gets introduced by a future patch that
> actually selects the symbol.

I won't argue.  Fixes is reviewer-friendly
for finding the related commit.

I just personally used the "Fix" keyword as a hint for priority
because there are still many kbuild patches piled up,
and I have not been able to catch up yet.



>> [2]
>> This question is more technical.
>>
>> The cause of the problem seems that GCC warns it cannot support the
>> two at the same time,
>> but it does handle it as an error.  So, cc-option assumes this
>> combination is OK.
>>
>> Is it a good idea to add -Werror to cc-option checking?
>
> Hmm, I've actually been running with that change as a side-effect
> of having the llvmlinux patches applied, which contain this one:
>
> commit 03497934e211325fc2913476897daf7a5ddb008a
> Author: Mark Charlebois <charlebm@gmail.com>
> Date:   Mon Sep 22 14:33:05 2014 -0700
>
>     kbuild, LLVMLinux: Add -Werror to cc-option to support clang
>
>     Clang will warn about unknown warnings but will not return false
>     unless -Werror is set. GCC will return false if an unknown
>     warning is passed.
>
>     Adding -Werror make both compiler behave the same.
>
>     Signed-off-by: Mark Charlebois <charlebm@gmail.com>
>     Signed-off-by: Behan Webster <behanw@converseincode.com>
>     Reviewed-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 285acc57c0a4..3629bd9c7e79 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -116,12 +116,12 @@ CC_OPTION_CFLAGS =3D $(filter-out
> $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>  # Usage: cflags-y +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di58=
6)
>
>  cc-option =3D $(call try-run,\
> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
> /dev/null -o "$$TMP",$(1),$(2))
> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
> -x c /dev/null -o "$$TMP",$(1),$(2))
>
>  # cc-option-yn
>  # Usage: flag :=3D $(call cc-option-yn,-march=3Dwinchip-c6)
>  cc-option-yn =3D $(call try-run,\
> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
> /dev/null -o "$$TMP",y,n)
> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
> -x c /dev/null -o "$$TMP",y,n)
>
>  # cc-option-align
>  # Prefix align with either -falign or -malign
> @@ -131,7 +131,7 @@ cc-option-align =3D $(subst -functions=3D0,,\
>  # cc-disable-warning
>  # Usage: cflags-y +=3D $(call cc-disable-warning,unused-but-set-variable=
)
>  cc-disable-warning =3D $(call try-run,\
> -       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1))
> -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip
> $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>
>  # cc-name
>  # Expands to either gcc or clang
>
> This is identical to your version, except it applies the same
> thing to cc-disable-warning.

Ah, I see.

I'm also moving
KBUILD_CFLAGS  +=3D $(call cc-option,-ffunction-sections,)
below
CC_FLAGS_FTRACE :=3D -pg
to fix the warning.




> I think this is good to get merged,
> and there are probably a couple of other patches in that series
> that we may want to look at again.


I agree.


At least, 03497934e21 looks good to be merged.
(I need to get access to Mark, and ask him to send this patch.)

Then, swap the -ffunction-sections and -pg order.

I hope this will make you and clang guys happy.


--=20
Best Regards
Masahiro Yamada
