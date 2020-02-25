Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45896 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbgBYEZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 23:25:20 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so6474024pfg.12
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 20:25:20 -0800 (PST)
Date: Mon, 24 Feb 2020 20:25:17 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002242019.A9F519A33A@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net, masahiroy@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

On Mon, Feb 24, 2020 at 09:16:43PM -0700, Nathan Chancellor wrote:
> I think the clang one should be added in a separate patch that
> solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> macro and version check, like in include/linux/compiler-gcc.h.

Sounds good.

> ld.lld's minimum version should also be 9, what is the blocking issue
> that makes it 11?

I think I've mostly got future patches on my mind. lld before 11 will
blow up on this:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=build/link-time
(but I haven't sent this patch yet since I didn't want to break lld
until it was fixed, which it is now, but I got distracted by other
stuff).

Additionally there will be LTO, but LTO will be version-checked. Then I
was thinking about the orphan section handling, and there is very
clearly more work to be done there too... (i.e. the synthesized sections
get reported by the orphan warning before they're actually processed by
DISCARD is some cases -- I still need to isolate the behavior and open a
bug.)

-- 
Kees Cook
