Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58347 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbeHOUvL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 16:51:11 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Aug 2018 02:57:16 +0900
Message-ID: <CAK7LNAT9p+YPmvasWPG1qdriM+dkauf6h3bqJLnxTcZo8LG_SA@mail.gmail.com>
Subject: [GIT PULL 2/3] Kconfig updates for v4.19
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kconfig updates for v4.19


You will see a conflict in the top-level Makefile.

Please fix it like follows.  (it is also available in linux-next)

---------------------------------------------------------------
diff --cc Makefile
index cc4875d,f17dd99..a0650bf
--- a/Makefile
+++ b/Makefile
@@@ -224,11 -224,14 +224,14 @@@ clean-targets := %clean mrproper cleand
  no-dot-config-targets := $(clean-targets) \
                         cscope gtags TAGS tags help% %docs check% coccicheck \
                         $(version_h) headers_% archheaders archscripts \
 -                       kernelversion %src-pkg
 +                       %asm-generic kernelversion %src-pkg
+ no-sync-config-targets := $(no-dot-config-targets) install %install \
+                          kernelrelease

- config-targets := 0
- mixed-targets  := 0
- dot-config     := 1
+ config-targets  := 0
+ mixed-targets   := 0
+ dot-config      := 1
+ may-sync-config := 1

  ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
        ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
----------------------------------------------------------





The following changes since commit 9d3cce1e8b8561fed5f383d22a4d6949db4eadbe:

  Linux 4.18-rc5 (2018-07-15 12:49:31 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v4.19

for you to fetch changes up to 1880861226c13ddd42c34ddd30c3b502b650fe29:

  kconfig: remove P_ENV property type (2018-08-14 09:01:47 +0900)

----------------------------------------------------------------
Kconfig updates for v4.19

- show clearer error messages where pkg-config is needed, but not
  installed

- rename SYMBOL_AUTO to SYMBOL_NO_WRITE to reflect its semantics

- create all necessary directories by Kconfig tool itself instead
  of Makefile

- update the .config unconditionally when syncconfig is invoked

- use 'include' directive instead of '-include' where
  include/config/{auto,tristate}.conf is mandatory

- do not try to update the .config when running install targets

- add .DELETE_ON_ERROR to delete partially updated files

- misc cleanups and fixes

----------------------------------------------------------------
Dirk Gouders (2):
      kconfig: rename SYMBOL_AUTO to SYMBOL_NO_WRITE
      Kbuild: Makefile.modbuiltin: include auto.conf and tristate.conf mandatory

Masahiro Yamada (15):
      kconfig: handle format string before calling conf_message_callback()
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
      kconfig: fix the rule of mainmenu_stmt symbol
      kconfig: remove unused sym_get_env_prop() function
      kconfig: remove P_ENV property type

Randy Dunlap (2):
      kconfig: check for pkg-config on make {menu,n,g,x}config
      kconfig: fix typos in description of "choice" in kconfig-language.txt

Rob Landley (1):
      init/Kconfig: Use short unix-style option instead of --longname

 Documentation/kbuild/kconfig-language.txt |   4 +-
 Documentation/process/changes.rst         |   8 +++
 Makefile                                  |  44 +++++++-----
 init/Kconfig                              |   4 +-
 scripts/Kbuild.include                    |   3 +
 scripts/Makefile.modbuiltin               |   4 +-
 scripts/kconfig/Makefile                  |  17 ++---
 scripts/kconfig/check-pkgconfig.sh        |   8 +++
 scripts/kconfig/conf.c                    |  39 +++++-----
 scripts/kconfig/confdata.c                | 156
++++++++++++++++++++++++++++++++--------
 scripts/kconfig/expr.h                    |   3 +-
 scripts/kconfig/gconf.c                   |   5 +-
 scripts/kconfig/lkc.h                     |   2 -
 scripts/kconfig/lkc_proto.h               |   4 +-
 scripts/kconfig/mconf.c                   |  10 ++-
 scripts/kconfig/menu.c                    |   2 +-
 scripts/kconfig/nconf.c                   |   8 +--
 scripts/kconfig/qconf.cc                  |   3 +-
 scripts/kconfig/symbol.c                  |  13 +---
 scripts/kconfig/util.c                    |  30 --------
 scripts/kconfig/zconf.y                   |   6 +-
 21 files changed, 227 insertions(+), 146 deletions(-)
 create mode 100644 scripts/kconfig/check-pkgconfig.sh


-- 
Best Regards
Masahiro Yamada
