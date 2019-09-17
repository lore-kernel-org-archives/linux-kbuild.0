Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbfIQSQm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Sep 2019 14:16:42 -0400
Date: Tue, 17 Sep 2019 19:16:37 +0100
From: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
Message-ID: <20190917181636.7sngz5lrldx34rth@willie-the-truck>
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
 <20190917150902.GA4116@linux-8ccs>
 <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
 <20190917180136.GA10376@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917180136.GA10376@linux-8ccs>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, Matthias Maennich <maennich@google.com>, gregkh@linuxfoundation.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jessica,

On Tue, Sep 17, 2019 at 08:01:36PM +0200, Jessica Yu wrote:
> Yikes, I did not catch Stephen Rothwell's email about pausing the
> linux-next releases from Sept 5 until Sept 30
> (https://lore.kernel.org/linux-next/20190904233443.3f73c46b@canb.auug.org.au/).
> 
> The modules-next namespace patches have been in since last Tuesday,
> and my original plan was for them to catch at least a week of
> linux-next time before sending the pull request. :-/ But that did not
> happen due to the above.
> 
> So Linus, in light of the above realization, I'd say at this time - I
> will still formally send a pull request with the merge conflicts
> resolved with either solution #2 or #3, but merge at your own
> discretion, it's fine to delay to the following release if you're
> uncomfortable.

FWIW, when I've run into unexpected merge conflicts with other trees in the
past, I've found that it's usually sufficient just to include the resolution
as an inline diff in the pull request, rather than try to munge the tree
with merges or rebases.  Linus is pretty good at figuring it out, and with a
resolution to compare with, the damage is limited. The downside of the merge
is that it's fiddly to extract the changes and see what's actually being
pulled.

Also, it's not like the kbuild stuff has been in -next for ages, so this
would've been a late and messy conflict regardless.

Will
