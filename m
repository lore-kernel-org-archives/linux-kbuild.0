Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40964 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732541AbfHOW7s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 18:59:48 -0400
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
In-Reply-To: <20190815204529.GA69414@archlinux-threadripper>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Aug 2019 00:59:34 +0200
Message-ID: <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> I am still not a huge fan of the CONFIG_CC_IS_CLANG ifdefs but I don't
> really see a much cleaner way to get around this. Some that come to
> mind:

Yeah...

> * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> to just -Wimplicit-fallthrough for clang") for the time being and just
> rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.

I would avoid applying commits that will have to be reverted just for
Clang, particularly since it is not fully supported yet.

Cheers,
Miguel
