Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38209 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgC3S6c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 14:58:32 -0400
Received: by mail-pj1-f66.google.com with SMTP id m15so7741631pje.3
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 11:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 30 Mar 2020 11:58:19 -0700
Message-ID: <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Patil <sspatil@google.com>

On Sat, Mar 28, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I also had planned to provide a single switch to change
> all the tool defaults to LLVM.
>
> So, supporting 'LLVM' is fine, but I'd rather want this
> look symmetrical, and easy to understand.
>
> CPP        = $(CC) -E
> ifneq ($(LLVM),)

Yes, a simple if statement is much simpler than the overly complex patch I had.

> CC         = $(LLVM_DIR)clang

Do we need $LLVM_DIR? Shouldn't users just have that in their $PATH?

Also, I think we need to support suffixed binaries, as debian
distributes these with version suffixes, as Nathan points out.  Or do
the debian packages install suffixed binaries AND path versioned
non-suffixed binaries?

> LD         = $(LLVM_DIR)ld.lld
> AR         = $(LLVM_DIR)llvm-ar
> NM         = $(LLVM_DIR)llvm-nm
> OBJCOPY    = $(LLVM_DIR)llvm-objcopy
> OBJDUMP    = $(LLVM_DIR)llvm-objdump
> READELF    = $(LLVM_DIR)llvm-readelf
> OBJSIZE    = $(LLVM_DIR)llvm-size
> STRIP      = $(LLVM_DIR)llvm-strip
> else
> CC         = $(CROSS_COMPILE)gcc
> LD         = $(CROSS_COMPILE)ld
> AR         = $(CROSS_COMPILE)ar
> NM         = $(CROSS_COMPILE)nm
> OBJCOPY    = $(CROSS_COMPILE)objcopy
> OBJDUMP    = $(CROSS_COMPILE)objdump
> READELF    = $(CROSS_COMPILE)readelf
> OBJSIZE    = $(CROSS_COMPILE)size
> STRIP      = $(CROSS_COMPILE)strip
> endif
>
>
>
> I attached two patches.
> Comments appreciated.

I'm not sure the second one that recommends changing cc/c++ is the way
to go; I think it might harm hermeticity.

> If you are so addicted to LLVM

Lol, maybe?
-- 
Thanks,
~Nick Desaulniers
