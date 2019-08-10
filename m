Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34751 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfHJCLA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Aug 2019 22:11:00 -0400
MIME-Version: 1.0
From: Masahiro YAMADA <masahir0yamad@gmail.com>
Date: Sat, 10 Aug 2019 11:10:22 +0900
Message-ID: <CAK7LNAQGV+CFP6o3_iQNH3x6boXWH=2JN8j7WPJbtyi=eF6=dg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull more Kbuild fixes.
Thanks!


The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:

  Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3-3

for you to fetch changes up to c07d8d47bca1b325102fa2be3a463075f7b051d9:

  kbuild: show hint if subdir-y/m is used to visit module Makefile
(2019-08-10 01:45:31 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3 (3rd)

 - revive single target %.ko

 - do not create built-in.a where it is unneeded

 - do not create modules.order where it is unneeded

 - show a warning if subdir-y/m is used to visit a module Makefile

----------------------------------------------------------------
Masahiro Yamada (4):
      kbuild: revive single target %.ko
      kbuild: fix false-positive need-builtin calculation
      kbuild: generate modules.order only in directories visited by obj-y/m
      kbuild: show hint if subdir-y/m is used to visit module Makefile

 Makefile                 | 13 ++++++++++++-
 scripts/Makefile.build   | 11 ++++++++++-
 scripts/Makefile.modpost |  6 ++----
 3 files changed, 24 insertions(+), 6 deletions(-)
