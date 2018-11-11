Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24133 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729222AbeKLCuS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Nov 2018 21:50:18 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Nov 2018 02:00:27 +0900
Message-ID: <CAK7LNASb25Js1sDLmRsfKrEyimat7-fETn-MEDGJtfQ9EfgUbw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.20-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild fixes.

Thanks!




The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.20

for you to fetch changes up to d5615e472d23e854e96192103b6ae7977e705f01:

  builddeb: Fix inclusion of dtbs in debian package (2018-11-11 23:04:53 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.20

 - fix build errors in binrpm-pkg and bindeb-pkg targets

 - fix false positive matches in merge_config.sh

 - fix build version mismatch in deb-pkg target

 - fix dtbs_install handling in (bin)deb-pkg target

 - revert a commit that allows setlocalversion to write to source tree

----------------------------------------------------------------
Guenter Roeck (1):
      Revert "scripts/setlocalversion: git: Make -dirty check more robust"

Masahiro Yamada (4):
      kbuild: rpm-pkg: fix binrpm-pkg breakage when O= is used
      kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
      kconfig: merge_config: avoid false positive matches from comment lines
      kbuild: deb-pkg: fix too low build version number

Rob Herring (1):
      builddeb: Fix inclusion of dtbs in debian package

 scripts/kconfig/merge_config.sh |  7 ++++---
 scripts/package/builddeb        |  6 +++---
 scripts/package/mkdebian        |  7 +++++--
 scripts/package/mkspec          | 11 ++++++-----
 scripts/setlocalversion         |  2 +-
 5 files changed, 19 insertions(+), 14 deletions(-)


-- 
Best Regards
Masahiro Yamada
