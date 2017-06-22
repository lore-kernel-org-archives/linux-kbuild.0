Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36394 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdFVMjm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 08:39:42 -0400
Received: by mail-pf0-f194.google.com with SMTP id y7so2743782pfd.3
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 05:39:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 0/3] fix ia64, tile, sh for thin archives
Date: Thu, 22 Jun 2017 22:39:26 +1000
Message-Id: <20170622123929.15054-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

This is a re-work of the vdso symbol linking patches to avoid the
problem,

  ld: warning: .note.gnu.build-id  section discarded, --build-id ignored.

I was able to reproduce the problem, and I have compiled
defconfig for 3 architectures here with this new approach
and I saw no problems.

Please replace the existing patches in kbuild/thin-ac with these
3 if you agree with them.

Thanks,
Nick

Nicholas Piggin (3):
  sh: thin archives fix linking
  ia64: thin archives fix linking
  tile: thin archives fix linking

 arch/ia64/kernel/Makefile.gate   | 12 +++++++-----
 arch/sh/kernel/vsyscall/Makefile | 16 +++++++++-------
 arch/tile/kernel/vdso/Makefile   | 14 ++++++++------
 3 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.11.0

