Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31082 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753373AbeE3O6G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 10:58:06 -0400
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com [209.85.213.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w4UEvqa5031184
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 23:57:53 +0900
Received: by mail-vk0-f44.google.com with SMTP id s63-v6so9419266vkh.9
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 07:57:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87o9gxyzpo.fsf@concordia.ellerman.id.au>
References: <20180530121922.22122-1-npiggin@gmail.com> <87o9gxyzpo.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 May 2018 23:57:11 +0900
Message-ID: <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

2018-05-30 23:39 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Nicholas Piggin <npiggin@gmail.com> writes:
>
>> This series of patches improves th powerpc kbuild system. The
>> motivation was to to be compatible with the new Kconfig scripting
>> language that Yamada-san has implemented here for merge:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=kconfig
>>
>> I have tested on top of that tree, powerpc now builds there.
>>
>> To avoid build breakage, the first 3 patches must go before the
>> kconfig change, and the 4th patch must go after it.
>>
>> v5 changes:
>> - Patch 4 update to syntax changed since kconfig-shell-v3 release.
>> - Patch 4 suggestions from Masahiro Yamada, remove unnecessary "OK"
>>   output from check mprofile script, and fold CC_USING_MPROFILE_KERNEL
>>   into CONFIG_MPROFILE_KERNEL.
>> - Reduce whitespace disturbance in patch 1.
>
> I've put this series in a topic branch.
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kbuild


No, you can't.

This series depends on my Kconfig work.

You queued it up on v4.17-rc3,
but necessary patches are not there.

You will get build errors.


>
> I'll plan to merge the first three into the powerpc tree.

Please do not do this.

You can issue Acked-by instead.


I need all the 4 patches to my tree.
Otherwise, the git-bisect'ability breaks for PowerPC.

See, the PPC breakage report from Stephen Rothwell
https://lkml.org/lkml/2018/5/29/1296




> Masahiro, are you planning to merge your kconfig changes for 4.18? If so
> you could merge the whole branch and everything should merge nicely.

Yes.

I already queued my and Nicholas' patches.

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild kconfig


Nicholas,

Please check if the patch order is correct.


I need to insert 'powerpc/kbuild' patches between.



> cheers
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
