Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41022 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgCaGZs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 02:25:48 -0400
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com> <20200330190312.GA32257@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200330190312.GA32257@ubuntu-m2-xlarge-x86>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 31 Mar 2020 15:24:50 +0900
Message-ID: <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Patil <sspatil@google.com>

On Tue, Mar 31, 2020 at 4:03 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Mar 30, 2020 at 11:58:19AM -0700, Nick Desaulniers wrote:
> > On Sat, Mar 28, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > I also had planned to provide a single switch to change
> > > all the tool defaults to LLVM.
> > >
> > > So, supporting 'LLVM' is fine, but I'd rather want this
> > > look symmetrical, and easy to understand.
> > >
> > > CPP        = $(CC) -E
> > > ifneq ($(LLVM),)
> >
> > Yes, a simple if statement is much simpler than the overly complex patch I had.
> >
> > > CC         = $(LLVM_DIR)clang
> >
> > Do we need $LLVM_DIR? Shouldn't users just have that in their $PATH?
> >
> > Also, I think we need to support suffixed binaries, as debian
> > distributes these with version suffixes, as Nathan points out.  Or do
> > the debian packages install suffixed binaries AND path versioned
> > non-suffixed binaries?
>
> I think the idea here is that ultimately, the suffixed versions of clang
> that Debian has in /usr/bin are symlinks to binaries in
> /usr/lib/llvm-#/bin; as a result, a user could say
> LLVM_DIR=/usr/lib/llvm-#/bin/ and all of those tools would be picked up
> automatically. I am not really sure what is better.


I periodically build the latest llvm from the trunk,
and install it under my home directory.

So, I just thought it would be useful to
allow a user to specify the llvm directory.

Of course, I can do the equivalent by tweaking PATH, but
I hesitate to make the non-released version my default.



Having both LLVM_DIR and LLVM_SUFFIX seems verbose.

In fact, the debian provides multiple versions of GCC.
For example, my machine has

masahiro@pug:~$ ls -1 /usr/bin/gcc-*
/usr/bin/gcc-4.8
/usr/bin/gcc-5
/usr/bin/gcc-7
/usr/bin/gcc-ar
/usr/bin/gcc-ar-4.8
/usr/bin/gcc-ar-5
/usr/bin/gcc-ar-7
/usr/bin/gcc-nm
/usr/bin/gcc-nm-4.8
/usr/bin/gcc-nm-5
/usr/bin/gcc-nm-7
/usr/bin/gcc-ranlib
/usr/bin/gcc-ranlib-4.8
/usr/bin/gcc-ranlib-5
/usr/bin/gcc-ranlib-7

But, nobody has suggested GCC_SUFFIX.

So, I guess CROSS_COMPILE was enough to
choose a specific tool version.




> I'll try to have some other comments by later today/tonight.
>
> > > LD         = $(LLVM_DIR)ld.lld
> > > AR         = $(LLVM_DIR)llvm-ar
> > > NM         = $(LLVM_DIR)llvm-nm
> > > OBJCOPY    = $(LLVM_DIR)llvm-objcopy
> > > OBJDUMP    = $(LLVM_DIR)llvm-objdump
> > > READELF    = $(LLVM_DIR)llvm-readelf
> > > OBJSIZE    = $(LLVM_DIR)llvm-size
> > > STRIP      = $(LLVM_DIR)llvm-strip
> > > else
> > > CC         = $(CROSS_COMPILE)gcc
> > > LD         = $(CROSS_COMPILE)ld
> > > AR         = $(CROSS_COMPILE)ar
> > > NM         = $(CROSS_COMPILE)nm
> > > OBJCOPY    = $(CROSS_COMPILE)objcopy
> > > OBJDUMP    = $(CROSS_COMPILE)objdump
> > > READELF    = $(CROSS_COMPILE)readelf
> > > OBJSIZE    = $(CROSS_COMPILE)size
> > > STRIP      = $(CROSS_COMPILE)strip
> > > endif
> > >
> > >
> > >
> > > I attached two patches.
> > > Comments appreciated.
> >
> > I'm not sure the second one that recommends changing cc/c++ is the way
> > to go; I think it might harm hermeticity.
>
> Agreed. I do not modify my host system at all for this project, just
> relying on PATH modification. In theory, we can still override HOSTCC
> and HOSTCXX but that would defeat the purpose of that patch.
>
> Cheers,
> Nathan
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200330190312.GA32257%40ubuntu-m2-xlarge-x86.



-- 
Best Regards
Masahiro Yamada
