Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:40501 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752511AbeA3TGZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:06:25 -0500
Received: by mail-lf0-f44.google.com with SMTP id h92so16964940lfi.7
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2018 11:06:25 -0800 (PST)
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 00/10] Remove empty help texts from Kconfig files
Date: Tue, 30 Jan 2018 20:05:22 +0100
Message-Id: <20180130190555.6577-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

This is preparation for adding the warning in
https://lkml.org/lkml/2018/1/30/516 ("kconfig: Warn if help text is blank")

Empty help texts are probably either a typo, a Kconfig misunderstanding, or
some kind of half-committing to adding a help text (in which case a TODO
comment would be clearer, if the help text really can't be added right away).
Best to flag them, IMO.

Ulf Magnusson (10):
  net/sched: kconfig: Remove empty help texts
  video: fbdev: kconfig: Remove empty help text
  mmc: kconfig: Remove empty help text
  Staging: rtl8192u: kconfig: Remove empty help text
  Staging: rtl8192e: kconfig: Remove empty help text
  lib/Kconfig.debug: Remove empty help text
  MIPS: BCM63XX: kconfig: Remove empty help text
  MIPS: kconfig: Remove empty help text
  arm: vt8500: kconfig: Remove empty help text
  nios2: kconfig: Remove empty help text

 arch/arm/mach-vt8500/Kconfig              | 1 -
 arch/mips/Kconfig                         | 1 -
 arch/mips/bcm63xx/boards/Kconfig          | 1 -
 arch/nios2/Kconfig                        | 1 -
 drivers/mmc/host/Kconfig                  | 1 -
 drivers/staging/rtl8192e/rtl8192e/Kconfig | 1 -
 drivers/staging/rtl8192u/Kconfig          | 1 -
 drivers/video/fbdev/Kconfig               | 1 -
 lib/Kconfig.debug                         | 1 -
 net/sched/Kconfig                         | 3 ---
 10 files changed, 12 deletions(-)

-- 
2.14.1

