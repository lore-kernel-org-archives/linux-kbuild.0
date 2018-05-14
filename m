Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:43082 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbeENDwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 May 2018 23:52:44 -0400
Received: by mail-pg0-f68.google.com with SMTP id p8-v6so1346464pgq.10
        for <linux-kbuild@vger.kernel.org>; Sun, 13 May 2018 20:52:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 0/4] powerpc patches for new Kconfig language
Date: Mon, 14 May 2018 13:52:24 +1000
Message-Id: <20180514035228.21316-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Segher Boessenkool <segher@kernel.crashing.org>

This series of patches improves th powerpc kbuild system. The
motivation was to to be compatible with the new Kconfig scripting
language that Yamada-san has proposed here:

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/?h=kconfig-shell-v3

I have tested on top of that tree and powerpc now builds there.

I think patches 1-3 are improvements to the build system even before
kconfig-shell, so they could be merged ahead of it.

Patch 4 actually takes advatage of a new feature of the kconfig-shell
changes to improve powerpc kconfig, so that should rather be merged
with the kbuild tree with an ack from powerpc. Yamada-san are you
planning to merge kconfig-shell for 4.17?

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/kbuild: set default generic machine type for 32-bit compile
  powerpc/kbuild: remove CROSS32 defines from top level powerpc Makefile
  powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
  powerpc/kbuild: move -mprofile-kernel check to Kconfig

 arch/powerpc/Kconfig                          | 16 +------
 arch/powerpc/Makefile                         | 45 ++++++++-----------
 arch/powerpc/boot/Makefile                    | 16 ++++---
 arch/powerpc/kernel/vdso32/Makefile           | 15 +++++--
 .../tools/gcc-check-mprofile-kernel.sh        |  4 +-
 scripts/recordmcount.pl                       |  7 +++
 6 files changed, 51 insertions(+), 52 deletions(-)

-- 
2.17.0

