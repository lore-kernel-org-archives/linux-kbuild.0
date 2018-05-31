Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26265 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750974AbeEaFBD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 May 2018 01:01:03 -0400
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com [209.85.213.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w4V50rnS031736
        for <linux-kbuild@vger.kernel.org>; Thu, 31 May 2018 14:00:54 +0900
Received: by mail-vk0-f51.google.com with SMTP id s187-v6so745329vke.9
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 22:00:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87k1rkzbry.fsf@concordia.ellerman.id.au>
References: <20180530121922.22122-1-npiggin@gmail.com> <87o9gxyzpo.fsf@concordia.ellerman.id.au>
 <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com> <87k1rkzbry.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 31 May 2018 14:00:12 +0900
Message-ID: <CAK7LNARbz8YC7=vB_Pt-FFepLfLY-Yt=8ZiOAoPeZV3EA3VQOg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

2018-05-31 13:31 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> 2018-05-30 23:39 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>
>>>> This series of patches improves th powerpc kbuild system. The
>>>> motivation was to to be compatible with the new Kconfig scripting
>>>> language that Yamada-san has implemented here for merge:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=kconfig
>>>>
>>>> I have tested on top of that tree, powerpc now builds there.
>>>>
>>>> To avoid build breakage, the first 3 patches must go before the
>>>> kconfig change, and the 4th patch must go after it.
>>>>
>>>> v5 changes:
>>>> - Patch 4 update to syntax changed since kconfig-shell-v3 release.
>>>> - Patch 4 suggestions from Masahiro Yamada, remove unnecessary "OK"
>>>>   output from check mprofile script, and fold CC_USING_MPROFILE_KERNEL
>>>>   into CONFIG_MPROFILE_KERNEL.
>>>> - Reduce whitespace disturbance in patch 1.
>>>
>>> I've put this series in a topic branch.
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kbuild
>>
>>
>> No, you can't.
>>
>> This series depends on my Kconfig work.
>
> The *last* commit depends on your work, the rest do not.
>
>> You queued it up on v4.17-rc3,
>> but necessary patches are not there.
>>
>> You will get build errors.
>
> I do not get any build errors for the first three commits.


Right, the first three are fine.

If we make sure commit cfff26c2dc7a1
does not appear in Linus' tree,
we are good.




>>> I'll plan to merge the first three into the powerpc tree.
>>
>> Please do not do this.
>>
>> You can issue Acked-by instead.
>
> I'd prefer the first three commits were in my tree so they're tested
> properly.
>
>> I need all the 4 patches to my tree.
>> Otherwise, the git-bisect'ability breaks for PowerPC.
>
> You should merge all 4 into your tree, ie. all of my topic/kbuild
> branch.

This depends on what "merge" means.

If it means "git pull", I cannot pull your topic/kbuild branch
since it is broken.



masahiro@pug:~/ref/linux-ppc$ git log -1
commit cfff26c2dc7a18a4d10366896a68fb0ef9c793cb
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Wed May 30 22:19:22 2018 +1000

    powerpc/kbuild: move -mprofile-kernel check to Kconfig

    This eliminates the workaround that requires disabling
    -mprofile-kernel by default in Kconfig.

    [ Note: this depends on
https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kconfig-shell-v3 ]

    Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
masahiro@pug:~/ref/linux-ppc$ make ARCH=powerpc  ppc64_defconfig
arch/powerpc/Kconfig:465:warning: ignoring unsupported character '$'
arch/powerpc/Kconfig:465:warning: ignoring unsupported character ','
arch/powerpc/Kconfig:465:warning: ignoring unsupported character '$'
arch/powerpc/Kconfig:466: syntax error
arch/powerpc/Kconfig:465:warning: ignoring unsupported character '$'
arch/powerpc/Kconfig:465:warning: ignoring unsupported character '$'
arch/powerpc/Kconfig:465: invalid option
scripts/kconfig/Makefile:122: recipe for target 'ppc64_defconfig' failed
make[1]: *** [ppc64_defconfig] Error 1
Makefile:525: recipe for target 'ppc64_defconfig' failed
make: *** [ppc64_defconfig] Error 2





So, how do you want me to handle the last patch?

I can pull the first three from your branch,
then I can cherry-pick the last one on top of my kconfig tree.

Is this what you mean?



> And, I'll merge the first 3 into my tree.
>
> There should be no bisection breakage as a result.
>
> cheers
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
