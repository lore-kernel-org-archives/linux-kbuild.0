Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64263 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbdKQRXg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 12:23:36 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Nov 2017 02:22:43 +0900
Message-ID: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Here are Kbuild updates for v4.15.  Please pull!



The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

  Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.15

for you to fetch changes up to 7f855fc805cd9c29867aed56cc20f818b36a7b7b:

  kbuild: move coccicheck help from scripts/Makefile.help to top
Makefile (2017-11-17 00:33:09 +0900)

----------------------------------------------------------------
Kbuild updates for v4.15

One of the most remarkable improvements in this cycle is, Kbuild is
now able to cache the result of shell commands.  Some variables are
expensive to compute, for example, $(call cc-option,...) invokes the
compiler.  It is not efficient to redo this computation every time,
even when we are not actually building anything.  Kbuild creates a
hidden file ".cache.mk" that contains invoked shell commands and
their results.  The speed-up should be noticeable.

Summary:

- Fix arch build issues (hexagon, sh)

- Clean up various Makefiles and scripts

- Fix wrong usage of {CFLAGS,LDFLAGS}_MODULE in arch Makefiles

- Cache variables that are expensive to compute

- Improve cc-ldopton and ld-option for Clang

- Optimize output directory creation

----------------------------------------------------------------
Cao jin (4):
      kbuild: comments cleanup in Makefile.lib
      arm/kbuild: replace {C, LD}FLAGS_MODULE with KBUILD_{C, LD}FLAGS_MODULE
      c6x/kbuild: replace CFLAGS_MODULE with KBUILD_CFLAGS_MODULE
      hexagon/kbuild: replace CFLAGS_MODULE with KBUILD_CFLAGS_MODULE

Douglas Anderson (2):
      kbuild: Add a cache for generated variables
      kbuild: Cache a few more calls to the compiler

Masahiro Yamada (22):
      hexagon: get rid of #include <generated/compile.h>
      kbuild: link-vmlinux.sh: simplify .version increment
      kbuild: mkcompile_h: do not create .version
      kbuild: replace $(hdr-arch) with $(SRCARCH)
      kbuild: move "_all" target out of $(KBUILD_SRC) conditional
      kbuild: re-order the code to not parse unnecessary variables
      kbuild: remove KBUILD_SUBDIR_ASFLAGS and KBUILD_SUBDIR_CCFLAGS
      kbuild: add forward declaration of default target to Makefile.asm-generic
      kbuild: do not call cc-option before KBUILD_CFLAGS initialization
      kbuild: shrink .cache.mk when it exceeds 1000 lines
      sh: select KBUILD_DEFCONFIG depending on ARCH
      kbuild: create directory for make cache only when necessary
      kbuild: remove redundant $(wildcard ...) for cmd_files calculation
      kbuild: filter-out PHONY targets from "targets"
      kbuild: create object directories simpler and faster
      kbuild: optimize object directory creation for incremental build
      kbuild: remove redundant mkdir from ./Kbuild
      kbuild: specify FORCE in Makefile.headersinst as .PHONY target
      selinux: remove unnecessary assignment to subdir-
      frv: .gitignore: ignore vmlinux.lds
      sh: decompressor: add shipped files to .gitignore
      kbuild: move coccicheck help from scripts/Makefile.help to top Makefile

Nick Desaulniers (2):
      kbuild: clang: remove crufty HOSTCFLAGS
      kbuild: fix linker feature test macros when cross compiling with Clang

 Kbuild                             |   2 -
 Makefile                           | 300 ++++++++++++++--------------
 arch/arm/Makefile                  |   6 +-
 arch/c6x/Makefile                  |   2 +-
 arch/frv/kernel/.gitignore         |   1 +
 arch/hexagon/Makefile              |   6 +-
 arch/hexagon/kernel/ptrace.c       |   4 +-
 arch/sh/Makefile                   |   8 +-
 arch/sh/boot/compressed/.gitignore |   5 +
 arch/x86/entry/vdso/Makefile       |   4 -
 scripts/Kbuild.include             | 106 ++++++++--
 scripts/Makefile.asm-generic       |   3 +
 scripts/Makefile.build             |  25 +--
 scripts/Makefile.headersinst       |  10 +-
 scripts/Makefile.help              |   3 -
 scripts/Makefile.host              |  12 --
 scripts/Makefile.lib               |  34 +---
 scripts/Makefile.modpost           |   3 +-
 scripts/link-vmlinux.sh            |  15 +-
 scripts/mkcompile_h                |   7 +-
 scripts/selinux/Makefile           |   1 -
 21 files changed, 297 insertions(+), 260 deletions(-)
 create mode 100644 arch/frv/kernel/.gitignore
 delete mode 100644 scripts/Makefile.help


-- 
Best Regards
Masahiro Yamada
