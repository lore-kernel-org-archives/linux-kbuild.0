Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28855 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbeGTIfM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 00/11] kbuild/kconfig: do not update config during installation
Date: Fri, 20 Jul 2018 16:46:25 +0900
Message-Id: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org


The main motivation of this patch series is to suppress the syncconfig
during running installation targets.

V1 consisted of only two patches:
  https://patchwork.kernel.org/patch/10468105/
  https://patchwork.kernel.org/patch/10468103/

I noticed that installation targets would continue running
even if the source tree is not configured at all
because the inclusion of include/config/auto.conf was optional.

So, I added one more patch in V2:
 https://patchwork.kernel.org/patch/10483637/

However, kbuild test robot reported a new warning message was displayed:

Makefile:592: include/config/auto.conf: No such file or directory

This warning is displayed only for Make 4.1 or older.

To fix this annoying warning, I changed Kconfig too,
which leaded to more clean-up, improvements in Kconfig.

So, V3 became a big patch series.

Only a few changes for V4.
 - I dropped the last patch in v3.
 - I am keeping include/config/auto.conf as the prerequisite of modules.builtin (11/11)


Masahiro Yamada (11):
  kconfig: rename file_write_dep and move it to confdata.c
  kconfig: split out useful helpers in confdata.c
  kconfig: remove unneeded directory generation from local*config
  kconfig: create directories needed for syncconfig by itself
  kconfig: make syncconfig update .config regardless of sym_change_count
  kconfig: allow all config targets to write auto.conf if missing
  kbuild: use 'include' directive to load auto.conf from top Makefile
  kbuild: add .DELETE_ON_ERROR special target
  kbuild: do not update config when running install targets
  kbuild: do not update config for 'make kernelrelease'
  kbuild: remove auto.conf from prerequisite of phony targets

 Makefile                    |  44 +++++++++------
 scripts/Kbuild.include      |   3 +
 scripts/kconfig/Makefile    |  16 ++----
 scripts/kconfig/conf.c      |  39 +++++++------
 scripts/kconfig/confdata.c  | 135 +++++++++++++++++++++++++++++++++++++-------
 scripts/kconfig/gconf.c     |   1 +
 scripts/kconfig/lkc.h       |   1 -
 scripts/kconfig/lkc_proto.h |   2 +-
 scripts/kconfig/mconf.c     |   1 +
 scripts/kconfig/nconf.c     |   1 +
 scripts/kconfig/qconf.cc    |   2 +
 scripts/kconfig/util.c      |  30 ----------
 12 files changed, 177 insertions(+), 98 deletions(-)

-- 
2.7.4

