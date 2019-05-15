Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20132 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEOP5b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 11:57:31 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 May 2019 00:56:47 +0900
Message-ID: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
Subject: [GIT PULL] Kconfig updates for v5.2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull Kconfig updates for v5.2

Thanks.



The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.2

for you to fetch changes up to 9b9f5948afcdf583cb1b58e0c4cc327aa1820f5a:

  kconfig: make conf_get_autoconfig_name() static (2019-05-14 23:23:25 +0900)

----------------------------------------------------------------
Kconfig updates for v5.2

 - error out if a user specifies a directory instead of a file from
   "Save" menu of GUI interfaces

 - do not overwrite .config if there is no change in the configuration

 - create parent directories as needed when a user specifies a new file
   path from "Save" menu of menuconfig/nconfig

 - fix potential buffer overflow

 - some trivial cleanups

----------------------------------------------------------------
Jacob Garber (1):
      kconfig: use snprintf for formatting pathnames

Masahiro Yamada (6):
      kconfig: remove trailing whitespaces
      kconfig: do not accept a directory for configuration output
      kconfig: do not write .config if the content is the same
      kconfig: make parent directories for the saved .config as needed
      kconfig: remove useless NULL pointer check in conf_write_dep()
      kconfig: make conf_get_autoconfig_name() static

Petr Vorel (1):
      kconfig: Make nconf-cfg.sh executable

 scripts/kconfig/confdata.c               | 121 ++++++++++++++-------
 scripts/kconfig/gconf.c                  |   2 +-
 scripts/kconfig/lexer.l                  |   3 +-
 scripts/kconfig/lkc.h                    |   1 -
 scripts/kconfig/lxdialog/BIG.FAT.WARNING |   2 +-
 scripts/kconfig/mconf.c                  |   2 +-
 scripts/kconfig/nconf-cfg.sh             |   0
 scripts/kconfig/nconf.c                  |   3 +-
 8 files changed, 89 insertions(+), 45 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/nconf-cfg.sh


-- 
Best Regards
Masahiro Yamada
