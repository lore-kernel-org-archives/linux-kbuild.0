Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:51329 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753348AbdJQPUt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 11:20:49 -0400
Received: by mail-it0-f54.google.com with SMTP id o135so2808657itb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2017 08:20:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 17 Oct 2017 08:20:47 -0700
Message-ID: <CAGXu5jKwi+ZE+t0qL=Ohwevr2pD4Y-OhDF=Lt65Y3qX712YSBQ@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 17, 2017 at 4:00 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> Hi Kees,
>
> On my test box, current linux-next kernels fail to build due to the
> patch that introduces CONFIG_CC_STACKPROTECTOR_AUTO, with my mainline
> gcc
> builds up to gcc-5.5.0. gcc-6 and higher work fine, as
> scripts/gcc-x86_64-has-stack-protector.sh returns 'y' for those.

Do the others fail?

> Using the compilers provided by Ubuntu (4.6/4.7/4.8/4.9), everything
> also works as expected, so my interpretation is that mainline gcc did
> not enable the stack protector until gcc-6, while distributions did.
>
> Do you agree with that interpretation?

No, stock gcc enabled this in gcc 4.2 (though it was broken briefly in
that series).

> If yes, is there anything we can do about it? I can probably rebuild
> my collection of x86 compilers to enable stackprotector if necessary,
> but I wonder how many other people will run into the same problem.

_AUTO should just continue with a warning if stack protector is
unavailable. If it's _broken_, it's suppose to fail only for new
compilers where that failure would be unexpected (there is a patch in
mmots that checks for gcc 4.4, but it turns out this is wrong).

I've been debugging this with akpm, but I can't reproduce the problems
he's seeing.

What failures are you seeing?

-Kees

-- 
Kees Cook
Pixel Security
