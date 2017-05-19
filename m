Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35633 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754604AbdESCIC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 22:08:02 -0400
MIME-Version: 1.0
In-Reply-To: <20160418153211.GB22979@ulmo.ba.sec>
References: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
 <5714F35D.5050603@suse.com> <20160418150535.GA22979@ulmo.ba.sec>
 <alpine.LFD.2.20.1604181609540.28036@eddie.linux-mips.org> <20160418153211.GB22979@ulmo.ba.sec>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 May 2017 11:07:52 +0900
Message-ID: <CAK7LNAR20+wJYsPBN+nw1JrzJc411vaLOMffhEwy=5W12zHJ6g@mail.gmail.com>
Subject: Re: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd
 ... && pwd)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Thierry,


2016-04-19 0:32 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> On Mon, Apr 18, 2016 at 04:17:26PM +0100, Maciej W. Rozycki wrote:
>> On Mon, 18 Apr 2016, Thierry Reding wrote:
>>
>> > > > Avoid forking off a shell to resolve the absolute path of the output
>> > > > directory when make's builtin $(abspath ...) function will do an
>> > > > adequate job.
>> > >
>> > > The abspath function is not available in make 3.80.
>> >
>> > Do we really support make 3.80? It was released in 2002 and 3.81
>> > followed in April 2006. That makes it a decade old now. I'd be surprised
>> > if anyone was still using it to build recent kernels.
>> >
>> > Is there a formal process for increasing the dependencies listed in
>> > Documentation/Changes? Should I simply make that change as part of this
>> > patch? Do we need broad approval?
>>
>>  Hmm, what problem are you trying to solve here?  Your proposal looks to
>> me like a gratuitous requirement for users to upgrade their tool (its age
>> doesn't matter), which is often a burden and in any case requires extra
>> time which could be used for something else.  Don't fix what ain't broke!
>
> Fine.
>
> Thierry


Are you still interested in this patch?

Actually, Kbuild had not been working with GNU Make 3.80
before you submitted this patch.
(In other words, Kbuild had already depended on GNU Make 3.81)


Now Kbuild _officially_ depends on GNU Make 3.81
(commit 37d69ee30808), so I think your patch is acceptable
and $(abspath ...) looks cleaner to me.
This patch no longer applies, so you need to rebase it, though.

-- 
Best Regards
Masahiro Yamada
