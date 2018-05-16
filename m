Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:41751 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbeEPOPK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 May 2018 10:15:10 -0400
Received: by mail-pl0-f67.google.com with SMTP id az12-v6so507195plb.8
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 07:15:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 0/4] powerpc patches for new Kconfig language
Date: Thu, 17 May 2018 00:14:54 +1000
Message-Id: <20180516141458.18996-1-npiggin@gmail.com>
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
kconfig-shell, so they could be merged ahead of it in the powerpc
tree.

Patch 4 takes advatage of a new feature of the kconfig-shell work to
improve powerpc kconfig, so that should instead be merged with the
kbuild tree with an ack from powerpc, after patches 1-3 are merged.

v4 just brings some build fixes to patch 3 (including a change from
patch 4 that belonged in patch 3), and improvemets to changelogs.

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
 .../tools/gcc-check-mprofile-kernel.sh        | 12 +++--
 scripts/recordmcount.pl                       | 18 +++++++-
 6 files changed, 67 insertions(+), 55 deletions(-)

-- 
2.17.0

