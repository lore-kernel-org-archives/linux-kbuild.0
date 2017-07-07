Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45057 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752953AbdGGAHF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 20:07:05 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Jul 2017 09:06:36 +0900
Message-ID: <CAK7LNATckAMF=2Z2NsUxbgr07QYbjxcSxVFbmiBd5Bp1eo53Mw@mail.gmail.com>
Subject: [GIT PULL 1/3] Kbuild updates for v4.13
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Linus,

Here are Kbuild updates for v4.13.  Please pull!


I think you will see a trivial merge conflict in
arch/arm/include/uapi/asm/Kbuild.

Please replace "genhdr-y" with "generated-y",
keeping the "generic-y += siginfo.h" line.

The diff will look like this:

---------------------------------
@@@ -1,8 -1,6 +1,8 @@@
  # UAPI Header export list
  include include/uapi/asm-generic/Kbuild.asm

- genhdr-y += unistd-common.h
- genhdr-y += unistd-oabi.h
- genhdr-y += unistd-eabi.h
+ generated-y += unistd-common.h
+ generated-y += unistd-oabi.h
+ generated-y += unistd-eabi.h
 +
 +generic-y += siginfo.h
----------------------------------



The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.13

for you to fetch changes up to c4e6fff1ae5729c2af159008b13fca39fbbac70e:

  kbuild: improve comments on KBUILD_SRC (2017-07-03 08:03:10 +0900)

----------------------------------------------------------------
Kbuild updates for v4.13

- Clean up Makefiles and scripts

- Improve clang support

- Remove unneeded genhdr-y syntax

- Remove unneeded cc-option-align macro

- Introduce __cc-option macro and use it to fix x86 boot code compiler flags

----------------------------------------------------------------
Arnd Bergmann (1):
      kbuild: speed up checksyscalls.sh

Cao jin (1):
      kbuild: improve comments on KBUILD_SRC

Masahiro Yamada (4):
      kbuild: simplify silent build (-s) detection
      kbuild: remove duplicated arch/*/include/generated/uapi include path
      kbuild: replace genhdr-y with generated-y
      kbuild: remove cc-option-align

Matthias Kaehlcke (4):
      kbuild: clang: Disable 'address-of-packed-member' warning
      kbuild: Add __cc-option macro
      x86/build: Use __cc-option for boot code compiler options
      x86/build: Specify stack alignment for clang

 Documentation/kbuild/makefiles.txt | 41
++++++-----------------------------------
 Makefile                           | 24 ++++++++----------------
 arch/arm/include/uapi/asm/Kbuild   |  6 +++---
 arch/x86/Makefile                  | 33 +++++++++++++++++++++++++--------
 arch/x86/Makefile_32.cpu           |  7 +++----
 arch/x86/include/uapi/asm/Kbuild   |  6 +++---
 scripts/Kbuild.include             | 19 ++++++++++++-------
 scripts/Makefile.asm-generic       |  2 +-
 scripts/Makefile.host              |  6 ------
 scripts/checksyscalls.sh           | 11 ++++-------
 tools/build/Makefile.build         |  8 +-------
 tools/scripts/Makefile.include     |  8 +-------
 12 files changed, 67 insertions(+), 104 deletions(-)


-- 
Best Regards
Masahiro Yamada
