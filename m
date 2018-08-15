Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:56955 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729377AbeHOUtM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 16:49:12 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Aug 2018 02:55:15 +0900
Message-ID: <CAK7LNAQH4At6xG-+JBJ16+a=P8h6Nuk9oSfG6DF0Scd2O9i9cA@mail.gmail.com>
Subject: [GIT PULL 1/3] Kbuild updates for v4.19
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild updates for v4.19



You can pull this cleanly for now, but please remember that
you will have to change samples/statx/Makefile
when you pull the following commit:

commit 90b413cb970a25109deb292c99120cf65e5b03ce
Author: David Howells <dhowells@redhat.com>
Date:   Fri Aug 3 15:34:49 2018 +0100

    vfs: syscall: Add fsinfo() to query filesystem information



Kbuild consolidated host compiler flag variables,
but the vfs tree added one more occurrence.

Please fix-up the Makefile as follows:

---------------------------------------------------------
diff --git a/samples/statx/Makefile b/samples/statx/Makefile
index 05b4d30cdd3c..6a862bbc0627 100644
--- a/samples/statx/Makefile
+++ b/samples/statx/Makefile
@@ -7,6 +7,6 @@ always := $(hostprogs-y)
 HOSTCFLAGS_test-statx.o += -I$(objtree)/usr/include

 HOSTCFLAGS_test-fsinfo.o += -I$(objtree)/usr/include
-HOSTLOADLIBES_test-fsinfo += -lm
+HOSTLDLIBS_test-fsinfo += -lm

 HOSTCFLAGS_test-fs-query.o += -I$(objtree)/usr/include
-----------------------------------------------------------





The following changes since commit 9d3cce1e8b8561fed5f383d22a4d6949db4eadbe:

  Linux 4.18-rc5 (2018-07-15 12:49:31 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.19

for you to fetch changes up to 512ddf7d7db056edfed3159ea7cb4e4a5eefddd4:

  coccicheck: return proper error code on fail (2018-08-14 08:58:56 +0900)

----------------------------------------------------------------
Kbuild updates for v4.19

- verify depmod is installed before modules_install

- support build salt in case build ids must be unique between builds

- allow users to specify additional host compiler flags via HOST*FLAGS,
  and rename internal variables to KBUILD_HOST*FLAGS

- update buildtar script to drop vax support, add arm64 support

- update builddeb script for better debarch support

- document the pit-fall of if_changed usage

- fix parallel build of UML with O= option

- make 'samples' target depend on headers_install to fix build errors

- remove deprecated host-progs variable

- add a new coccinelle script for refcount_t vs atomic_t check

- improve double-test coccinelle script

- misc cleanups and fixes

----------------------------------------------------------------
Ben Hutchings (12):
      builddeb: Skip architecture detection when KBUILD_DEBARCH is set
      builddeb: Change architecture detection fallback to use dpkg-architecture
      builddeb: Drop check for 32-bit s390
      builddeb: Introduce functions to simplify kconfig tests in set_debarch
      builddeb: Add automatic support for ppc64 and powerpcspe architectures
      builddeb: Add automatic support for mips64el architecture
      builddeb: Add automatic support for mips{,64}r6{,el} architectures
      builddeb: Add automatic support for sparc64 architecture
      builddeb: Add automatic support for or1k architecture
      builddeb: Add automatic support for m68k architecture
      builddeb: Add automatic support for riscv* architectures
      builddeb: Add automatic support for sh{3,4}{,eb} architectures

Denis Efremov (1):
      coccicheck: return proper error code on fail

Dirk Gouders (1):
      kbuild: if_changed: document single use per target limitation

Elena Reshetova (1):
      Coccinelle: add atomic_as_refcounter script

Jeremy Cline (1):
      scripts: Add Python 3 support to tracing/draw_functrace.py

Julia Lawall (1):
      Coccinelle: doubletest: reduce side effect false positives

Laura Abbott (9):
      kbuild: Add build salt to the kernel and modules
      x86: Add build salt to the vDSO
      powerpc: Add build salt to the vDSO
      arm64: Add build salt to the vDSO
      kbuild: Rename HOSTCFLAGS to KBUILD_HOSTCFLAGS
      kbuild: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
      kbuild: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
      kbuild: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
      kbuild: Use HOST*FLAGS options from the command line

Masahiro Yamada (12):
      kbuild: move bin2c back to scripts/ from scripts/basic/
      um: remove redundant 'export LDFLAGS' in arch/x86/Makefile.um
      kbuild: remove redundant LDFLAGS clearing in arch/*/Makefile
      kbuild: replace $(LDFLAGS) $(ldflags-y) with $(ld_flags)
      kbuild: change ld_flags to contain LDFLAGS_$(@F)
      ARM: at91: remove unused duplicated filechk_offsets
      kbuild: do not redirect the first prerequisite for filechk
      um: fix parallel building with O= option
      kbuild: add %asm-generic to no-dot-config-targets
      um: clean up archheaders recipe
      kbuild: make samples really depend on headers_install
      kbuild: remove deprecated host-progs variable

Olof Johansson (2):
      kbuild: buildtar: remove crufty vax pieces
      kbuild: buildtar: add arm64 support

Randy Dunlap (1):
      kbuild: verify that $DEPMOD is installed

 Documentation/kbuild/kbuild.txt                   |  16 +++
 Documentation/kbuild/makefiles.txt                |   8 +-
 Documentation/process/changes.rst                 |  19 ++--
 Makefile                                          |  24 +++--
 arch/alpha/boot/Makefile                          |   2 +-
 arch/arm/Makefile                                 |   3 -
 arch/arm/mach-at91/Makefile                       |  25 -----
 arch/arm64/kernel/vdso/note.S                     |   3 +
 arch/openrisc/Makefile                            |   1 -
 arch/powerpc/kernel/vdso32/note.S                 |   3 +
 arch/powerpc/purgatory/Makefile                   |   3 +-
 arch/riscv/Makefile                               |   1 -
 arch/s390/kernel/syscalls/Makefile                |   6 +-
 arch/s390/purgatory/Makefile                      |   3 +-
 arch/um/Makefile                                  |  11 +-
 arch/um/drivers/Makefile                          |   4 +-
 arch/x86/Makefile.um                              |   2 -
 arch/x86/entry/vdso/vdso-note.S                   |   3 +
 arch/x86/entry/vdso/vdso32/note.S                 |   3 +
 arch/x86/purgatory/Makefile                       |   3 +-
 arch/xtensa/boot/Makefile                         |   3 +-
 include/linux/build-salt.h                        |  20 ++++
 init/Kconfig                                      |   9 ++
 init/version.c                                    |   3 +
 kernel/Makefile                                   |   2 +-
 net/bpfilter/Makefile                             |   4 +-
 samples/bpf/Makefile                              |  22 ++--
 samples/seccomp/Makefile                          |   6 +-
 scripts/.gitignore                                |   1 +
 scripts/Kbuild.include                            |   4 +-
 scripts/Makefile                                  |   5 +-
 scripts/Makefile.build                            |   7 --
 scripts/Makefile.clean                            |   1 -
 scripts/Makefile.host                             |  24 ++---
 scripts/Makefile.lib                              |   7 +-
 scripts/basic/.gitignore                          |   1 -
 scripts/basic/Makefile                            |   1 -
 scripts/{basic => }/bin2c.c                       |   0
 scripts/coccicheck                                |   5 +-
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 129
++++++++++++++++++++++++
 scripts/coccinelle/tests/doubletest.cocci         |  34 +++++--
 scripts/depmod.sh                                 |   8 +-
 scripts/kconfig/Makefile                          |   8 +-
 scripts/mod/modpost.c                             |   3 +
 scripts/package/buildtar                          |  12 ++-
 scripts/package/mkdebian                          |  68 +++++++++----
 scripts/tracing/draw_functrace.py                 |   2 +-
 security/tomoyo/Makefile                          |   2 +-
 tools/build/Build.include                         |   2 +-
 tools/build/Makefile                              |   2 +-
 tools/objtool/Makefile                            |   4 +-
 51 files changed, 373 insertions(+), 169 deletions(-)
 create mode 100644 include/linux/build-salt.h
 rename scripts/{basic => }/bin2c.c (100%)
 create mode 100644 scripts/coccinelle/api/atomic_as_refcounter.cocci


-- 
Best Regards
Masahiro Yamada
