Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45663 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfGVEuJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 00:50:09 -0400
MIME-Version: 1.0
References: <20190719100859.11227-1-yamada.masahiro@socionext.com> <20190719124030.GA5858@ravnborg.org>
In-Reply-To: <20190719124030.GA5858@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jul 2019 13:49:12 +0900
Message-ID: <CAK7LNASc5Fjic-zMKO6EKGUb2zWbTr=BmWUASFW6+n90FfRhxg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: disable compile-test of kernel headers for now
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, "Darrick J . Wong" <darrick.wong@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sam,



On Fri, Jul 19, 2019 at 9:40 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro.
>
> On Fri, Jul 19, 2019 at 07:08:59PM +0900, Masahiro Yamada wrote:
> > This compile-test started from the strong belief that (almost) all
> > headers should be able to be compiled as a standalone unit, but this
> > requirement seems to be just annoying.
> >
> > I believe compile-test of exported headers is good. On the other hand,
> > in-kernel headers are not necessarily supposed to be always compilable.
> > Actually, some headers are only included under a certain combination
> > of CONFIG options, and that is definitely fine.
> >
> > This test is still causing false positive errors in randconfig.
> > Moreover, newly added headers are compile-tested by default, sometimes
> > they catch (not fatal) bugs, but often raise false positive errors to
> > end up with making people upset.
> >
> > The merge window is closing shortly, so there is not much I can do.
> > Disable it for now, and take a pause to re-think whether we should
> > continue this or change the course.
>
> The present status is that iomap.h fails - and Arnd promptly
> made a fix for it:
> https://lore.kernel.org/lkml/20190719113139.4005262-1-arnd@arndb.de/T/#u
>
> You already fixed another issue.
> So the fall-out so far is miniaml and already fixed (pending Arnd's
> patch).
>
> If headers are not self-contained then one needs to include them in a
> specific order which can be quite hard to get right.
> Especially if the requirements differ across different architectures.
> So the whole concept seems sane.
>
> I have thrown it after may array of cross builds:
> => alpha arm arm64 sparc64 i386 x86 powerpc s390 riscv sh
>
> For each arch I try:
> => allmodconfig allyesconfig allnoconfig defconfig
>
> No errros.
> But that obviously only coveres a very minial set of configurations.
> Arnd's result from his randconfig are also very promising.
>
> I advise to keep it enabled and if there is a steady stream of
> new errors after -rc1 and -rc2 then to disable the testing.
> We will not get the coverage unless this is upstreamed.
> And the testing is relevant.
>
>         Sam



I am still wondering what to do about this.

After some consideration, I thought it would be too
annoying to put new headers to the test coverage
unconditionally.

Kernel code are compiled only under some circumstances.
It is not feasible to know correct CONFIG options
that headers are compiled with.

So, I am thinking of making this testing service on demand.
Headers need to be manually added to header-test-y
by somebody who is interested in doing so.

Divide Makefiles into sub-directory basis as you suggested first.
The area of test-coverage is up to each subsystem.
If drm people are really passionate about this,
they can make effort to make headers self-contained
and add everything to include/drm/Kbuild.
If nobody is interested, that's it.

Probably, many new headers will fall off the coverage,
but this is a trade-off to avoiding false-positives.


--
Best Regards


Masahiro Yamada
