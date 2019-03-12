Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38168 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfCLQjx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Mar 2019 12:39:53 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Mar 2019 01:39:04 +0900
Message-ID: <CAK7LNASa-XsGj9ESee+RF4SMQxpxD49oKz9C86etYQV2gQPxDQ@mail.gmail.com>
Subject: [GIT PULL] Kconfig updates for v5.1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,


Please pull Kconfig updates for v5.1.

Thanks.



The following changes since commit f17b5f06cb92ef2250513a1e154c47b78df07d40:

  Linux 5.0-rc4 (2019-01-27 15:18:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.1

for you to fetch changes up to 8741908b3e29d35a33eeab6de60175958db8e54b:

  kconfig: fix 'Save As' menu of xconfig (2019-03-12 02:50:24 +0900)

----------------------------------------------------------------
Kconfig updates for v5.1

 - rename lexer and parse files

 - fix 'Save as' menu of xconfig

----------------------------------------------------------------
Masahiro Yamada (3):
      kconfig: rename zconf.l to lexer.l
      kconfig: rename zconf.y to parser.y
      kconfig: fix 'Save As' menu of xconfig

 scripts/kconfig/Makefile              |  9 ++++----
 scripts/kconfig/expr.h                |  2 +-
 scripts/kconfig/{zconf.l => lexer.l}  |  2 +-
 scripts/kconfig/lkc.h                 |  2 +-
 scripts/kconfig/{zconf.y => parser.y} |  0
 scripts/kconfig/qconf.cc              | 42 +++++++++++++++++++++++++++++------
 scripts/kconfig/qconf.h               |  1 +
 7 files changed, 44 insertions(+), 14 deletions(-)
 rename scripts/kconfig/{zconf.l => lexer.l} (99%)
 rename scripts/kconfig/{zconf.y => parser.y} (100%)


-- 
Best Regards
Masahiro Yamada
