Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48083 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfEUACl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 20:02:41 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 May 2019 09:01:51 +0900
Message-ID: <CAK7LNAT2wVBP_yV3P=Eg_0_UUo8xCRZdJK5x1kOufKiYFv=A+Q@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.2-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild fixes.

Thanks.



The following changes since commit cb6f8739fbf98203d0fb0bc2c2dbbec0ddfe978a:

  Merge branch 'akpm' (patches from Andrew) (2019-05-19 12:15:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.2

for you to fetch changes up to 4a33d4f17a19ece50ccf5ccbb8bc4ee539fb492e:

  kbuild: do not check name uniqueness of builtin modules (2019-05-21
08:54:05 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.2

 - remove unused cc-ldoption

 - do not check the name uniquness of builtin modules to avoid
   false positives

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: do not check name uniqueness of builtin modules

Nick Desaulniers (1):
      kbuild: drop support for cc-ldoption

 Documentation/kbuild/makefiles.txt | 14 --------------
 scripts/Kbuild.include             |  5 -----
 scripts/modules-check.sh           |  6 +++---


-- 
Best Regards
Masahiro Yamada
