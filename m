Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43389 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751003AbdLJF33 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Dec 2017 00:29:29 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXHHFvPJyhJ37Xss_aBEY7kJVC8GxEqGNJyYW4wwhRgMQ@mail.gmail.com>
References: <1511784913-3396-1-git-send-email-yamada.masahiro@socionext.com> <CAMuHMdXHHFvPJyhJ37Xss_aBEY7kJVC8GxEqGNJyYW4wwhRgMQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 10 Dec 2017 14:28:43 +0900
Message-ID: <CAK7LNAQFDfGDy6q+ycY2C+FYtdUdgfGrUurEuV=FKOpbSJmPcQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move cc-option and cc-disable-warning after incl.
 arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-11-27 21:25 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Yamada-san,
>
> On Mon, Nov 27, 2017 at 1:15 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Geert reported commit ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before
>> incl. arch Makefile") broke cross-compilation using a cross-compiler
>> that supports less compiler options than the host compiler.
>>
>> For example,
>>
>>   cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"
>>
>> This problem happens on architectures that setup CROSS_COMPILE in their
>> arch/*/Makefile.
>>
>> Move the cc-option and cc-disable-warning back to the original position,
>> but keep the Clang target options.
>>
>> Fixes: ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before incl. arch Makefile")
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Thanks for the quick response!
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Gr{oetje,eeting}s,
>
>                         Geert


Applied to linux-kbuild/fixes.

-- 
Best Regards
Masahiro Yamada
