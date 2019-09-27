Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39500 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbfI0PoU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 11:44:20 -0400
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com> <20190927134108.GC187147@google.com>
In-Reply-To: <20190927134108.GC187147@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 Sep 2019 00:43:27 +0900
Message-ID: <CAK7LNARc+jA5MYr7E5hBn2ALJ29o=AQ5j51fU_Z7h7Mc++BHUQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Matthias,

On Fri, Sep 27, 2019 at 10:41 PM Matthias Maennich <maennich@google.com> wrote:
>
> On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
> >
> >I was hit by some problems caused by the module namespace feature
> >that was merged recently. At least, the breakage of
> >external module builds is a fatal one. I just took a look at the code
> >closer, and I noticed some more issues and improvements.
> >
> >I hope these patches are mostly OK.
> >The 4th patch might have room for argument since it is a trade-off
> >of "cleaner implermentation" vs "code size".
> >
> Thanks Masahiro for taking the time to improve the implementation of the
> symbol namespaces. These are all good points that you addressed!
>
> For [04/07], I can work on this if you do not mind.


Please feel free to.

Thanks for your review.


-- 
Best Regards
Masahiro Yamada
