Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35791 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755666AbdC2Ja7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Mar 2017 05:30:59 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com>
References: <20170314213410.3762842-1-arnd@arndb.de> <20170314213724.3836900-1-arnd@arndb.de>
 <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Mar 2017 11:30:57 +0200
Message-ID: <CAK8P3a101M6u2hjkEh47t5ZWfpGk80uHuFYFgfJi+vCLmvzaQg@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20170314] [v333kbuild: disable
 -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung.with.foss@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Mar 29, 2017 at 4:07 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Arnd,
>
>
> 2017-03-15 6:37 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> When ftrace is enabled and we build with gcc-4.7 or older, we
>> get a warning for each file on architectures that select
>> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:
>>
>> warning: -ffunction-sections disabled; it makes profiling impossible [en=
abled by default]
>>
>> This turns off function sections in that specific case, leaving
>> it enabled for all other configurations.
>>
>> Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data =
elimination")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Namhyung Kim <namhyung.with.foss@gmail.com>
>> ---
>> v2: accidentally resend the same patch as before
>> v3: send the exact same patch once more, without doing the change I want=
ed
>> v4: actually fixed version number in check as pointed out by Namhyung Ki=
m (I hope)
>> ---
>>  Makefile | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 6e7e644a0b84..3a964fa3a787 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -662,7 +662,11 @@ KBUILD_CFLAGS      +=3D -Wextra
>>  KBUILD_CFLAGS  +=3D $(call cc-disable-warning,frame-address,)
>>
>>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
>> +ifdef CONFIG_FUNCTION_TRACER
>> +KBUILD_CFLAGS  +=3D $(call cc-ifversion, -ge,0408,$(call cc-option,-ffu=
nction-sections,))
>> +else
>>  KBUILD_CFLAGS  +=3D $(call cc-option,-ffunction-sections,)
>> +endif
>>  KBUILD_CFLAGS  +=3D $(call cc-option,-fdata-sections,)
>>  endif
>>
>
>
> I have two questions.
>
> [1]
> How did you produce this warning?
> I do not see any architecture that selects this option at this point of t=
ime.

I saw it on ARM randconfig builds

> Did you edit Kconfig locally to select LD_DEAD_CODE_DATA_ELIMINATION?
> If so, is this patch not so urgent as the "Fixes" tag claims?

Good point, I forgot that I had enabled this manually on ARM in an
earlier patch in my randconfig-fixup series. I thought this was selected
on powerpc, but that part of Nick's series apparently didn't make it in
yet.

I don't see the 'Fixes' tag as claiming the patch to be urgent, just
documenting what patch introduced the problem, but you could
argue here that it only gets introduced by a future patch that
actually selects the symbol.

> [2]
> This question is more technical.
>
> The cause of the problem seems that GCC warns it cannot support the
> two at the same time,
> but it does handle it as an error.  So, cc-option assumes this
> combination is OK.
>
> Is it a good idea to add -Werror to cc-option checking?

Hmm, I've actually been running with that change as a side-effect
of having the llvmlinux patches applied, which contain this one:

commit 03497934e211325fc2913476897daf7a5ddb008a
Author: Mark Charlebois <charlebm@gmail.com>
Date:   Mon Sep 22 14:33:05 2014 -0700

    kbuild, LLVMLinux: Add -Werror to cc-option to support clang

    Clang will warn about unknown warnings but will not return false
    unless -Werror is set. GCC will return false if an unknown
    warning is passed.

    Adding -Werror make both compiler behave the same.

    Signed-off-by: Mark Charlebois <charlebm@gmail.com>
    Signed-off-by: Behan Webster <behanw@converseincode.com>
    Reviewed-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 285acc57c0a4..3629bd9c7e79 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -116,12 +116,12 @@ CC_OPTION_CFLAGS =3D $(filter-out
$(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 # Usage: cflags-y +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di586)

 cc-option =3D $(call try-run,\
-       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
/dev/null -o "$$TMP",$(1),$(2))
+       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
-x c /dev/null -o "$$TMP",$(1),$(2))

 # cc-option-yn
 # Usage: flag :=3D $(call cc-option-yn,-march=3Dwinchip-c6)
 cc-option-yn =3D $(call try-run,\
-       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
/dev/null -o "$$TMP",y,n)
+       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
-x c /dev/null -o "$$TMP",y,n)

 # cc-option-align
 # Prefix align with either -falign or -malign
@@ -131,7 +131,7 @@ cc-option-align =3D $(subst -functions=3D0,,\
 # cc-disable-warning
 # Usage: cflags-y +=3D $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning =3D $(call try-run,\
-       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1))
-c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip
$(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))

 # cc-name
 # Expands to either gcc or clang

This is identical to your version, except it applies the same
thing to cc-disable-warning. I think this is good to get merged,
and there are probably a couple of other patches in that series
that we may want to look at again.

   Arnd
