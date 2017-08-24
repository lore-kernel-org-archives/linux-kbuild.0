Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19964 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753269AbdHXQDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Aug 2017 12:03:05 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Aug 2017 01:02:10 +0900
Message-ID: <CAK7LNASCsjomwrWbXK5FFe86of8N_F8WyuJWspO-811F4=KzOQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.13-rc7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Here are some Kbuild fixes for v4.13
Please pull!


The following changes since commit aae4e7a8bc44722fe70d58920a36916b1043195e:

  Linux 4.13-rc4 (2017-08-06 18:44:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.13

for you to fetch changes up to 64236e315955cc59e2b612e6a0e59579395530ae:

  kbuild: update comments of Makefile.asm-generic (2017-08-25 00:10:05 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.13

- fix linker script regression caused by dead code elimination support

- fix typos and outdated comments

- specify kselftest-clean as a PHONY target

- fix "make dtbs_install" when $(srctree) includes shell special
  characters like '~'

- Move -fshort-wchar to the global option list because defining it
  partially emits warnings

----------------------------------------------------------------
Arnd Bergmann (1):
      Kbuild: use -fshort-wchar globally

Ben Hutchings (1):
      kbuild: Do not use hyphen in exported variable name

Cao jin (3):
      kbuild: trivial cleanups on the comments
      fixdep: trivial: typo fix and correction
      kbuild: update comments of Makefile.asm-generic

Nicholas Piggin (1):
      kbuild: linker script do not match C names unless
LD_DEAD_CODE_DATA_ELIMINATION is configured

Shuah Khan (1):
      Makefile: add kselftest-clean to PHONY target list

 Makefile                          | 13 +++++++------
 drivers/xen/Makefile              |  3 ---
 include/asm-generic/vmlinux.lds.h | 38 ++++++++++++++++++++++++++------------
 scripts/Kbuild.include            |  7 +++----
 scripts/Makefile.asm-generic      |  4 ++--
 scripts/Makefile.build            |  8 ++++----
 scripts/Makefile.dtbinst          |  4 ++--
 scripts/basic/Makefile            |  2 +-
 scripts/basic/fixdep.c            |  6 +++---
 9 files changed, 48 insertions(+), 37 deletions(-)


-- 
Best Regards
Masahiro Yamada
