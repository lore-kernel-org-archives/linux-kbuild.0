Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43990 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbeJGEXI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Oct 2018 00:23:08 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com> <20181005083313.2088252-1-arnd@arndb.de>
In-Reply-To: <20181005083313.2088252-1-arnd@arndb.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Oct 2018 23:18:06 +0200
Message-ID: <CANiq72mHDxe9-+pFf+dDuYXRz5YeyRYi6RW65tyo9-ENNngsCw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com, stable@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

On Fri, Oct 5, 2018 at 10:35 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Building any configuration with 'make W=1' produces a warning:
>
> kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]
>
> When also passing -Werror, this prevents us from building any
> other files. Nobody ever calls the function, but we can't make
> it 'static' either since we want the compiler output.
>
> Calling it 'main' instead however avoids the warning, because gcc
> does not insist on having a declaration for main.

I think marking the function as static __used should do the trick and
would be less confusing.

Cheers,
Miguel
