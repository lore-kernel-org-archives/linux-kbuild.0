Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35788 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdJHRML (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:11 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 0/6] kconfig: Fix memory leaks during parsing
Date: Sun,  8 Oct 2017 19:11:17 +0200
Message-Id: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Hello,

This patchset plugs all memory leaks that occur in the parser (zconf.y) while
parsing the x86 Kconfigs (and likely the other ARCHes too). I noticed that
Kconfig is pretty leaky while working on the fix for 'm' before MODULES
(http://www.spinics.net/lists/linux-kbuild/msg15606.html).

The biggest culprit is all symbol names being leaked outside of expressions:
316 KB leaked. 'source' filenames being leaked adds another 41 KB. The other
leaks are minor (< 1 KB each). The fixes can be applied independently.

This is mostly just to get a clean slate with Valgrind, but also cleans up the
code a bit as a side effect. Any performance difference (plus or minus) seems
to be in the noise.

Tested with the Kconfiglib test suite, which indirectly verifies that Kconfig
still generates the same .config for alldefconfig, allnoconfig, allyesconfig,
and all defconfigs, for all architectures. I also tested that menuconfig gets
the right main menu text with and without a 'mainmenu' statement.

As a reminder, the parsers can be rebuilt like this:

	$ make REGENERATE_PARSERS=1 conf

Here's an easy way to run Valgrind on menuconfig (nothing seems to look at
KERNELVERSION, so just set it to avoid a warning):

	$ ARCH=x86 SRCARCH=x86 KERNELVERSION=4.14.0-rc2 valgrind --leak-check=full scripts/kconfig/mconf Kconfig

Cheers,
Ulf

Ulf Magnusson (6):
  kconfig: Don't leak symbol names during parsing
  kconfig: Don't leak 'source' filenames during parsing
  kconfig: Don't leak 'option' arguments during parsing
  Kconfig: Don't leak main menus during parsing
  kconfig: Don't leak help strings during parsing
  kconfig: Regenerate parser

 scripts/kconfig/symbol.c            |   5 +
 scripts/kconfig/zconf.tab.c_shipped | 562 +++++++++++++++++++-----------------
 scripts/kconfig/zconf.y             |  77 +++--
 3 files changed, 349 insertions(+), 295 deletions(-)

-- 
2.7.4

