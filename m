Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17146 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754134AbdEKAnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 20:43:39 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 May 2017 09:43:27 +0900
Message-ID: <CAK7LNATDsLtvdMGdK1Lyw+L=e1UvyD5U4KoJq77sqR1gzWDxiQ@mail.gmail.com>
Subject: [GIT PULL 2/3] Kbuild misc updates for v4.12
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Here are some updates of misc scripts for v4.12.  Please pull!


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-misc-v4.12

for you to fetch changes up to 9eb3c95896a337256489124857157f49616d2c6b:

  builddeb: fix typo (2017-04-25 08:07:55 +0900)

----------------------------------------------------------------
Kbuild misc updates for 4.12

- Clean up builddeb script

- Use full path for KBUILD_IMAGE to fix rpm-pkg build

- Fix objdiff tool to ignore debug info

----------------------------------------------------------------
Andrew Donnellan (1):
      builddeb: fix typo

Michal Marek (6):
      arm64: Use full path in KBUILD_IMAGE definition
      arm: Use full path in KBUILD_IMAGE definition
      arc: Use full path in KBUILD_IMAGE definition
      sh: Use full path in KBUILD_IMAGE definition
      unicore32: Use full path in KBUILD_IMAGE definition
      deb-pkg: Remove the KBUILD_IMAGE workaround

Riku Voipio (1):
      builddeb: Update a few outdated and hardcoded strings

Stephen Boyd (1):
      scripts: objdiff: Ignore debug info when comparing

 arch/arc/Makefile        |  4 ++--
 arch/arm/Makefile        |  8 ++++----
 arch/arm64/Makefile      |  6 +++---
 arch/sh/Makefile         |  7 +++----
 arch/unicore32/Makefile  |  4 ++--
 scripts/objdiff          |  5 ++++-
 scripts/package/builddeb | 16 +++-------------
 7 files changed, 21 insertions(+), 29 deletions(-)


-- 
Best Regards
Masahiro Yamada
