Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38982 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgACPJr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 10:09:47 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 Jan 2020 00:09:02 +0900
Message-ID: <CAK7LNATRUHZSvrhzm8MkGhHO1G4L=ZbTjo+8m4tmXSZcEE_8bg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.5-rc5
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes.
Thanks!



The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.5-2

for you to fetch changes up to 8ffdc54b6f4cd718a45802e645bb853e3a46a078:

  kbuild/deb-pkg: annotate libelf-dev dependency as :native
(2020-01-04 00:00:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.5 (2nd)

 - fix build error in usr/gen_initramfs_list.sh

 - fix libelf-dev dependency in deb-pkg build

----------------------------------------------------------------
Ard Biesheuvel (1):
      kbuild/deb-pkg: annotate libelf-dev dependency as :native

Masahiro Yamada (1):
      gen_initramfs_list.sh: fix 'bad variable name' error

 scripts/package/mkdebian  | 2 +-
 usr/gen_initramfs_list.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


-- 
Best Regards
Masahiro Yamada
