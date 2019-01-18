Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:47677 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfARKmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jan 2019 05:42:37 -0500
MIME-Version: 1.0
References: <CAK7LNATyx5DtopKfkS4ge=6F7e16qjvOr_1XOTvCZqaZKnPwxQ@mail.gmail.com>
In-Reply-To: <CAK7LNATyx5DtopKfkS4ge=6F7e16qjvOr_1XOTvCZqaZKnPwxQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Jan 2019 19:41:39 +0900
Message-ID: <CAK7LNARBzc+vM4v2ESF5LkDoAi4MzB6WVmMnVGnjKdM2PTqDMg@mail.gmail.com>
Subject: Re: [Question] What is the license of scripts/basic/fixdep.c ?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kai Germaschewski <kai.germaschewski@gmx.de>, Kate Stewart <kstewart@linuxfoundation.org>, Jiri Olsa <jolsa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Jan 18, 2019 at 5:58 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi.
>
>
> The comment block of scripts/basic/fixdep.c says as follows:
>
>
>  * Author       Kai Germaschewski
>  * Copyright    2002 by Kai Germaschewski  <kai.germaschewski@gmx.de>
>  *
>  * This software may be used and distributed according to the terms
>  * of the GNU General Public License, incorporated herein by reference.
>
>
>
> It does not explicitly mention the version of GPL.
>
> In this case, I think the corresponding SPDX tag
> is GPL-1.0+ instead of GPL-2.0
>
> Is this correct?
>
>
>
> There could be another problem regarding of this.
>
>
>
> Commit 9f7ef9854e80 copied scripts/basic/fixdep.c
> to tools/build/fixdep.c, but it ripped off its license term.
>
> Later, it was tagged as GPL-2.0 by b24413180
>
> See 'git show  b24413180 -- tools/build/fixdep.c'
>
>
> Maybe tools/build/fixdep.c should be corrected to GPL-1.0+ ?


I am not an expert of software license, but
a little more thought about this
if scripts/basic/fixdep.c is GPL-1.0+,



Probably, either of the following is correct.


Must tools/build/fixdep.c inherit GPL-1.0+
from script/basic/fixdep.c ?

 or

Can you choose the license (any in GPL-1.0, GPL-2.0, GPL-3.0,
GPL-1.0+, GPL-2.0+)
for tools/build/fixdep.c at your opinion?
(In this case, Jiri Olsa, the author of commit 9f7ef9854e800)



If the latter is correct, we do not need to fix tools/build/fixdep.c


-- 
Best Regards
Masahiro Yamada
