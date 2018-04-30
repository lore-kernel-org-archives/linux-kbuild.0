Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35080 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbeD3BYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Apr 2018 21:24:02 -0400
Received: by mail-pg0-f67.google.com with SMTP id j11-v6so5257288pgf.2
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Apr 2018 18:24:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 0/2] powerpc patches for new Kconfig language
Date: Mon, 30 Apr 2018 11:23:49 +1000
Message-Id: <20180430012351.28814-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

I was taking a look at this nice new Kconfig feature here:

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=kconfig-shell-v3

And came up with some patches for it for powerpc. Hopefully after
some review, these patches could be acked by powerpc maintainers and
go into the kbuild tree (or the problems solved a different way).

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
  powerpc/kbuild: move -mprofile-kernel check to Kconfig

 arch/powerpc/Kconfig                          | 16 +----------
 arch/powerpc/Makefile                         | 28 ++++++-------------
 .../tools/gcc-check-mprofile-kernel.sh        |  4 +--
 3 files changed, 12 insertions(+), 36 deletions(-)

-- 
2.17.0

