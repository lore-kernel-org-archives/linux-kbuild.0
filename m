Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63849 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753475AbeEaNJP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 May 2018 09:09:15 -0400
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com [209.85.213.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w4VD9DK7020200
        for <linux-kbuild@vger.kernel.org>; Thu, 31 May 2018 22:09:13 +0900
Received: by mail-vk0-f45.google.com with SMTP id 200-v6so11207931vkc.0
        for <linux-kbuild@vger.kernel.org>; Thu, 31 May 2018 06:09:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <876034yrek.fsf@concordia.ellerman.id.au>
References: <20180530121922.22122-1-npiggin@gmail.com> <87o9gxyzpo.fsf@concordia.ellerman.id.au>
 <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com>
 <87k1rkzbry.fsf@concordia.ellerman.id.au> <CAK7LNARbz8YC7=vB_Pt-FFepLfLY-Yt=8ZiOAoPeZV3EA3VQOg@mail.gmail.com>
 <876034yrek.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 31 May 2018 22:08:31 +0900
Message-ID: <CAK7LNASxgQOsSveFuKrx7do-+643KUZwU_Gn+z7O7JK+TtMEww@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

2018-05-31 20:51 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> 2018-05-31 13:31 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
>>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>>> 2018-05-30 23:39 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
>>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>>
>>>>>> This series of patches improves th powerpc kbuild system. The
>>>>>> motivation was to to be compatible with the new Kconfig scripting
>>>>>> language that Yamada-san has implemented here for merge:
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=kconfig
>>>>>>
>>>>>> I have tested on top of that tree, powerpc now builds there.
>>>>>>
>>>>>> To avoid build breakage, the first 3 patches must go before the
>>>>>> kconfig change, and the 4th patch must go after it.
>>>>>>
>>>>>> v5 changes:
>>>>>> - Patch 4 update to syntax changed since kconfig-shell-v3 release.
>>>>>> - Patch 4 suggestions from Masahiro Yamada, remove unnecessary "OK"
>>>>>>   output from check mprofile script, and fold CC_USING_MPROFILE_KERNEL
>>>>>>   into CONFIG_MPROFILE_KERNEL.
>>>>>> - Reduce whitespace disturbance in patch 1.
>>>>>
>>>>> I've put this series in a topic branch.
>>>>>
>>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kbuild
>>>>
>>>>
>>>> No, you can't.
>>>>
>>>> This series depends on my Kconfig work.
>>>
>>> The *last* commit depends on your work, the rest do not.
>>>
>>>> You queued it up on v4.17-rc3,
>>>> but necessary patches are not there.
>>>>
>>>> You will get build errors.
>>>
>>> I do not get any build errors for the first three commits.
>>
>>
>> Right, the first three are fine.
>>
>> If we make sure commit cfff26c2dc7a1
>> does not appear in Linus' tree,
>> we are good.
>
> Yep agreed.
>
>>>>> I'll plan to merge the first three into the powerpc tree.
>>>>
>>>> Please do not do this.
>>>>
>>>> You can issue Acked-by instead.
>>>
>>> I'd prefer the first three commits were in my tree so they're tested
>>> properly.
>>>
>>>> I need all the 4 patches to my tree.
>>>> Otherwise, the git-bisect'ability breaks for PowerPC.
>>>
>>> You should merge all 4 into your tree, ie. all of my topic/kbuild
>>> branch.
>>
>> This depends on what "merge" means.
>>
>> If it means "git pull", I cannot pull your topic/kbuild branch
>> since it is broken.
>
> Yeah OK I understand what you mean now.
>
>> So, how do you want me to handle the last patch?
>>
>> I can pull the first three from your branch,
>> then I can cherry-pick the last one on top of my kconfig tree.
>
> Yes, please do that.


OK. I will.



BTW, if you try to offer a little more kindness,
you may want to check some typos in the commit description.

I suspect some.
https://patchwork.kernel.org/patch/10438869/
https://patchwork.kernel.org/patch/10438873/


Also, the change logs could be dropped.

I see

Since v1: reworded changelog to explain the cause of the problem (thanks
Segher) and moved the flags into the 64-32 cross compile case.

or

Since v1: removed extra -EB in the recordmcount script (thanks mpe)


above your signed-off-by.


Of course, this is your call,
and you do not need to disturb the git history if it is too late.





-- 
Best Regards
Masahiro Yamada
