Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28223 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751675AbdIUPmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Sep 2017 11:42:24 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 22 Sep 2017 00:41:33 +0900
Message-ID: <CAK7LNAT5nU_3+NUrsvzbn3xYkqbo9CNfVMEsATt2i+JwOe0tmg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.14-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Here are some early Kbuild fixes.

The in-kernel firmware was removed during the previous merge window.
Since then, some bug reports of broken rpm building are flying in ML.
We need to fix it now.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.14

for you to fetch changes up to 25b080bd53f2873785fa049f570ac1b361c11d72:

  kbuild: rpm-pkg: fix version number handling (2017-09-21 00:06:03 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.14

- remove firmware install from rpm-pkg / deb-pkg

- fix mismatch between release number and UTS_VERSION for rpm-pkg

----------------------------------------------------------------
Masahiro Yamada (3):
      kbuild: rpm-pkg: delete firmware_install to fix build error
      kbuild: deb-pkg: remove firmware package support
      kbuild: rpm-pkg: fix version number handling

 scripts/mkversion        |  6 ------
 scripts/package/Makefile |  5 -----
 scripts/package/builddeb | 22 +---------------------
 scripts/package/mkspec   | 14 ++++----------
 4 files changed, 5 insertions(+), 42 deletions(-)
 delete mode 100644 scripts/mkversion



-- 
Best Regards
Masahiro Yamada
