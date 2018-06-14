Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:43054 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754871AbeFNKha (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 06:37:30 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] Some more changes for stack protector config symbols
Date: Thu, 14 Jun 2018 19:36:42 +0900
Message-Id: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Linus,

While I was checking the renaming commit,
I noticed some more fixups.

The first two patches take care of what I missed to update.

The last one is another renaming for consistency.
(Sorry, I should have asked you that.)

Please consider applying this series.



Masahiro Yamada (3):
  x86: fix dependency of X86_32_LAZY_GS
  kconfig: tinyconfig: remove stale stack protector fixups
  Kbuild: rename HAVE_CC_STACKPROTECTOR config variable

 Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
 arch/Kconfig                                                 | 4 ++--
 arch/arm/Kconfig                                             | 2 +-
 arch/arm64/Kconfig                                           | 2 +-
 arch/mips/Kconfig                                            | 2 +-
 arch/sh/Kconfig                                              | 2 +-
 arch/x86/Kconfig                                             | 4 ++--
 arch/xtensa/Kconfig                                          | 2 +-
 kernel/configs/tiny.config                                   | 4 ----
 9 files changed, 10 insertions(+), 14 deletions(-)

-- 
2.7.4

