Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbfDKNrx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 09:47:53 -0400
Date: Thu, 11 Apr 2019 09:47:49 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: Re: syncconfig changes in 4.19.34 break builds
Message-ID: <20190411134749.GH11568@sasha-vm>
References: <CABWYdi1sSjZ8pw7tJpgvZyLfdJwT5judfjj7F3X5fLcAK3xvsw@mail.gmail.com>
 <CAK7LNARvfpkO8D=xJ+GQMWuxX5a3RVkUsBg8XUgFz+4m=knK3Q@mail.gmail.com>
 <CABWYdi1H9TnB32RCPL2axRvAf3sqf2K2BaoMs+0f-1CibfZ_Tg@mail.gmail.com>
 <CAK7LNASjMrSrL+LhTuSq4T3juUbYSZUUtevUz=hwS+qFQiDuTg@mail.gmail.com>
 <CAK7LNAQtbuWOw5yGiCeodg0Kf+JGaJj6s6FSyDysxCLxtMBLeg@mail.gmail.com>
 <20190409153933.GM4689@sasha-vm>
 <CAK7LNATvZ_baJDr2SeoaUc6Of2sLz=MHMB=MDzQ1eNMcgjUW=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNATvZ_baJDr2SeoaUc6Of2sLz=MHMB=MDzQ1eNMcgjUW=A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ivan Babrou <ivan@cloudflare.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>, stable <stable@vger.kernel.org>

On Thu, Apr 11, 2019 at 01:27:43PM +0900, Masahiro Yamada wrote:
>Hi Sasha,
>
>On Wed, Apr 10, 2019 at 12:39 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Tue, Apr 09, 2019 at 02:50:04PM +0900, Masahiro Yamada wrote:
>> >Greg, Sasha,
>> >
>> >
>> >Sorry, the commit ID was wrong.
>> >
>> >
>> >The following commit for 4.19.x:
>> >
>> >commit 02826a6ba301b72461c3706e1cc66d5571cd327e
>> >Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >Date:   Mon Nov 5 16:52:34 2018 +0900
>> >
>> >    kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
>>
>> This commit claims it's fixing 80463f1b7bf9, which is not in 4.19. Was
>> that a mistake in the commit message?
>
>No.  The commit message is correct.
>The Fixes: tag points to the first bad commit in _upstream_.
>
>
>What I want to say is:
>638ecaf58369 [which was 9390dff66a5 in upstream]
>depends on 02826a6ba301b, which is missing in v4.19.x branch.
>
>638ecaf58369 was cherry-picked without correct patch
>dependency, so it got broken. That's all.
>
>
>There are two options to fix the breakage:
> - backport 02826a6ba301b
>    OR
> - revert 638ecaf58369.

Alrighty, I've picked 02826a6ba301b for 4.19, thanks.

--
Thanks,
Sasha
