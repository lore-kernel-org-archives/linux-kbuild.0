Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43091 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729004AbgBYV4M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 16:56:12 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so203356pgb.10
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 13:56:11 -0800 (PST)
Date: Tue, 25 Feb 2020 13:56:09 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002251353.25A016CD@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
 <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Feb 25, 2020 at 12:59:25PM -0800, Nick Desaulniers wrote:
> On Mon, Feb 24, 2020 at 8:16 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > > Should this also include an update to Documentation/process/changes.rst
> > > with the minimum version required? (I would expect this to be "9" for Clang,
> > > and "11" for ld.lld.)
> >
> > I think the clang one should be added in a separate patch that
> > solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> > macro and version check, like in include/linux/compiler-gcc.h.
> >
> > ld.lld's minimum version should also be 9, what is the blocking issue
> > that makes it 11?
> 
> I'm super hesitant to put a minimally required version of Clang, since
> it really depends on the configs you're using.  Sure, clang-9 will
> probably work better than clang-4 for some configs, but I would say

I think it's not unreasonable to say clang-9 due to x86 not building
prior to clang-9. (Yes, other archs can build with earlier clang, but
that's true for earlier gccs too.)

> ToT clang built from source would be even better, as unrealistic as
> that is for most people.  The question of "what's our support model"
> hasn't realistically come up yet, so I don't really want to make a
> decision on that right now and potentially pigeonhole us into some
> support scheme that's theoretical or hypothetical.  We need to expand
> out the CI more, and get more people to even care about Clang, before
> we start to concern ourselves with providing an answer to the question
> "what versions of clang are supported?"  But it's just a strong
> opinion of mine, held loosely.

"Supported" is hand-wavey anyway. I would say, "this version is
_expected_ to build the kernel", etc.

> Either way, it can be done (or not) in a follow up patch.  I would
> like to land some Documentation/ even if it's not perfect, we can go
> from there.

Sounds fine, but I think we should take a specific version stand as the
"minimum" version. Being able to build x86 defconfig is a good minimum
IMO.

-- 
Kees Cook
