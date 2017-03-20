Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37289 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753627AbdCTNwd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 09:52:33 -0400
MIME-Version: 1.0
In-Reply-To: <20170320121328.GH17263@arm.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20170310175854.GE18894@arm.com>
 <ba676afc-d52c-5f79-1794-2b751054bf53@suse.com> <CAK7LNAToohT8a0Xz2Jh53PFcU5e8gCie+ktYhB_j1wzNhRF--A@mail.gmail.com>
 <20170320121328.GH17263@arm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 20 Mar 2017 22:52:19 +0900
Message-ID: <CAK7LNATQ-xOLgCBosxkfvjPOkm419WDe=06z7+1LkBUaWHbL4w@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: Use full path in KBUILD_IMAGE definition
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>, Michal Marek <mmarek@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2017-03-20 21:13 GMT+09:00 Will Deacon <will.deacon@arm.com>:
> On Sat, Mar 18, 2017 at 10:14:41PM +0900, Masahiro Yamada wrote:
>> 2017-03-11 6:20 GMT+09:00 Michal Marek <mmarek@suse.com>:
>> > Dne 10.3.2017 v 18:58 Will Deacon napsal(a):
>> >> On Tue, Nov 22, 2016 at 10:34:29PM +0100, Michal Marek wrote:
>> >>> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
>> >>> expect it to point to the image file in the build directory. The
>> >>> builddeb script has a workaround for architectures which only provide
>> >>> the basename, but let's provide a clean interface for packaging tools.
>> >>>
>> >>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> >>> Cc: Will Deacon <will.deacon@arm.com>
>> >>> Cc: linux-arm-kernel@lists.infradead.org
>> >>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> >>> ---
>> >>>  arch/arm64/Makefile | 6 +++---
>> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> What's the plan for this patch? I'm happy to merge it,
>> >
>> > Great, please merge it.
>> >
>> >> but I don't see
>> >> the rest of the series queued anywhere.
>> >
>> > I'll see what remains and submit the rest via the kbuild tree.
>> >
>>
>> I like this approach, rather than fixing scripts/package/mkspec.
>>
>>
>> So, how shall we handle this series?
>>
>>
>> I am OK with getting 1/6 in through arm64 tree,
>> but 6/6 will be postponed in the case.
>>
>>
>>
>> If Will issues Acked-by, I can pick-up the whole series
>> to linux-kbuild.
>
> Ok, that works for me too. For the first patch:
>
> Acked-by: Will Deacon <will.deacon@arm.com>
>
> So please take this via linux-kbuild.
>
> Will


Applied to linux-kbuild/misc.  Thanks!




-- 
Best Regards
Masahiro Yamada
