Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36103 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbfGTCbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 22:31:47 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 20 Jul 2019 11:31:01 +0900
Message-ID: <CAK7LNAQD7m+PCS6KtoVmZ_7kggLeWD6LE6NkfZ7TeaSO26sQGA@mail.gmail.com>
Subject: [GIT PULL] More Kbuild updates for v5.3-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some more Kbuild updates.
Thanks!


The following changes since commit 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd:

  Merge tag 'for-linus-20190715' of git://git.kernel.dk/linux-block
(2019-07-15 21:20:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.3-2

for you to fetch changes up to 29be86d7f9cb18df4123f309ac7857570513e8bc:

  kbuild: add -fcf-protection=none when using retpoline flags
(2019-07-20 11:20:24 +0900)

----------------------------------------------------------------
Kbuild updates for v5.3 (2nd)

- match the directory structure of the linux-libc-dev package to that of
  Debian-based distributions

- fix incorrect include/config/auto.conf generation when Kconfig creates
  it along with the .config file

- remove misleading $(AS) from documents

- clean up precious tag files by distclean instead of mrproper

- add a new coccinelle patch for devm_platform_ioremap_resource migration

- refactor module-related scripts to read modules.order instead of
  $(MODVERDIR)/*.mod files to get the list of created modules

- remove MODVERDIR

- update list of header compile-test

- add -fcf-protection=none flag to avoid conflict with the retpoline
  flags when CONFIG_RETPOLINE=y

- misc cleanups

----------------------------------------------------------------
Cedric Hombourger (1):
      builddeb: generate multi-arch friendly linux-libc-dev package

Himanshu Jha (1):
      coccinelle: api: add devm_platform_ioremap_resource script

Masahiro Yamada (22):
      memory: ti-emif-sram: move driver-specific asm-offset.h to drivers/memory/
      riscv: drop unneeded -Wall addition
      kconfig: run olddefconfig instead of oldconfig after merging fragments
      kconfig: fix missing choice values in auto.conf
      kbuild: get rid of misleading $(AS) from documents
      kbuild: add --hash-style= and --build-id unconditionally
      kbuild: remove tag files by distclean instead of mrproper
      kbuild: remove unused hostcc-option
      kbuild: compile-test headers listed in header-test-m as well
      kbuild: do not create empty modules.order in the prepare stage
      kbuild: get rid of kernel/ prefix from in-tree modules.{order,builtin}
      kbuild: remove duplication from modules.order in sub-directories
      scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
      kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: export_report: read modules.order instead of .tmp_versions/*.mod
      kbuild: create *.mod with full directory path and remove MODVERDIR
      kbuild: remove the first line of *.mod files
      kbuild: remove 'prepare1' target
      kbuild: split out *.mod out of {single,multi}-used-m rules
      kbuild: update compile-test header list for v5.3-rc1

Seth Forshee (1):
      kbuild: add -fcf-protection=none when using retpoline flags

 .gitignore                                                  |  1 +
 Documentation/dontdiff                                      |  1 +
 Documentation/kbuild/kbuild.rst                             |  5 +--
 Documentation/kbuild/makefiles.rst                          | 12 +++---
 Makefile                                                    | 61
++++++++++++---------------
 arch/arm/vdso/Makefile                                      |  3 +-
 arch/arm64/kernel/vdso32/Makefile                           |  4 +-
 arch/riscv/Makefile                                         |  2 -
 arch/sparc/vdso/Makefile                                    |  3 +-
 arch/x86/entry/vdso/Makefile                                |  5 +--
 drivers/memory/.gitignore                                   |  1 +
 drivers/memory/Makefile                                     |  5 ++-
 drivers/memory/ti-emif-sram-pm.S                            |  2 +-
 drivers/scsi/Makefile                                       |  2 +-
 include/Kbuild                                              | 14 +++---
 lib/Kconfig.debug                                           | 12 +-----
 scripts/Kbuild.include                                      |  5 ---
 scripts/Makefile.build                                      | 42
++++++++----------
 scripts/Makefile.lib                                        |  2 +-
 scripts/Makefile.modbuiltin                                 |  2 +-
 scripts/Makefile.modinst                                    |  5 +--
 scripts/Makefile.modpost                                    | 19 +++++----
 scripts/Makefile.modsign                                    |  3 +-
 scripts/adjust_autoksyms.sh                                 | 14 +++---
 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci | 60
++++++++++++++++++++++++++
 scripts/export_report.pl                                    | 11 +++--
 scripts/kconfig/Makefile                                    |  2 +-
 scripts/kconfig/confdata.c                                  |  7 ++-
 scripts/kconfig/expr.h                                      |  1 +
 scripts/mod/sumversion.c                                    | 23 ++--------
 scripts/modules-check.sh                                    |  2 +-
 scripts/package/builddeb                                    |  5 +++
 scripts/package/mkdebian                                    |  1 +
 scripts/package/mkspec                                      |  2 +-
 tools/power/cpupower/debug/kernel/Makefile                  |  4 +-
 usr/include/Makefile                                        |  8 ----
 36 files changed, 178 insertions(+), 173 deletions(-)
 create mode 100644 drivers/memory/.gitignore
 create mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci


--
Best Regards
Masahiro Yamada
