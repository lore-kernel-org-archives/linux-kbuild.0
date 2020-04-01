Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32349 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAGLg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 02:11:36 -0400
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86> <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
In-Reply-To: <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 1 Apr 2020 15:10:52 +0900
Message-ID: <CAK7LNAR0PPxibFVC5F07mytz4J2BbwQkpHcquH56j7=S_Mqj2g@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Patil <sspatil@google.com>

On Wed, Apr 1, 2020 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
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
>
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
>
> > Having both LLVM_DIR and LLVM_SUFFIX seems verbose.
>
> I agree, so maybe just LLVM=y, and we can support both non-standard
> locations and debian suffixes via modifications to PATH.



OK, so we will start with the boolean switch 'LLVM'.

People can use PATH to cope with directory path and suffixes.


-- 
Best Regards
Masahiro Yamada
