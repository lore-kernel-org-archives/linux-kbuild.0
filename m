Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:37431 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754164AbeAJQVw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 11:21:52 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQFDfGDy6q+ycY2C+FYtdUdgfGrUurEuV=FKOpbSJmPcQ@mail.gmail.com>
References: <1511784913-3396-1-git-send-email-yamada.masahiro@socionext.com>
 <CAMuHMdXHHFvPJyhJ37Xss_aBEY7kJVC8GxEqGNJyYW4wwhRgMQ@mail.gmail.com> <CAK7LNAQFDfGDy6q+ycY2C+FYtdUdgfGrUurEuV=FKOpbSJmPcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2018 17:21:51 +0100
Message-ID: <CAMuHMdW4ZHdbM590NoxczgtkrozYwdffs-PdTkE51Fe4driq8Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move cc-option and cc-disable-warning after incl.
 arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Yamada-san,

On Sun, Dec 10, 2017 at 6:28 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-11-27 21:25 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Mon, Nov 27, 2017 at 1:15 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> Geert reported commit ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before
>>> incl. arch Makefile") broke cross-compilation using a cross-compiler
>>> that supports less compiler options than the host compiler.
>>>
>>> For example,
>>>
>>>   cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"
>>>
>>> This problem happens on architectures that setup CROSS_COMPILE in their
>>> arch/*/Makefile.
>>>
>>> Move the cc-option and cc-disable-warning back to the original position,
>>> but keep the Clang target options.
>>>
>>> Fixes: ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before incl. arch Makefile")
>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> Thanks for the quick response!
>>
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Applied to linux-kbuild/fixes.

Any chance this will be fixed in v4.15?
It fixes a regression introduced in v4.15-rc1.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
