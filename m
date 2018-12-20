Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33360 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730884AbeLTNNt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Dec 2018 08:13:49 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 20 Dec 2018 22:12:44 +0900
Message-ID: <CAK7LNAQHKJzY9giP-A5Q5+tp_JuH_bnDTzgbGnBCiAMbCVVevw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.20
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull one fix for v4.20 release.

Thanks!



The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.20-2

for you to fetch changes up to ef7cfd00b2caf6edeb7f169682b64be2d0a798cf:

  kbuild: fix false positive warning/error about missing libelf
(2018-12-20 00:04:15 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.20 (2nd)

 - fix false positive warning/error about missing library for objtool

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: fix false positive warning/error about missing libelf

 Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)


-- 
Best Regards
Masahiro Yamada
