Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44974 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbdINO52 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2017 10:57:28 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Sep 2017 23:56:31 +0900
Message-ID: <CAK7LNASodR-_vr+yVPv4rHoe_LXhUjRwd7moSh0gwkn9JO0HAA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v4.14
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Here are Kbuild updates for v4.14.
Please pull!


The following changes since commit aae4e7a8bc44722fe70d58920a36916b1043195e:

  Linux 4.13-rc4 (2017-08-06 18:44:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.14

for you to fetch changes up to 77780f799e66cd261746a281dbbef1ee0c6997cd:

  kbuild: buildtar: do not print successful message if tar returns
error (2017-09-13 00:20:33 +0900)

----------------------------------------------------------------
Kbuild updates for v4.14

- Use Make-builtin $(abspath ...) helper to get absolute path

- Add W=2 extra warning option to detect unused macros

- Use more KCONFIG_CONFIG instead hard-coded .config

- Fix bugs of tar*-pkg targets

----------------------------------------------------------------
Johannes Thumshirn (1):
      Kbuild: enable -Wunused-macros warning for "make W=2"

Masahiro Yamada (3):
      kbuild: use $(abspath ...) instead of $(shell cd ... && /bin/pwd)
      kbuild: buildtar: fix tar error when CONFIG_MODULES is disabled
      kbuild: buildtar: do not print successful message if tar returns error

Nicolas Porcel (1):
      kbuild: Use KCONFIG_CONFIG in buildtar

 Makefile                       | 12 ++++++------
 scripts/Makefile.extrawarn     |  1 +
 scripts/gdb/linux/Makefile     |  2 +-
 scripts/package/buildtar       | 36 +++++++++++++++++-------------------
 tools/power/cpupower/Makefile  |  2 +-
 tools/scripts/Makefile.include |  6 +++---
 6 files changed, 29 insertions(+), 30 deletions(-)


-- 
Best Regards
Masahiro Yamada
