Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62303 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgCSPXG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 11:23:06 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Mar 2020 00:22:09 +0900
Message-ID: <CAK7LNASTxvF9AbddpkgABM2fAmvCP_bwCCrS9gmeDN0w-ZjfwA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.6-rc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull more Kbuild fixes.
Thanks.



The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b=
:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.6-3

for you to fetch changes up to 7883a14339299773b2ce08dcfd97c63c199a9289:

  scripts/kallsyms: fix wrong kallsyms_relative_base (2020-03-19 23:40:20 +=
0900)

----------------------------------------------------------------
Kbuild fixes for v5.6 (3rd)

 - fix __uint128_t capability test in Kconfig when GCC that defaults
   to 32-bit is used to build the 64-bit kernel

 - suppress new noisy Clang warnings -Wpointer-to-enum-cast

 - move the namespace field in Module.symvers for the backward
   compatibility reason for the depmod tool

 - use available compression for initramdisk when INTRAMFS_SOURCE
   is defined, which was the original behavior

 - fix modpost to handle correct large section numbers when it refers
   to modversion CRCs and module namespaces

 - fix comments and documents

----------------------------------------------------------------
Eugeniy Paltsev (1):
      initramfs: restore default compression behavior

Jessica Yu (1):
      modpost: move the namespace field in Module.symvers last

Masahiro Yamada (3):
      kconfig: introduce m32-flag and m64-flag
      int128: fix __uint128_t compiler test in Kconfig
      kbuild: doc: fix references to other documents

Mikhail Petrov (1):
      scripts/kallsyms: fix wrong kallsyms_relative_base

Nathan Chancellor (1):
      kbuild: Disable -Wpointer-to-enum-cast

SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) (1):
      kbuild: Fix inconsistent comment

Xiao Yang (1):
      modpost: Get proper section index by get_secindex() instead of st_shn=
dx

 Documentation/kbuild/kbuild.rst                 |  2 +-
 Documentation/kbuild/kconfig-macro-language.rst |  2 +-
 Documentation/kbuild/makefiles.rst              |  6 +++---
 Documentation/kbuild/modules.rst                |  4 ++--
 Makefile                                        |  2 +-
 init/Kconfig                                    |  3 +--
 scripts/Kconfig.include                         |  7 ++++++
 scripts/Makefile.extrawarn                      |  1 +
 scripts/export_report.pl                        |  2 +-
 scripts/kallsyms.c                              |  8 +++----
 scripts/mod/modpost.c                           | 27 ++++++++++++---------=
---
 usr/Kconfig                                     | 22 +++++++++----------
 12 files changed, 47 insertions(+), 39 deletions(-)


--=20
Best Regards
Masahiro Yamada
