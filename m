Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:50930 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965762AbeAJQkD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 11:40:03 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW4ZHdbM590NoxczgtkrozYwdffs-PdTkE51Fe4driq8Q@mail.gmail.com>
References: <1511784913-3396-1-git-send-email-yamada.masahiro@socionext.com>
 <CAMuHMdXHHFvPJyhJ37Xss_aBEY7kJVC8GxEqGNJyYW4wwhRgMQ@mail.gmail.com>
 <CAK7LNAQFDfGDy6q+ycY2C+FYtdUdgfGrUurEuV=FKOpbSJmPcQ@mail.gmail.com> <CAMuHMdW4ZHdbM590NoxczgtkrozYwdffs-PdTkE51Fe4driq8Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Jan 2018 01:39:11 +0900
Message-ID: <CAK7LNATs0F7q=bfCEwt7OTc=g07rEZ0MHSbsfMfFotT+sM5WJw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move cc-option and cc-disable-warning after incl.
 arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2018-01-11 1:21 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Yamada-san,
>
> On Sun, Dec 10, 2017 at 6:28 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> 2017-11-27 21:25 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>>> On Mon, Nov 27, 2017 at 1:15 PM, Masahiro Yamada
>>> <yamada.masahiro@socionext.com> wrote:
>>>> Geert reported commit ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before
>>>> incl. arch Makefile") broke cross-compilation using a cross-compiler
>>>> that supports less compiler options than the host compiler.
>>>>
>>>> For example,
>>>>
>>>>   cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"
>>>>
>>>> This problem happens on architectures that setup CROSS_COMPILE in their
>>>> arch/*/Makefile.
>>>>
>>>> Move the cc-option and cc-disable-warning back to the original position,
>>>> but keep the Clang target options.
>>>>
>>>> Fixes: ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before incl. arch Makefile")
>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>
>>> Thanks for the quick response!
>>>
>>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> Applied to linux-kbuild/fixes.
>
> Any chance this will be fixed in v4.15?
> It fixes a regression introduced in v4.15-rc1.
>

Yes, of course.

I have queued up just two patches to the fixes branch.
I am expecting a little more fixes for make-cache issues,
but otherwise, I will send a pull request in a few days.


-- 
Best Regards
Masahiro Yamada
