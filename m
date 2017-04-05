Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32811 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751856AbdDEATf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Apr 2017 20:19:35 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 5 Apr 2017 09:19:15 +0900
Message-ID: <CAK7LNAR2eHpFMmb=xdjiCb_=ZXqq11g9DafdZJegqnSTmQZyzA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.11
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org, Michal Marek <mmarek@suse.com>

Hi Linus,

From this development cycle, I send Kbuild pull requests.
Here are some Kbuild fixes.  Please get them in!


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.11

for you to fetch changes up to 9be3213b14d44f6328281941193d97f3b97e7d4c:

  gconfig: remove misleading parentheses around a condition
(2017-03-22 02:56:33 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.11

- Hand-off primary maintainership of Kbuild
- Fix build warnings
- Fix build error when GCOV is enabled with old compiler
- Fix HAVE_ASM_GOTO check when GCC plugin is enabled

----------------------------------------------------------------
Allan, Bruce W (1):
      kbuild: external module build warnings when KBUILD_OUTPUT set and W=1

Arnd Bergmann (1):
      Kbuild: use cc-disable-warning consistently for maybe-uninitialized

Gleb Fotengauer-Malinovskiy (1):
      jump label: fix passing kbuild_cflags when checking for asm goto support

Masahiro Yamada (1):
      MAINTAINERS: add Masahiro Yamada as a Kbuild maintainer

Nicolas Iooss (1):
      gconfig: remove misleading parentheses around a condition

 MAINTAINERS             |  4 ++--
 Makefile                | 14 +++++++-------
 scripts/Makefile.lib    |  2 +-
 scripts/kconfig/gconf.c |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)


-- 
Best Regards
Masahiro Yamada
