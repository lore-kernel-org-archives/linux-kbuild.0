Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51255 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfBVAaL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Feb 2019 19:30:11 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 22 Feb 2019 09:29:27 +0900
Message-ID: <CAK7LNATwe3NwhApYFQyCob4+xSrr4a9zUY34EX-QN8pWoocvoA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.0(-rc8)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull a little more Kbuild fixes.

Thanks.




The following changes since commit f17b5f06cb92ef2250513a1e154c47b78df07d40:

  Linux 5.0-rc4 (2019-01-27 15:18:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.0-2

for you to fetch changes up to 207a369e3c085799e7836221f64e7a7329985fb6:

  sh: fix build error for invisible CONFIG_BUILTIN_DTB_SOURCE
(2019-02-13 23:29:42 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.0 (2nd)

 - fix scripts/kallsyms.c to correctly check too long symbol names

 - fix sh build error for the combination of CONFIG_OF_EARLY_FLATTREE=y
   and CONFIG_USE_BUILTIN_DTB=n

----------------------------------------------------------------
Eugene Loh (1):
      kallsyms: Handle too long symbols in kallsyms.c

Masahiro Yamada (1):
      sh: fix build error for invisible CONFIG_BUILTIN_DTB_SOURCE

 arch/sh/boot/dts/Makefile | 2 +-
 scripts/kallsyms.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


-- 
Best Regards
Masahiro Yamada
