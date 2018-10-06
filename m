Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37876 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbeJGFMk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Oct 2018 01:12:40 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de> <CANiq72mHDxe9-+pFf+dDuYXRz5YeyRYi6RW65tyo9-ENNngsCw@mail.gmail.com>
 <CAK7LNAT5h+Rku7DbD+kHGv7Kgk8FfuX4wwL_pwNOLSJbqw99MA@mail.gmail.com>
In-Reply-To: <CAK7LNAT5h+Rku7DbD+kHGv7Kgk8FfuX4wwL_pwNOLSJbqw99MA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Oct 2018 00:07:30 +0200
Message-ID: <CANiq72m4rES74-GQXQw7uTdY8ku1154u1U6J+xoOfwrWkyu1MA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com, stable@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi Masahiro,

On Sat, Oct 6, 2018 at 11:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sun, Oct 7, 2018 at 6:18 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > I think marking the function as static __used should do the trick and
> > would be less confusing.
>
> I tried __used, but I still see the warning.

It has to be static __used, not only __used! :-)

Cheers,
Miguel
