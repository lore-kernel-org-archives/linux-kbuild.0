Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48531 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPxt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:49 -0400
Received: by gyd8 with SMTP id 8so1615205gyd.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:48 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 00/15] Kconfig generalization
Date: Sat, 11 Sep 2010 11:51:07 -0400
Message-Id: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi Sam, Michal,

You'll find hereafter the series for kconfig generalization and interfaces
changes with the rest of the kernel.

A quick summary of the serie is:
 - patch 1 -> 3: handles the CONFIG_ prefix, its build time definition and its
mention in help text.
 - patch 4: handles the reference to the 'kernel' keyword in various strings.
 - patch 5: takes care of the "linux" domain name used to get translation
   informations.
 - patch 6 -> 15 handles the mainmenu syntax changes and related.

This series is available in the git repository at:

 git://github.com/lacombar/linux-2.6.git kbuild-generic-v5

Comments welcome !

Thanks in advance,
 - Arnaud

Arnaud Lacombe (15):
  kconfig: replace a `switch()' statement by a more flexible `if()'
    statement
  kconfig: rephrase help text not to mention the internal prefix
  kconfig: allow build-time definition of the internal config prefix
  kconfig: rephrase help texts/comments not to include the package name
  kconfig: allow PACKAGE to be defined on the compiler's command-line
  kconfig: implement the `mainmenu' directive
  kconfig: add a symbol string expansion helper
  kconfig: expand by default the rootmenu's prompt
  kconfig: replace KERNELVERSION usage by the mainmenu's prompt
  kconfig: don't emit warning upon rootmenu's prompt redefinition
  kconfig: constify file name
  kconfig: use the file's name of sourced file
  kconfig: expand file names
  kconfig: regen parser
  kbuild: migrate all arch to the kconfig mainmenu upgrade

 Documentation/kbuild/kconfig-language.txt |    3 +-
 Kconfig                                   |   11 +
 arch/alpha/Kconfig                        |    4 -
 arch/arm/Kconfig                          |    7 -
 arch/avr32/Kconfig                        |    7 -
 arch/blackfin/Kconfig                     |    7 -
 arch/cris/Kconfig                         |    7 -
 arch/frv/Kconfig                          |    6 -
 arch/h8300/Kconfig                        |    7 -
 arch/ia64/Kconfig                         |    7 -
 arch/m32r/Kconfig                         |    7 -
 arch/m68k/Kconfig                         |    6 -
 arch/m68knommu/Kconfig                    |    7 -
 arch/microblaze/Kconfig                   |    5 -
 arch/mips/Kconfig                         |    2 -
 arch/mn10300/Kconfig                      |    9 -
 arch/parisc/Kconfig                       |    7 -
 arch/powerpc/Kconfig                      |    6 -
 arch/s390/Kconfig                         |    7 -
 arch/score/Kconfig                        |    5 -
 arch/sh/Kconfig                           |    7 -
 arch/sparc/Kconfig                        |    6 -
 arch/tile/Kconfig                         |    2 -
 arch/um/Kconfig.common                    |    2 -
 arch/x86/Kconfig                          |    3 -
 arch/xtensa/Kconfig                       |    5 -
 scripts/kconfig/Makefile                  |    2 +-
 scripts/kconfig/conf.c                    |   13 +-
 scripts/kconfig/confdata.c                |   77 ++---
 scripts/kconfig/expr.h                    |    2 +-
 scripts/kconfig/gconf.c                   |    8 +-
 scripts/kconfig/lex.zconf.c_shipped       |    5 +-
 scripts/kconfig/lkc.h                     |    6 +
 scripts/kconfig/lkc_proto.h               |    1 +
 scripts/kconfig/mconf.c                   |   64 ++--
 scripts/kconfig/menu.c                    |    4 +-
 scripts/kconfig/nconf.c                   |   73 ++---
 scripts/kconfig/qconf.cc                  |    6 +-
 scripts/kconfig/symbol.c                  |   49 +++
 scripts/kconfig/util.c                    |    7 +-
 scripts/kconfig/zconf.l                   |    5 +-
 scripts/kconfig/zconf.tab.c_shipped       |  547 +++++++++++++++--------------
 scripts/kconfig/zconf.y                   |   18 +-
 43 files changed, 489 insertions(+), 550 deletions(-)
 create mode 100644 Kconfig

-- 
1.7.2.30.gc37d7.dirty

