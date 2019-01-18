Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24702 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfARI7U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jan 2019 03:59:20 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Jan 2019 17:58:22 +0900
Message-ID: <CAK7LNATyx5DtopKfkS4ge=6F7e16qjvOr_1XOTvCZqaZKnPwxQ@mail.gmail.com>
Subject: [Question] What is the license of scripts/basic/fixdep.c ?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kai Germaschewski <kai.germaschewski@gmx.de>, Kate Stewart <kstewart@linuxfoundation.org>, Jiri Olsa <jolsa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.


The comment block of scripts/basic/fixdep.c says as follows:


 * Author       Kai Germaschewski
 * Copyright    2002 by Kai Germaschewski  <kai.germaschewski@gmx.de>
 *
 * This software may be used and distributed according to the terms
 * of the GNU General Public License, incorporated herein by reference.



It does not explicitly mention the version of GPL.

In this case, I think the corresponding SPDX tag
is GPL-1.0+ instead of GPL-2.0

Is this correct?



There could be another problem regarding of this.



Commit 9f7ef9854e80 copied scripts/basic/fixdep.c
to tools/build/fixdep.c, but it ripped off its license term.

Later, it was tagged as GPL-2.0 by b24413180

See 'git show  b24413180 -- tools/build/fixdep.c'


Maybe tools/build/fixdep.c should be corrected to GPL-1.0+ ?


-- 
Best Regards
Masahiro Yamada
