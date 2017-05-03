Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25643 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdECGqS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 02:46:18 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 3 May 2017 15:46:11 +0900
Message-ID: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
Subject: [RFC] Increase Minimal GNU Make version for Linux Kernel from 3.80 to 3.81
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Thierry Reding <treding@nvidia.com>, Ingo Molnar <mingo@kernel.org>

Hello Linus and Kbuild developers.


Documentation/process/changes.rst says the minimal version
of GNU Make is 3.80, but actually building the kernel
with this version has been broken for a long time.

Specifically, it got broken by commit c8589d1e9e01 (i.e. Linux 3.18).
Sorry, it's me who broke it.

Here is my excuse:
- It is almost 3 years since then, but nobody complained about it.
- GNU Make 3.80 is almost 15 years old.
  (Even GNU Make 3.81 was released in 2006.)
- People seldom test their makefiles on such old GNU Make version,
  so they often use some features that are not supported by version 3.80.


We would have to make efforts if we wanted to get back
availability of GNU Make 3.80.


[1] multi_depend in scripts/Makefile.lib does not work on GNU Make 3.80

I fiddled with it for a while, but I could not find a workaround,
except reverting the following 4 commits:

221ecca6cafe
022af62d0190
97e3226e6e98
c8589d1e9e01

I do not want to revert them because we would lose many cleanups.


[2] "else ifeq" is not supported by GNU Make 3.80

'make help' on GNU Make 3.80 reports error:
./Documentation/Makefile.sphinx:25: Extraneous text after `else' directive
./Documentation/Makefile.sphinx:31: *** only one `else' per conditional.  Stop.
make: *** [help] Error 2


We could rewrite the makefile, but nested if directives
would make the code unreadable.


[3] $(realpath ...) and $(abspath ...) are not supported by GNU Make 3.80

These two functions are only supported by 3.81 or later,
but they are already used here and there.


[4] semi-colon (;) is treated differently in $(warning ...) by GNU Make 3.80

'make ARCH=arm64 defconfig' does not work on GNU Make 3.80

$ make ARCH=arm64 defconfig
arch/arm64/Makefile:43: *** unterminated call to function `warning':
missing `)'.  Stop.

I could not find a solution to make it work for both 3.80 and 3.81 (or later).
We would not be able to use a semi-colon in $(warning ...).



From the above, I'd like to propose to increase the minimal version of
GNU Make to 3.81.

Comments are appreciated.



-- 
Best Regards
Masahiro Yamada
