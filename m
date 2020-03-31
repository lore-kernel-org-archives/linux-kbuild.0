Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41290 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgCaTfs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 15:35:48 -0400
Date: Tue, 31 Mar 2020 12:35:44 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Message-ID: <20200331193544.GA55810@ubuntu-m2-xlarge-x86>
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86>
 <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
 <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86>
 <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Patil <sspatil@google.com>

On Tue, Mar 31, 2020 at 11:39:27AM -0700, Nick Desaulniers wrote:
> On Mon, Mar 30, 2020 at 11:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 4:03 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Mon, Mar 30, 2020 at 11:58:19AM -0700, Nick Desaulniers wrote:
> > > > On Sat, Mar 28, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > > I also had planned to provide a single switch to change
> > > > > all the tool defaults to LLVM.
> > > > >
> > > > > So, supporting 'LLVM' is fine, but I'd rather want this
> > > > > look symmetrical, and easy to understand.
> > > > >
> > > > > CPP        = $(CC) -E
> > > > > ifneq ($(LLVM),)
> > > >
> > > > Yes, a simple if statement is much simpler than the overly complex patch I had.
> > > >
> > > > > CC         = $(LLVM_DIR)clang
> > > >
> > > > Do we need $LLVM_DIR? Shouldn't users just have that in their $PATH?
> > > >
> > > > Also, I think we need to support suffixed binaries, as debian
> > > > distributes these with version suffixes, as Nathan points out.  Or do
> > > > the debian packages install suffixed binaries AND path versioned
> > > > non-suffixed binaries?
> > >
> > > I think the idea here is that ultimately, the suffixed versions of clang
> > > that Debian has in /usr/bin are symlinks to binaries in
> > > /usr/lib/llvm-#/bin; as a result, a user could say
> > > LLVM_DIR=/usr/lib/llvm-#/bin/ and all of those tools would be picked up
> > > automatically. I am not really sure what is better.
> 
> $ sudo apt install clang-8
> $ which clang-8
> /usr/bin/clang-8
> $ ls -l `!!`
> /usr/bin/clang-8 -> ../lib/llvm-8/bin/clang
> $ ls /usr/lib/llvm-8/bin
> <non suffixed versions>
> 
> Ok, so Nathan, it looks like we don't need the version suffixes.
> Instead, we can be more explicit with our $PATH, and only add the
> above (and bintutils).  I was thinking supporting the suffix was
> required for our CI, but it seems like maybe not.

Correct. This should probably be documented though, otherwise people
might use LLVM=y and be surprised when the latest version of their tools
are not being picked up.

> > I periodically build the latest llvm from the trunk,
> > and install it under my home directory.
> > So, I just thought it would be useful to
> > allow a user to specify the llvm directory.
> > Of course, I can do the equivalent by tweaking PATH, but
> > I hesitate to make the non-released version my default.
> 
> Respectfully, I strongly disagree.  This should be handled by
> modifications to $PATH, either by your shell's .rc file when you
> always want it, or exported for a session when you want it, or
> prefixed to an invocation for the duration of that command.  We should
> not have a new variable just for the path of a few tools.
> 
> Rather than `make LLVM_DIR=~/llvm-project LLVM=1`, you can do
> `PATH=$PATH:~/llvm-project make LLVM=1`. (or export it manually or via
> your shell .rc, depending on how comfortable you are with that
> version).

I always do PATH=...:${PATH} make CC=clang...

> > Having both LLVM_DIR and LLVM_SUFFIX seems verbose.
> 
> I agree, so maybe just LLVM=y, and we can support both non-standard
> locations and debian suffixes via modifications to PATH.
> 
> >
> > In fact, the debian provides multiple versions of GCC.
> > For example, my machine has
> >
> > masahiro@pug:~$ ls -1 /usr/bin/gcc-*
> > /usr/bin/gcc-4.8
> > /usr/bin/gcc-5
> > /usr/bin/gcc-7
> > /usr/bin/gcc-ar
> > /usr/bin/gcc-ar-4.8
> > /usr/bin/gcc-ar-5
> > /usr/bin/gcc-ar-7
> > /usr/bin/gcc-nm
> > /usr/bin/gcc-nm-4.8
> > /usr/bin/gcc-nm-5
> > /usr/bin/gcc-nm-7
> > /usr/bin/gcc-ranlib
> > /usr/bin/gcc-ranlib-4.8
> > /usr/bin/gcc-ranlib-5
> > /usr/bin/gcc-ranlib-7
> >
> > But, nobody has suggested GCC_SUFFIX.
> >
> > So, I guess CROSS_COMPILE was enough to
> > choose a specific tool version.
> 
> Or no one was testing specific versions of gcc with more than one
> installed.  I can ask the KernelCI folks next week if this is an issue
> they face or have faced.

Well gcc is just one tool, so specified CC=gcc-5 is not that
complicated; it would get a lot more gnarly if one had different
versions of binutils as well.

Cheers,
Nathan
