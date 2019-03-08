Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:34865 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfCHGni (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 01:43:38 -0500
MIME-Version: 1.0
References: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com>
 <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
 <CAK7LNAQFWWzki-MvmhDpAn46XkDAu4_EGCQotbi5qAk5oJrgUQ@mail.gmail.com>
 <788870e550cb3cecafd9db14c081ddb0225edfde.camel@decadent.org.uk>
 <CABkpOEUqJWn62VZoTA5UEnbDieiYR9y3diRQhZuOVe6hOoBNhA@mail.gmail.com> <c93a7273c89c649373761f2ba26a6ef05787d08d.camel@decadent.org.uk>
In-Reply-To: <c93a7273c89c649373761f2ba26a6ef05787d08d.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Mar 2019 15:42:49 +0900
Message-ID: <CAK7LNAQzfiZejYKKtFSineEwB5M_GcUktBmLgAGs2iC7i4Cbfw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add workaround for Debian make-kpkg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Manoj Srivastava <manoj.srivastava.1962@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Mar 8, 2019 at 6:56 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Wed, 2019-03-06 at 22:48 -0800, Manoj Srivastava wrote:
> > Hi,
> >
> >   Does this have any users?

Recently, I received a regression report.
So, yes. There are users.


> > I can take a stand at making it work, but I am
> > unsure of there are enough people interested in make-kpkg anymore to make
> > it worthwhile.
> >
> >   There is a man pager that might be of minor interest, but that can be
> > taken over by the kernel team if they want

I do not want to maintain the dying package.



> [...]
>
> I assume you're referring to kernel-img.conf.  I would be happy to add
> that to linux-base, with some clarification of which settings are
> understood by which packages.
>
> I take it that you don't want kernel-package to be included in buster,
> so can you open an RC bug to say so?

Also, could you make sure it won't come back to bullseye or later ?

How about Ubuntu? Is it out of your control?



> Ben.
>
> --
> Ben Hutchings
> friends: People who know you well, but like you anyway.
>
>


-- 
Best Regards
Masahiro Yamada
