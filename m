Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35796 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752088AbeBARL1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Feb 2018 12:11:27 -0500
MIME-Version: 1.0
In-Reply-To: <20180131093434.20050-7-ulfalizer@gmail.com>
References: <20180131093434.20050-1-ulfalizer@gmail.com> <20180131093434.20050-7-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Feb 2018 02:10:31 +0900
Message-ID: <CAK7LNATPiG6gvCr30W9ft7PB74xmx7ccLsZBiMUSK3dv4YYmZA@mail.gmail.com>
Subject: Re: [PATCH 06/11] lib/Kconfig.debug: Remove blank help text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Paul Bolle <pebolle@tiscali.nl>, Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Byungchul Park <byungchul.park@lge.com>, Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Theodore Ts'o <tytso@mit.edu>

2018-01-31 18:34 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Blank help texts are probably either a typo, a Kconfig misunderstanding,
> or some kind of half-committing to adding a help text (in which case a
> TODO comment would be clearer, if the help text really can't be added
> right away).
>
> Best to remove them, IMO.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---


FYI.

I picked up this patch to kbuild
because I need this to suppress warning messages
introduced by 11/11.

I am planning to send a PR for this series next week.
