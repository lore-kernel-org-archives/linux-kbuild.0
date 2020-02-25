Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43346 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgBYU7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 15:59:37 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so134917pgb.10
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 12:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook> <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Feb 2020 12:59:25 -0800
Message-ID: <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Feb 24, 2020 at 8:16 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> > Should this also include an update to Documentation/process/changes.rst
> > with the minimum version required? (I would expect this to be "9" for Clang,
> > and "11" for ld.lld.)
>
> I think the clang one should be added in a separate patch that
> solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> macro and version check, like in include/linux/compiler-gcc.h.
>
> ld.lld's minimum version should also be 9, what is the blocking issue
> that makes it 11?

I'm super hesitant to put a minimally required version of Clang, since
it really depends on the configs you're using.  Sure, clang-9 will
probably work better than clang-4 for some configs, but I would say
ToT clang built from source would be even better, as unrealistic as
that is for most people.  The question of "what's our support model"
hasn't realistically come up yet, so I don't really want to make a
decision on that right now and potentially pigeonhole us into some
support scheme that's theoretical or hypothetical.  We need to expand
out the CI more, and get more people to even care about Clang, before
we start to concern ourselves with providing an answer to the question
"what versions of clang are supported?"  But it's just a strong
opinion of mine, held loosely.

Either way, it can be done (or not) in a follow up patch.  I would
like to land some Documentation/ even if it's not perfect, we can go
from there.
-- 
Thanks,
~Nick Desaulniers
