Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:26425 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424457AbdDUTGW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 15:06:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 0/2] kbuild: use relative path from $(srctree) instead of __FILE__
Date: Sat, 22 Apr 2017 04:03:25 +0900
Message-Id: <1492801407-26823-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>


Kbuild works in objtree, not in srctree.  So, __FILE__ is prefixed
with $(srctree)/ for out-of-tree build.

It would be nice to see the same log regardless
in-tree, or out-of-tree build.

1/2 adds a new macro KBUILD_FILE.  This points the relative path
of the file we are building.  This is intended to replace __FILE__.

2/2 replaces __FILE__ in bug.h as an example.  This will improve
the output of WARN_ON() etc.



Masahiro Yamada (2):
  kbuild: add KBUILD_FILE to point relative file path from $(srctree)
  bug.h: replace __FILE__ with KBUILD_FILE for shorter names in log

 arch/alpha/include/asm/bug.h          | 2 +-
 arch/arc/include/asm/bug.h            | 2 +-
 arch/arm/include/asm/bug.h            | 4 ++--
 arch/arm64/include/asm/bug.h          | 2 +-
 arch/avr32/include/asm/bug.h          | 2 +-
 arch/blackfin/include/asm/bug.h       | 2 +-
 arch/cris/include/arch-v10/arch/bug.h | 6 +++---
 arch/cris/include/arch-v32/arch/bug.h | 2 +-
 arch/frv/include/asm/bug.h            | 2 +-
 arch/ia64/include/asm/bug.h           | 2 +-
 arch/m68k/include/asm/bug.h           | 4 ++--
 arch/mn10300/include/asm/bug.h        | 2 +-
 arch/parisc/include/asm/bug.h         | 4 ++--
 arch/powerpc/include/asm/bug.h        | 8 ++++----
 arch/s390/include/asm/bug.h           | 2 +-
 arch/score/include/asm/bug.h          | 4 ++--
 arch/sh/include/asm/bug.h             | 8 ++++----
 arch/sparc/include/asm/bug.h          | 2 +-
 arch/x86/include/asm/bug.h            | 2 +-
 include/asm-generic/bug.h             | 8 ++++----
 scripts/Kbuild.include                | 4 ++++
 scripts/Makefile.lib                  | 5 +++--
 22 files changed, 42 insertions(+), 37 deletions(-)

-- 
2.7.4

