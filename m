Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17270 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBAEGs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 23:06:48 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2020 13:05:48 +0900
Message-ID: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull Kconfig updates for v5.6-rc1.

Thanks!


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.6

for you to fetch changes up to 2b5072b9dfab1bc9e4f605bba19b4470e429c60c:

  kconfig: fix documentation typos (2020-01-22 00:54:35 +0900)

----------------------------------------------------------------
Kconfig updates for v5.6

 - add 'yes2modconfig' and 'mod2yesconfig' targets

 - sanitize help text

 - various code cleanups

----------------------------------------------------------------
Bartosz Golaszewski (1):
      kconfig: fix an "implicit declaration of function" warning

Bjorn Helgaas (1):
      kconfig: fix documentation typos

Masahiro Yamada (12):
      kconfig: remove the rootmenu check in menu_add_prop()
      kconfig: use parent->dep as the parentdep of 'menu'
      kconfig: drop T_WORD from the RHS of 'prompt' symbol
      kconfig: remove 'prompt' symbol
      kconfig: move prompt handling to menu_add_prompt() from menu_add_prop()
      kconfig: remove 'prompt' argument from menu_add_prop()
      kconfig: remove sym from struct property
      kconfig: squash prop_alloc() into menu_add_prop()
      kconfig: localmodconfig: remove unused $config
      kconfig: localmodconfig: fix indentation for closing brace
      kconfig: fix too deep indentation in Makefile
      kconfig: use $(PERL) in Makefile

Tetsuo Handa (1):
      kconfig: Add yes2modconfig and mod2yesconfig targets.

Thomas Hebb (3):
      kconfig: list all definitions of a symbol in help text
      kconfig: distinguish between dependencies and visibility in help text
      kconfig: fix nesting of symbol help text

 Documentation/kbuild/kconfig-language.rst |   7 +-
 scripts/kconfig/Makefile                  |  24 ++--
 scripts/kconfig/conf.c                    |  16 +++
 scripts/kconfig/confdata.c                |  16 +++
 scripts/kconfig/expr.c                    |   3 +-
 scripts/kconfig/expr.h                    |   2 +-
 scripts/kconfig/gconf.c                   |   1 +
 scripts/kconfig/lkc.h                     |   4 +-
 scripts/kconfig/mconf.c                   |   1 +
 scripts/kconfig/menu.c                    | 185 ++++++++++++++++------------
 scripts/kconfig/nconf.c                   |   1 +
 scripts/kconfig/parser.y                  |  21 ++--
 scripts/kconfig/streamline_config.pl      |   4 +-
 scripts/kconfig/symbol.c                  |  22 ----
 14 files changed, 174 insertions(+), 133 deletions(-)


-- 
Best Regards
Masahiro Yamada
