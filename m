Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28213 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgFFPWq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 11:22:46 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 7 Jun 2020 00:21:54 +0900
Message-ID: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.8-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull Kconfig updates for v5.8-rc1

Thanks.


The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.8

for you to fetch changes up to bcfefb61cd2bc86329915a4074f7b4c48b00b33a:

  kconfig: announce removal of 'kvmconfig' and 'xenconfig' shorthands
(2020-05-26 00:02:32 +0900)

----------------------------------------------------------------
Kconfig updates for v5.8

 - allow only 'config', 'comment', 'if' statements inside 'choice' since
   the other statements are not sensible inside 'choice' and should be
   grammatical error

 - support LMC_KEEP env variable for 'make local{yes,mod}config' to
   preserve some CONFIG options

 - deprecate 'make kvmconfig' and 'make xenconfig' in favor of
   'make kvm_guest.config' and 'make xen.config'

 - code cleanups

----------------------------------------------------------------
Changbin Du (1):
      streamline_config.pl: add LMC_KEEP to preserve some kconfigs

Masahiro Yamada (5):
      kconfig: do not use OR-assignment for zero-cleared structure
      kconfig: do not assign a variable in the return statement
      kconfig: tests: remove randconfig test for choice in choice
      kconfig: allow only 'config', 'comment', and 'if' inside 'choice'
      kconfig: announce removal of 'kvmconfig' and 'xenconfig' shorthands

 Documentation/admin-guide/README.rst            | 11 ++++--
 scripts/kconfig/Makefile                        | 11 +++---
 scripts/kconfig/menu.c                          |  3 +-
 scripts/kconfig/parser.y                        | 30 ++++++++--------
 scripts/kconfig/streamline_config.pl            | 21 +++++++++++
 scripts/kconfig/symbol.c                        |  2 +-
 .../kconfig/tests/rand_nested_choice/Kconfig    | 35 -------------------
 .../tests/rand_nested_choice/__init__.py        | 17 ---------
 .../tests/rand_nested_choice/expected_stdout0   |  2 --
 .../tests/rand_nested_choice/expected_stdout1   |  4 ---
 .../tests/rand_nested_choice/expected_stdout2   |  5 ---
 11 files changed, 55 insertions(+), 86 deletions(-)
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/Kconfig
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/__init__.py
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout0
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout1
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout2


-- 
Best Regards
Masahiro Yamada
