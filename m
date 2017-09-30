Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36667 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdI3XOy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2017 19:14:54 -0400
Date: Sat, 30 Sep 2017 16:14:50 -0700
From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH] kbuild: clang: remove crufty HOSTCFLAGS
Message-ID: <20170930231450.cggvysrt4zedsbkq@lostoracle.net>
References: <20170926022835.30916-1-nick.desaulniers@gmail.com>
 <CAK7LNARwbqviGS4THmftO3mCkxpjPmQHxDbFjTsBXptyEG5cMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARwbqviGS4THmftO3mCkxpjPmQHxDbFjTsBXptyEG5cMg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Behan Webster <behanw@converseincode.com>, dl9pf@gmx.de, Mark Charlebois <charlebm@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvmlinux@lists.linuxfoundation.org

On Thu, Sep 28, 2017 at 07:52:35PM +0900, Masahiro Yamada wrote:
> 2017-09-26 11:28 GMT+09:00 Nick Desaulniers <nick.desaulniers@gmail.com>:
> >  HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> > +               $(call hostcc-option,-fno-delete-null-pointer-checks) \
> >                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
> 
> You call hostcc-option
> before Kbuild.include is included around line 341.
> 
> So, $(call hostcc-option, ...) returns always an empty string here
> whether the compiler supports the option or not.

So calling a yet-to-be defined variable results in an empty string
rather than a loud failure?  Chalk that up there with language features
no one ever asked for.  That kind of implicit conversion gets languages
like JavaScript (with its loose type system, not that C is without its
own implicit type conversions/promotions) in a lot of hot water.

If that's the case, why are includes not at the top of Makefiles, if
silent failure is a possibility?  Is there a reason the include is so
far into the Makefile?

Is your sugguestion to raise the include or lower the HOSTCFLAGS
definition?

> > -ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> > -HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
> > -               -Wno-missing-field-initializers -fno-delete-null-pointer-checks
> > -endif
>
> The logic is very strange in the first place.
>
> Even very old GCC supports -fno-delete-null-pointer-checks,
> but clang does not.
>
> Here, -fno-delete-null-pointer-checks is added only when
> we are using clang for HOSTCC.  This is opposite.
>
> I guess we can remove all of them
> unless somebody can explain the rationale.

+llvm-linux

I suppose maybe different ARCH's have different host binaries made
during the build?  I tested x86_64 and arm64.  The commit message that
added them missed any context or justification.
