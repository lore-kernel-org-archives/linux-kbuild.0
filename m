Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45056 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389212AbgDBSbL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 14:31:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id t4so1644403plq.12
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 11:31:10 -0700 (PDT)
Date: Thu, 2 Apr 2020 11:31:08 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <202004021129.F688E2D@keescook>
References: <202004020117.6E434C035@keescook>
 <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
 <CAKwvOdnO_-jiQzCmy7pQNMGmZsgD9J=PYXVzOQ1NF1+u44MsOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnO_-jiQzCmy7pQNMGmZsgD9J=PYXVzOQ1NF1+u44MsOA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Patil <sspatil@google.com>

On Thu, Apr 02, 2020 at 11:22:02AM -0700, Nick Desaulniers wrote:
> With Kees patch + Masahiro's diff applied:
> $ cat /proc/version
> Linux version 5.6.0-rc7-next-20200330+ (ndesaulniers@<hostname
> scrubbed>) (clang version 11.0.0 (git@github.com:llvm/llvm-project.git
> 6d71daed03ced011cd25f4e4f4122a368fdc757d), LLD 11.0.0
> (git@github.com:llvm/llvm-project.git
> 6d71daed03ced011cd25f4e4f4122a368fdc757d)) #167 SMP Thu Apr 2 11:17:36
> PDT 2020
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Awesome! Thanks for testing. :)

> We could actually use this in Android for a VTS test I've, uh, been
> meaning to write.  Also, LOL at scrubbing the "compatible with" part,
> reminds me of user agent strings in the browser, which are god awful.

Heh, yeah. That's there because (actually, I think _you_ told me this
when I asked during the ClangBuiltLinux summit) other tools scanned the
LD version string for the binutils-specific bits. For this, since it's
newly added to the kernel /proc/version, nothing is already expecting to
find an LD string, and it looked super weird in there if I left it
as-is. Hence, scrub!

-Kees

-- 
Kees Cook
