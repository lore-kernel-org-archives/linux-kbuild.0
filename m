Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18014 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbdKSMVd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Nov 2017 07:21:33 -0500
MIME-Version: 1.0
In-Reply-To: <CA+55aFy4y+-WM=fh4nhvTqTk0nF_c1525CLGCu44Q7rpbBRDZg@mail.gmail.com>
References: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
 <CA+55aFy4y+-WM=fh4nhvTqTk0nF_c1525CLGCu44Q7rpbBRDZg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 19 Nov 2017 21:20:45 +0900
Message-ID: <CAK7LNAQphNVdHz02fZBzZ17xbSzve8Pn5yONdDzT9VYoVdK6iQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,


2017-11-18 10:51 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Fri, Nov 17, 2017 at 9:22 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Here are Kbuild updates for v4.15.  Please pull!
>
> Mind checking that I got the CFLAGS_KCOV behavior right. The conflict
> looked pretty simple, but somebody should check the ordering of the
>
>    export CFLAGS_KCOV
>
> vs the actual setting (that is now in scripts/Makefile.kcov.
>
> It probably doesn't matter, but our makefiles are black magic.
>
>               Linus


Strictly speaking, there is a case where the placement of "export"
make a difference.


-----(example1)-----
BAR := bar

FOO += $(BAR)
export FOO

BAR := bar2
---------------------


-----(example2)-----
BAR := bar

export FOO
FOO += $(BAR)

BAR := bar2
---------------------


In example1, the exported value for FOO is "bar2"
whereas, in example2, "bar".

The difference probably comes "export" implies
":=" flavor initialization if not explicitly initialized yet.
To avoid confusion, we should explicitly use either ":=" or "=", though.


Talking about the kcov case, CFLAGS_KCOV is initialized by ":="
in scripts/Malefile.kcov, so it should work as we expect.

(In my personal preference, I'd like collect
the kcov stuff into scripts/Makefile.kcof, but
it is just a matter of slight taste.)



-- 
Best Regards
Masahiro Yamada
