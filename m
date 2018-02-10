Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:43630 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751049AbeBJOZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Feb 2018 09:25:16 -0500
Received: by mail-pg0-f66.google.com with SMTP id f6so5220194pgs.10
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Feb 2018 06:25:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/2] remove the last of incremental linking
Date: Sun, 11 Feb 2018 00:25:02 +1000
Message-Id: <20180210142504.29890-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

I don't think there is any point to keeping around the deprecated
incremental linking option for too long. So I propose to remove it.

After that is removed, I wonder what people think of changing from
built-in.o to built-in.a?

Thanks,
Nick

Nicholas Piggin (2):
  kbuild: remove incremental linking option
  kbuild: rename built-in.o to built-in.a

 Documentation/kbuild/makefiles.txt | 22 ++++++---
 Documentation/process/changes.rst  |  2 +-
 Makefile                           | 14 +++---
 arch/Kconfig                       |  6 ---
 arch/blackfin/kernel/bfin_ksyms.c  |  2 +-
 arch/powerpc/kernel/Makefile       |  2 +-
 drivers/s390/Makefile              |  2 +-
 lib/Kconfig.debug                  |  4 +-
 scripts/Makefile.build             | 38 ++++++---------
 scripts/Makefile.lib               |  6 +--
 scripts/link-vmlinux.sh            | 99 ++++++++++++++------------------------
 scripts/namespace.pl               |  2 +-
 usr/initramfs_data.S               |  2 +-
 13 files changed, 82 insertions(+), 119 deletions(-)

-- 
2.15.1

