Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:40851 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfJTQSj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Oct 2019 12:18:39 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 21 Oct 2019 01:17:57 +0900
Message-ID: <CAK7LNAScdn6BuvdrVhW=We50f8_618+hh72d2q6rZbSP1u5Abg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.4-rc4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes. Thanks.



The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.4-2

for you to fetch changes up to 700dea5a0bea9f64eba89fae7cb2540326fdfdc1:

  kheaders: substituting --sort in archive creation (2019-10-17 09:08:19 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.4 (2nd)

 - fix a bashism of setlocalversion

 - do not use the too new --sort option of tar

----------------------------------------------------------------
Dmitry Goldin (1):
      kheaders: substituting --sort in archive creation

Masahiro Yamada (1):
      kbuild: update comment about KBUILD_ALLDIRS

Randy Dunlap (1):
      scripts: setlocalversion: fix a bashism

 Makefile                |  2 +-
 kernel/gen_kheaders.sh  | 11 +++++++----
 scripts/setlocalversion |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)


-- 
Best Regards
Masahiro Yamada
