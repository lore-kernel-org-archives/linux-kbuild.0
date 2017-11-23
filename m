Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59004 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752148AbdKWEY5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Nov 2017 23:24:57 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQNEHRapzFem3nr7=EWJPYvZby9K7vem-R99ijYNoguEg@mail.gmail.com>
References: <CAK7LNAS1NaqPRhK6FOXN=YTMhLagpSrR2=tXn-uWZbpzr=NeoQ@mail.gmail.com>
 <20171115204231.34914-1-ndesaulniers@google.com> <CAK7LNAQNEHRapzFem3nr7=EWJPYvZby9K7vem-R99ijYNoguEg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 13:24:09 +0900
Message-ID: <CAK7LNASGYZfQFkM3yMRQaHLUwW5Lhp8CxHGX0bJ9sVja0f=n+A@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

2017-11-18 13:09 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2017-11-16 5:42 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
>> From: Chris Fries <cfries@google.com>
>>
>> Set the clang KBUILD_CFLAGS up before including arch/ Makefiles,
>> so that ld-options (etc.) can work correctly.
>>
>> This fixes errors with clang such as ld-options trying to CC
>> against your host architecture, but LD trying to link against
>> your target architecture.
>>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> Signed-off-by: Chris Fries <cfries@google.com>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Tested-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>
> Applied to linux-kbuild/kbuild.  Thanks!
>
> --
> Best Regards
> Masahiro Yamada

After more thought, I picked up your v2.
(clang variables before kernel configuration)

Linus suggests to move compiler flag testing to Kconfig.
To do it, we need to feed target CC information to Kconfig.

Sorry for spending your time.


-- 
Best Regards
Masahiro Yamada
