Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33027 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBAEGT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 23:06:19 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2020 13:05:32 +0900
Message-ID: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull Kbuild updates for v5.6-rc1.

Thanks!


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538=
:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.6

for you to fetch changes up to 451dff37f0752cc8ad6f1bb82081a98d7b760310:

  builddeb: split libc headers deployment out into a function
(2020-01-29 01:51:30 +0900)

----------------------------------------------------------------
Kbuild updates for v5.6

 - detect missing include guard in UAPI headers

 - do not create orphan built-in.a or obj-y objects

 - generate modules.builtin more simply, and drop tristate.conf

 - simplify built-in initramfs creation

 - make linux-headers deb package thinner

 - optimize the deb package build script

 - misc cleanups

----------------------------------------------------------------
Masahiro Yamada (32):
      kbuild: detect missing include guard for exported headers
      kbuild: rename header-test- to no-header-test in usr/include/Makefile
      kbuild: do not create orphan built-in.a or obj-y objects
      kbuild: use pattern rule for building built-in.a in sub-directories
      kbuild: add stringify helper to quote a string passed to C files
      kbuild: pass KBUILD_MODFILE when compiling builtin objects
      kbuild: create modules.builtin without Makefile.modbuiltin or
tristate.conf
      initramfs: replace klibcdirs in Makefile with FORCE
      gen_initramfs_list.sh: remove unused variable 'default_list'
      gen_initramfs_list.sh: fix the tool name in the comment
      initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
      initramfs: remove redundant dependency on BLK_DEV_INITRD
      initramfs: make compression options not depend on INITRAMFS_SOURCE
      initramfs: make initramfs compression choice non-optional
      initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in Makef=
ile
      initramfs: generate dependency list and cpio at the same time
      initramfs: add default_cpio_list, and delete -d option support
      gen_initramfs.sh: always output cpio even without -o option
      initramfs: refactor the initramfs build rules
      gen_initramfs.sh: remove intermediate cpio_list on errors
      modpost: assume STT_SPARC_REGISTER is defined
      kbuild: remove PYTHON2 variable
      kbuild: remove *.tmp file when filechk fails
      kbuild: remove 'Building modules, stage 2.' log
      kbuild: use -S instead of -E for precise cc-option test in Kconfig
      builddeb: remove unneeded files in hdrobjfiles for headers package
      builddeb: match temporary directory name to the package name
      builddeb: remove redundant $objtree/
      builddeb: avoid invoking sub-shells where possible
      builddeb: remove redundant make for ARCH=3Dum
      builddeb: split kernel headers deployment out into a function
      builddeb: split libc headers deployment out into a function

Micha=C5=82 Miros=C5=82aw (2):
      builddeb: make headers package thinner
      builddeb: allow selection of .deb compressor

 Documentation/kbuild/kconfig.rst                |   5 -
 Makefile                                        |  24 +---
 include/linux/module.h                          |  12 +-
 scripts/Kbuild.include                          |  25 ++--
 scripts/Kconfig.include                         |   2 +-
 scripts/Makefile.build                          |   4 +-
 scripts/Makefile.lib                            |  21 ++-
 scripts/Makefile.modbuiltin                     |  57 --------
 scripts/Makefile.modpost                        |   1 -
 scripts/kconfig/confdata.c                      |  45 +-----
 scripts/link-vmlinux.sh                         |   4 +
 scripts/mod/modpost.c                           |   8 +-
 scripts/package/builddeb                        | 106 ++++++++------
 usr/.gitignore                                  |   8 +-
 usr/Kconfig                                     |  26 ----
 usr/Makefile                                    |  97 ++++++++-----
 usr/default_cpio_list                           |   6 +
 usr/{gen_initramfs_list.sh =3D> gen_initramfs.sh} | 167 ++++++------------=
----
 usr/include/Makefile                            | 107 +++++++-------
 usr/initramfs_data.S                            |   5 +-
 20 files changed, 281 insertions(+), 449 deletions(-)
 delete mode 100644 scripts/Makefile.modbuiltin
 create mode 100644 usr/default_cpio_list
 rename usr/{gen_initramfs_list.sh =3D> gen_initramfs.sh} (53%)


--=20
Best Regards
Masahiro Yamada
