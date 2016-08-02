Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37474 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755924AbcHBTBB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 15:01:01 -0400
Date: Tue, 2 Aug 2016 21:00:48 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild changes for v4.8-rc1
Message-ID: <20160802190048.GA10652@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arnd@arndb.de, keescook@chromium.org, re.emese@gmail.com, tautschn@amazon.co.uk, wsa@the-dreams.de, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please merge these kbuild changes for v4.8-rc1:
- GCC plugin support by Emese Revfy from grsecurity, with a fixup from
  Kees Cook. The plugins are meant to be used for static analysis of the
  kernel code. Two plugins are provided already.
- Reduction of the gcc commandline by Arnd Bergmann.
- IS_ENABLED / IS_REACHABLE macro enhancements by Masahiro Yamada
- bin2c fix by Michael Tautschnig
- setlocalversion fix by Wolfram Sang

Thanks,
Michal


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to a519167e753e6a89476115375b65a7eb6ec485b3:

  gcc-plugins: disable under COMPILE_TEST (2016-07-27 00:08:54 +0200)

----------------------------------------------------------------
Arnd Bergmann (6):
      Kbuild: don't add ../../ to include path
      Kbuild: avoid duplicate include path
      Kbuild: always prefix objtree in LINUXINCLUDE
      Kbuild: arch: look for generated headers in obtree
      Kbuild: don't add obj tree in additional includes
      kbuild: make samples depend on headers_install

Emese Revfy (4):
      Shared library support
      GCC plugin infrastructure
      Add Cyclomatic complexity GCC plugin
      Add sancov plugin

Kees Cook (2):
      kbuild: Abort build on bad stack protector flag
      gcc-plugins: disable under COMPILE_TEST

Masahiro Yamada (5):
      kconfig.h: use __is_defined() to check if MODULE is defined
      export.h: use __is_defined() to check if __KSYM_* is defined
      kconfig.h: use already defined macros for IS_REACHABLE() define
      kconfig.h: allow to use IS_{ENABLE,REACHABLE} in macro expansion
      vmlinux.lds.h: replace config_enabled() with IS_ENABLED()

Tautschnig, Michael (1):
      scripts: Fix size mismatch of kexec_purgatory_size

Wolfram Sang (1):
      kbuild: setlocalversion: print error to STDERR

 .gitignore                                         |   1 +
 Documentation/dontdiff                             |   1 +
 Documentation/gcc-plugins.txt                      |  87 +++
 MAINTAINERS                                        |   9 +
 Makefile                                           | 106 +--
 arch/Kconfig                                       |  37 +
 arch/alpha/boot/Makefile                           |   2 +-
 arch/arm/Kconfig                                   |   1 +
 arch/arm64/Kconfig                                 |   1 +
 arch/powerpc/boot/Makefile                         |   2 +-
 arch/powerpc/kvm/Makefile                          |   2 +-
 arch/s390/boot/compressed/Makefile                 |   4 +-
 arch/um/Kconfig.common                             |   1 +
 arch/um/Makefile                                   |   4 +-
 arch/x86/Kconfig                                   |   1 +
 arch/x86/Makefile                                  |   8 -
 arch/x86/boot/Makefile                             |   2 +-
 arch/x86/entry/vdso/Makefile                       |   3 +-
 arch/x86/purgatory/Makefile                        |   2 +
 arch/x86/realmode/rm/Makefile                      |   2 +-
 include/asm-generic/vmlinux.lds.h                  |   2 +-
 include/linux/export.h                             |   2 +-
 include/linux/kconfig.h                            |  31 +-
 lib/Kconfig.debug                                  |   2 +
 scripts/Kbuild.include                             |   2 +-
 scripts/Makefile                                   |   2 +-
 scripts/Makefile.build                             |   2 +-
 scripts/Makefile.clean                             |   4 +-
 scripts/Makefile.gcc-plugins                       |  43 ++
 scripts/Makefile.host                              |  55 +-
 scripts/Makefile.lib                               |   7 +-
 scripts/basic/bin2c.c                              |   3 +-
 scripts/gcc-plugin.sh                              |  51 ++
 scripts/gcc-plugins/Makefile                       |  27 +
 scripts/gcc-plugins/cyc_complexity_plugin.c        |  73 ++
 scripts/gcc-plugins/gcc-common.h                   | 830 +++++++++++++++++++++
 scripts/gcc-plugins/gcc-generate-gimple-pass.h     | 175 +++++
 scripts/gcc-plugins/gcc-generate-ipa-pass.h        | 289 +++++++
 scripts/gcc-plugins/gcc-generate-rtl-pass.h        | 175 +++++
 scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h | 175 +++++
 scripts/gcc-plugins/sancov_plugin.c                | 144 ++++
 scripts/link-vmlinux.sh                            |   2 +-
 scripts/package/builddeb                           |   1 +
 scripts/setlocalversion                            |   2 +-
 44 files changed, 2290 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/gcc-plugins.txt
 create mode 100644 scripts/Makefile.gcc-plugins
 create mode 100755 scripts/gcc-plugin.sh
 create mode 100644 scripts/gcc-plugins/Makefile
 create mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
 create mode 100644 scripts/gcc-plugins/gcc-common.h
 create mode 100644 scripts/gcc-plugins/gcc-generate-gimple-pass.h
 create mode 100644 scripts/gcc-plugins/gcc-generate-ipa-pass.h
 create mode 100644 scripts/gcc-plugins/gcc-generate-rtl-pass.h
 create mode 100644 scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h
 create mode 100644 scripts/gcc-plugins/sancov_plugin.c
