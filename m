Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43448 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfHLRdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 13:33:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id r26so13887184pgl.10
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 10:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
 <20190809051552.GA44466@archlinux-threadripper> <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
 <20190812171444.GL4592@sirena.co.uk>
In-Reply-To: <20190812171444.GL4592@sirena.co.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Aug 2019 10:33:27 -0700
Message-ID: <CAKwvOdmEe7gE7LUFRtqrUiHr3_Q2Ky4a-obUQWagbgdWZ33_ag@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the environment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Chancellor <natechancellor@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <linux@roeck-us.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel@collabora.com

On Mon, Aug 12, 2019 at 10:14 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Aug 13, 2019 at 01:37:14AM +0900, Masahiro Yamada wrote:
> > Only the problem I see is the situation where
> > a user directly runs scripts/kconfig/merge_config.sh
> > without using make as a start-point.

Further, if it's possible to detect if merge_config.sh was invoked
from Make or not, it might be useful to warn or error when not invoked
via Make.

>
> This is really a very common thing for testing infrastructure to do,
> it'll combine a base defconfig with a fragment enabling extra stuff
> either to directly cover that extra stuff or to ensure that
> configuration options needed for testsuites get turned on.
>
> > A user can wrap merge_config.sh with a simple Makefile
> > if they want to override CC, HOSTCC, etc.
>
> If we want to do that it seems sensible to provide that Makefile
> upstream so there's a standard thing, it might also help people notice
> that they need to do this and avoid getting surprised.



-- 
Thanks,
~Nick Desaulniers
