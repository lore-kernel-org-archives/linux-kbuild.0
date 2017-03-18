Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62666 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdCRNO6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Mar 2017 09:14:58 -0400
MIME-Version: 1.0
In-Reply-To: <ba676afc-d52c-5f79-1794-2b751054bf53@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20170310175854.GE18894@arm.com>
 <ba676afc-d52c-5f79-1794-2b751054bf53@suse.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Mar 2017 22:14:41 +0900
Message-ID: <CAK7LNAToohT8a0Xz2Jh53PFcU5e8gCie+ktYhB_j1wzNhRF--A@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: Use full path in KBUILD_IMAGE definition
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Will, Michal,

2017-03-11 6:20 GMT+09:00 Michal Marek <mmarek@suse.com>:
> Dne 10.3.2017 v 18:58 Will Deacon napsal(a):
>> Hi Michael,
>>
>> On Tue, Nov 22, 2016 at 10:34:29PM +0100, Michal Marek wrote:
>>> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
>>> expect it to point to the image file in the build directory. The
>>> builddeb script has a workaround for architectures which only provide
>>> the basename, but let's provide a clean interface for packaging tools.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will.deacon@arm.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Signed-off-by: Michal Marek <mmarek@suse.com>
>>> ---
>>>  arch/arm64/Makefile | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> What's the plan for this patch? I'm happy to merge it,
>
> Great, please merge it.
>
>
>> but I don't see
>> the rest of the series queued anywhere.
>
> I'll see what remains and submit the rest via the kbuild tree.
>
> Thanks,
> Michal
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


I like this approach, rather than fixing scripts/package/mkspec.


So, how shall we handle this series?


I am OK with getting 1/6 in through arm64 tree,
but 6/6 will be postponed in the case.



If Will issues Acked-by, I can pick-up the whole series
to linux-kbuild.




-- 
Best Regards
Masahiro Yamada
