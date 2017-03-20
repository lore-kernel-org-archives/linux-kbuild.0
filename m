Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35496 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755241AbdCTRAl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 13:00:41 -0400
MIME-Version: 1.0
In-Reply-To: <20170320101315.GB17263@arm.com>
References: <1489276762-22280-1-git-send-email-trini@konsulko.com>
 <20170315145118.GA30463@bill-the-cat> <39bd8ad9-ce11-3d81-95a9-235ceaded812@suse.com>
 <20170315153755.GR19897@bill-the-cat> <20170320101315.GB17263@arm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Mar 2017 02:00:28 +0900
Message-ID: <CAK7LNAQwTpSpMkx2nkmBUxSzpiGUmva=FyknmOrv7-YQPN_H9g@mail.gmail.com>
Subject: Re: kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full path
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>, Tom Rini <trini@konsulko.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>

2017-03-20 19:13 GMT+09:00 Will Deacon <will.deacon@arm.com>:
> On Wed, Mar 15, 2017 at 11:37:55AM -0400, Tom Rini wrote:
>> On Wed, Mar 15, 2017 at 04:03:44PM +0100, Michal Marek wrote:
>> > Dne 15.3.2017 v 15:51 Tom Rini napsal(a):
>> > > I found https://patchwork.kernel.org/patch/9442211/ today and I see that
>> > > it was brought up again just before I sent my patch.  I just want to
>> > > point out that 9442211 doesn't address arm, arc, and sh and they will
>> > > still not have a functional rpm build target.  This is at least probably
>> > > important for arm.  Of course all of those could also be addressed with
>> > > a patch similar to 9442211, and my main concern is making sure
>> > > everything gets fixed one way or another.  Thanks!
>> >
>> > The patch is 1/6 of a series that also covers other architectures, but
>> > patchwork won't should you the rest of the thread. Have a look here for
>> > instance: https://lkml.org/lkml/2016/11/22/750.
>>
>> Ah, OK, thanks.  I'll just hope it gets in soon, I like being able to
>> easily drop new kernels in on my arm64 box :)
>
> I'll pick up the arm64 patch this week (I was on holiday last week).
>
> Will
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



The patch 9442211 has been applied to linux-kbuild/misc
(Will acked to do so.)





-- 
Best Regards
Masahiro Yamada
