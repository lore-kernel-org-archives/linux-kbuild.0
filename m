Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47071 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfKRAP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 19:15:58 -0500
MIME-Version: 1.0
References: <20190528121148.GA18162@lst.de> <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
In-Reply-To: <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Nov 2019 09:15:13 +0900
Message-ID: <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
Subject: Re: building individual files in subdirectories
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jens,


(related to  https://lkml.org/lkml/2019/11/15/1152)


I received questions about single builds not working properly
some times in the past.

For example, the following is a post from Christoph to kbuild ML,
and my reply to it.




On Wed, May 29, 2019 at 10:12 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, May 28, 2019 at 9:12 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > A few kernel modules have source files in multiple subdirectories.
> > Trying to build just a single object of a source file in such a
> > subdirectory currently doesn't work.
> >
> > For example:
> >
> > hch@brick:~/work/xfs$ make fs/xfs/libxfs/xfs_alloc.o
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   DESCEND  objtool
> > scripts/Makefile.build:42: fs/xfs/libxfs/Makefile: No such file or directory
> > make[1]: *** No rule to make target 'fs/xfs/libxfs/Makefile'.  Stop.
> > make: *** [Makefile:1747: fs/xfs/libxfs/xfs_alloc.o] Error 2
> >
> > Is there any reasonably easy way to get this to work?
>
>
> While single targets are useful,
> they never work correctly.
> subdir-ccflags-y from upper Makefiles
> are not inherited.
>
> I want to implement single targets correctly, but
> I have never got around to it.
>
> "make fs/xfs/" is an alternative solution
> although it will compile much more than you want.
>
> Another solution is to put a dummy
> fs/xfs/libxfs/Makefile
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
