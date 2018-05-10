Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34197 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755004AbeEJFRL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 01:17:11 -0400
Received: by mail-pf0-f194.google.com with SMTP id a14-v6so498414pfi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 22:17:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 0/5] kbuild and powerpc patches for new Kconfig language
Date: Thu, 10 May 2018 15:16:54 +1000
Message-Id: <20180510051659.15356-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

I came back to these patches and I think I have solved the remaining
problems -- it now builds with 64-bit big and little endian (using a
le toolchain), and also 32-bit big using 64le toolchain. There might
be some build failures still left, but it seems to be in much better
shape now.

Reviews would be welcome. I don't quite know how it should be merged,
maybe via the kbuild tree after acks from powerpc maintainer. We can
decide that after it gets more testing and review.

Thanks,
Nick

Nicholas Piggin (5):
  powerpc/kbuild: set default generic machine type for 32-bit compile
  powerpc/kbuild: remove CROSS32 defines from top level powerpc Makefile
  kbuild: call cc-option with the current set of KBUILD_CFLAGS
  powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
  powerpc/kbuild: move -mprofile-kernel check to Kconfig

 arch/powerpc/Kconfig                          | 16 +------
 arch/powerpc/Makefile                         | 46 +++++++------------
 arch/powerpc/boot/Makefile                    | 16 +++++--
 arch/powerpc/kernel/vdso32/Makefile           | 15 ++++--
 .../tools/gcc-check-mprofile-kernel.sh        |  4 +-
 scripts/Kbuild.include                        |  8 ++--
 scripts/recordmcount.pl                       |  8 ++++
 7 files changed, 54 insertions(+), 59 deletions(-)

-- 
2.17.0

