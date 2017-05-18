Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52860 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755246AbdERPpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 11:45:40 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 May 2017 00:45:36 +0900
Message-ID: <CAK7LNATvOxyaUmvhez4+oKmBBS1Wo73-xZeJSH4gn-7pc6KsPg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.12-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull one urgent fix of headers_install.



The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.12

for you to fetch changes up to 05d8cba4a1e8c7e2d1f91a24a2f3d26852938a04:

  kbuild: skip install/check of headers right under uapi directories
(2017-05-18 02:17:45 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.12

- fix headers_install to not delete pre-existing headers
  in the install destination

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: skip install/check of headers right under uapi directories

 Makefile                     |  2 +-
 scripts/Makefile.headersinst | 43 +++++++++++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 17 deletions(-)


-- 
Best Regards
Masahiro Yamada
