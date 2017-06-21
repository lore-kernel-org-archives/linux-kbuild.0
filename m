Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:33693 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbdFUH4t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 03:56:49 -0400
Received: by mail-yw0-f193.google.com with SMTP id u13so9984954ywg.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 00:56:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/2] fix ia64 and tile for thin archives
Date: Wed, 21 Jun 2017 17:56:36 +1000
Message-Id: <20170621075638.19251-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

These fixes are similar to the sh fix already in the kbuild/thin-ar
tree.

Thanks,
Nick

Nicholas Piggin (2):
  ia64: thin archives fix linking
  tile: thin archives fix linking

 arch/ia64/Makefile             | 1 +
 arch/ia64/kernel/Makefile.gate | 3 ---
 arch/tile/Makefile             | 2 ++
 arch/tile/kernel/vdso/Makefile | 2 --
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.11.0

