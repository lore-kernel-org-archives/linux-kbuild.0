Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:35264 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKWGlO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 01:41:14 -0500
MIME-Version: 1.0
References: <20191118045247.14082-1-yamada.masahiro@socionext.com> <2b1ab1b1-dd20-31f7-c787-921cbd66a828@kernel.dk>
In-Reply-To: <2b1ab1b1-dd20-31f7-c787-921cbd66a828@kernel.dk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Nov 2019 15:40:25 +0900
Message-ID: <CAK7LNASmC_1vwo9vhJGMZNng1dvkJmMzCQi7NEgh3V+JGu_QsA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make single target builds even faster
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 18, 2019 at 11:26 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/17/19 9:52 PM, Masahiro Yamada wrote:
> > Commit 2dffd23f81a3 ("kbuild: make single target builds much faster")
> > made the situation much better.
> >
> > To improve it even more, apply the similar idea to the top Makefile.
> > Trim unrelated directories from build-dirs.
> >
> > The single build code must be moved above the 'descend' target.
>
> I tested linux-next, which does improve things a bit, and this one on
> top further improves it. We're now not THAT far off the situation
> before these changes, that's a huge win. Thanks for working on this!
>
> You can add:
>
> Tested-by: Jens Axboe <axboe@kernel.dk>
>
> to the commit, if you wish.
>


Applied to linux-kbuild with Jens' Tested-by.


-- 
Best Regards
Masahiro Yamada
