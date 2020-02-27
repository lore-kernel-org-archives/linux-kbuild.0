Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27297 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729430AbgB0RRu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 12:17:50 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Feb 2020 02:16:57 +0900
Message-ID: <CAK7LNASDV1hBV_4U6wHHMFfxsxctFhVpk4gUQ+pYMay1i4Memw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.6-rc4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some more Kbuild fixes.
Thanks!


The following changes since commit f8788d86ab28f61f7b46eb6be375f8a726783636:

  Linux 5.6-rc3 (2020-02-23 16:17:42 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.6-2

for you to fetch changes up to eabc8bcb292fb9a5757b0c8ab7751f41b0a104f8:

  kbuild: get rid of trailing slash from subdir- example (2020-02-27
10:03:27 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.6 (2nd)

 - fix missed rebuild of DT schema check

 - add some phony targets to PHONY

 - fix comments and documents

----------------------------------------------------------------
Masahiro Yamada (6):
      kbuild: remove wrong documentation about mandatory-y
      kbuild: fix DT binding schema rule to detect command line changes
      kbuild: remove unneeded semicolon at the end of cmd_dtb_check
      kbuild: add dtbs_check to PHONY
      kbuild: add dt_binding_check to PHONY in a correct place
      kbuild: get rid of trailing slash from subdir- example

Randy Dunlap (1):
      kbuild: add comment for V=2 mode

 Documentation/kbuild/makefiles.rst | 5 +----
 Makefile                           | 4 +++-
 scripts/Makefile.lib               | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)


-- 
Best Regards
Masahiro Yamada
