Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50604 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751997AbcJNUMu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Oct 2016 16:12:50 -0400
Date: Fri, 14 Oct 2016 22:12:46 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild changes for v4.9-rc1
Message-ID: <20161014201246.GA28782@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: adobriyan@gmail.com, mmarek@suse.com, npiggin@gmail.com, sfr@canb.auug.org.au, viro@zeniv.linux.org.uk, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild changes for v4.9-rc1:

- EXPORT_SYMBOL for asm source by Al Viro. This does bring a regression,
  because genksyms no longer generates checksums for these symbols
  (CONFIG_MODVERSIONS). Nick Piggin is working on a patch to fix this.
  Plus, we are talking about functions like strcpy(), which rarely
  change prototypes.
- Fixes for PPC fallout of the above by Stephen Rothwell and Nick Piggin
- fixdep speedup by Alexey Dobriyan.
- Preparatory work by Nick Piggin to allow architectures to build with
  -ffunction-sections, -fdata-sections and --gc-sections
- CONFIG_THIN_ARCHIVES support by Stephen Rothwell
- Fix for filenames with colons in the initramfs source by me.


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 590abbdd273304b55824bcb9ea91840ea375575d:

  initramfs: Escape colons in depfile (2016-09-23 10:35:32 +0200)

----------------------------------------------------------------
Al Viro (12):
      [kbuild] handle exports in lib-y objects reliably
      EXPORT_SYMBOL() for asm
      x86: move exports to actual definitions
      alpha: move exports to actual definitions
      m68k: move exports to definitions
      s390: move exports to definitions
      arm: move exports to definitions
      ppc: move exports to definitions
      sparc: move exports to definitions
      [sparc] unify 32bit and 64bit string.h
      sparc32: debride memcpy.S a bit
      ia64: move exports to definitions

Alexey Dobriyan (1):
      fixdep: faster CONFIG_ search

Michal Marek (2):
      kbuild: Regenerate genksyms lexer
      initramfs: Escape colons in depfile

Nicholas Piggin (5):
      kbuild: genksyms fix for typeof handling
      kbuild: allow archs to select link dead code/data elimination
      kbuild: add arch specific post-link Makefile
      kbuild: -ffunction-sections fix for archs with conflicting sections
      powerpc/64: whitelist unresolved modversions CRCs

Stephen Rothwell (2):
      kbuild: allow architectures to use thin archives instead of ld -r
      ppc: there is no clear_pages to export

 Documentation/kbuild/makefiles.txt    |  16 +++
 Makefile                              |  19 +++-
 arch/Kconfig                          |  21 ++++
 arch/alpha/include/asm/Kbuild         |   1 +
 arch/alpha/kernel/Makefile            |   2 +-
 arch/alpha/kernel/alpha_ksyms.c       | 102 -------------------
 arch/alpha/kernel/machvec_impl.h      |   6 +-
 arch/alpha/kernel/setup.c             |   1 +
 arch/alpha/lib/callback_srm.S         |   5 +
 arch/alpha/lib/checksum.c             |   3 +
 arch/alpha/lib/clear_page.S           |   3 +-
 arch/alpha/lib/clear_user.S           |   2 +
 arch/alpha/lib/copy_page.S            |   3 +-
 arch/alpha/lib/copy_user.S            |   3 +
 arch/alpha/lib/csum_ipv6_magic.S      |   2 +
 arch/alpha/lib/csum_partial_copy.c    |   2 +
 arch/alpha/lib/dec_and_lock.c         |   2 +
 arch/alpha/lib/divide.S               |   3 +
 arch/alpha/lib/ev6-clear_page.S       |   3 +-
 arch/alpha/lib/ev6-clear_user.S       |   3 +-
 arch/alpha/lib/ev6-copy_page.S        |   3 +-
 arch/alpha/lib/ev6-copy_user.S        |   3 +-
 arch/alpha/lib/ev6-csum_ipv6_magic.S  |   2 +
 arch/alpha/lib/ev6-divide.S           |   3 +
 arch/alpha/lib/ev6-memchr.S           |   3 +-
 arch/alpha/lib/ev6-memcpy.S           |   3 +-
 arch/alpha/lib/ev6-memset.S           |   7 +-
 arch/alpha/lib/ev67-strcat.S          |   3 +-
 arch/alpha/lib/ev67-strchr.S          |   3 +-
 arch/alpha/lib/ev67-strlen.S          |   3 +-
 arch/alpha/lib/ev67-strncat.S         |   3 +-
 arch/alpha/lib/ev67-strrchr.S         |   3 +-
 arch/alpha/lib/fpreg.c                |   7 ++
 arch/alpha/lib/memchr.S               |   3 +-
 arch/alpha/lib/memcpy.c               |   5 +-
 arch/alpha/lib/memmove.S              |   3 +-
 arch/alpha/lib/memset.S               |   7 +-
 arch/alpha/lib/strcat.S               |   2 +
 arch/alpha/lib/strchr.S               |   3 +-
 arch/alpha/lib/strcpy.S               |   3 +-
 arch/alpha/lib/strlen.S               |   3 +-
 arch/alpha/lib/strncat.S              |   3 +-
 arch/alpha/lib/strncpy.S              |   3 +-
 arch/alpha/lib/strrchr.S              |   3 +-
 arch/arm/include/asm/Kbuild           |   1 +
 arch/arm/kernel/Makefile              |   2 +-
 arch/arm/kernel/armksyms.c            | 183 ----------------------------------
 arch/arm/kernel/entry-ftrace.S        |   3 +
 arch/arm/kernel/head.S                |   3 +
 arch/arm/kernel/smccc-call.S          |   3 +
 arch/arm/lib/ashldi3.S                |   3 +
 arch/arm/lib/ashrdi3.S                |   3 +
 arch/arm/lib/bitops.h                 |   5 +
 arch/arm/lib/bswapsdi2.S              |   3 +
 arch/arm/lib/clear_user.S             |   4 +
 arch/arm/lib/copy_from_user.S         |   2 +
 arch/arm/lib/copy_page.S              |   2 +
 arch/arm/lib/copy_to_user.S           |   4 +
 arch/arm/lib/csumipv6.S               |   3 +-
 arch/arm/lib/csumpartial.S            |   2 +
 arch/arm/lib/csumpartialcopy.S        |   1 +
 arch/arm/lib/csumpartialcopygeneric.S |   2 +
 arch/arm/lib/csumpartialcopyuser.S    |   1 +
 arch/arm/lib/delay.c                  |   2 +
 arch/arm/lib/div64.S                  |   2 +
 arch/arm/lib/findbit.S                |   9 ++
 arch/arm/lib/getuser.S                |   9 ++
 arch/arm/lib/io-readsb.S              |   2 +
 arch/arm/lib/io-readsl.S              |   2 +
 arch/arm/lib/io-readsw-armv3.S        |   3 +-
 arch/arm/lib/io-readsw-armv4.S        |   2 +
 arch/arm/lib/io-writesb.S             |   2 +
 arch/arm/lib/io-writesl.S             |   2 +
 arch/arm/lib/io-writesw-armv3.S       |   2 +
 arch/arm/lib/io-writesw-armv4.S       |   2 +
 arch/arm/lib/lib1funcs.S              |   9 ++
 arch/arm/lib/lshrdi3.S                |   3 +
 arch/arm/lib/memchr.S                 |   2 +
 arch/arm/lib/memcpy.S                 |   3 +
 arch/arm/lib/memmove.S                |   2 +
 arch/arm/lib/memset.S                 |   3 +
 arch/arm/lib/memzero.S                |   2 +
 arch/arm/lib/muldi3.S                 |   3 +
 arch/arm/lib/putuser.S                |   5 +
 arch/arm/lib/strchr.S                 |   2 +
 arch/arm/lib/strrchr.S                |   2 +
 arch/arm/lib/uaccess_with_memcpy.c    |   3 +
 arch/arm/lib/ucmpdi2.S                |   3 +
 arch/arm/mach-imx/Makefile            |   1 -
 arch/arm/mach-imx/ssi-fiq-ksym.c      |  20 ----
 arch/arm/mach-imx/ssi-fiq.S           |   7 +-
 arch/ia64/hp/sim/boot/Makefile        |   2 +-
 arch/ia64/include/asm/export.h        |   3 +
 arch/ia64/kernel/entry.S              |   3 +
 arch/ia64/kernel/esi_stub.S           |   2 +
 arch/ia64/kernel/head.S               |   2 +
 arch/ia64/kernel/ia64_ksyms.c         |  94 +----------------
 arch/ia64/kernel/ivt.S                |   2 +
 arch/ia64/kernel/pal.S                |   7 ++
 arch/ia64/kernel/setup.c              |   4 +
 arch/ia64/lib/Makefile                |   8 +-
 arch/ia64/lib/clear_page.S            |   2 +
 arch/ia64/lib/clear_user.S            |   2 +
 arch/ia64/lib/copy_page.S             |   2 +
 arch/ia64/lib/copy_page_mck.S         |   2 +
 arch/ia64/lib/copy_user.S             |   2 +
 arch/ia64/lib/flush.S                 |   2 +
 arch/ia64/lib/idiv32.S                |   2 +
 arch/ia64/lib/idiv64.S                |   2 +
 arch/ia64/lib/ip_fast_csum.S          |   3 +
 arch/ia64/lib/memcpy.S                |   2 +
 arch/ia64/lib/memcpy_mck.S            |   3 +
 arch/ia64/lib/memset.S                |   2 +
 arch/ia64/lib/strlen.S                |   2 +
 arch/ia64/lib/strlen_user.S           |   2 +
 arch/ia64/lib/strncpy_from_user.S     |   2 +
 arch/ia64/lib/strnlen_user.S          |   2 +
 arch/ia64/lib/xor.S                   |   5 +
 arch/m68k/include/asm/export.h        |   3 +
 arch/m68k/kernel/Makefile             |   2 +-
 arch/m68k/kernel/m68k_ksyms.c         |  32 ------
 arch/m68k/lib/ashldi3.c               |   4 +
 arch/m68k/lib/ashrdi3.c               |   4 +
 arch/m68k/lib/divsi3.S                |   3 +
 arch/m68k/lib/lshrdi3.c               |   4 +
 arch/m68k/lib/modsi3.S                |   3 +
 arch/m68k/lib/muldi3.c                |   4 +
 arch/m68k/lib/mulsi3.S                |   4 +-
 arch/m68k/lib/udivsi3.S               |   4 +-
 arch/m68k/lib/umodsi3.S               |   4 +-
 arch/powerpc/include/asm/Kbuild       |   1 +
 arch/powerpc/kernel/Makefile          |   4 -
 arch/powerpc/kernel/entry_32.S        |   2 +
 arch/powerpc/kernel/entry_64.S        |   3 +
 arch/powerpc/kernel/epapr_hcalls.S    |   2 +
 arch/powerpc/kernel/fpu.S             |   3 +
 arch/powerpc/kernel/head_32.S         |   5 +
 arch/powerpc/kernel/head_40x.S        |   2 +
 arch/powerpc/kernel/head_44x.S        |   2 +
 arch/powerpc/kernel/head_64.S         |   2 +
 arch/powerpc/kernel/head_8xx.S        |   2 +
 arch/powerpc/kernel/head_fsl_booke.S  |   2 +
 arch/powerpc/kernel/misc.S            |   2 +
 arch/powerpc/kernel/misc_32.S         |  10 ++
 arch/powerpc/kernel/misc_64.S         |   4 +
 arch/powerpc/kernel/pci-common.c      |   1 +
 arch/powerpc/kernel/pci_32.c          |   2 +
 arch/powerpc/kernel/ppc_ksyms.c       |  37 -------
 arch/powerpc/kernel/ppc_ksyms_32.c    |  60 -----------
 arch/powerpc/kernel/setup_32.c        |   6 ++
 arch/powerpc/kernel/time.c            |   1 +
 arch/powerpc/kernel/vector.S          |   3 +
 arch/powerpc/lib/Makefile             |   2 +-
 arch/powerpc/lib/checksum_32.S        |   3 +
 arch/powerpc/lib/checksum_64.S        |   3 +
 arch/powerpc/lib/copy_32.S            |   5 +
 arch/powerpc/lib/copypage_64.S        |   2 +
 arch/powerpc/lib/copyuser_64.S        |   2 +
 arch/powerpc/lib/hweight_64.S         |   5 +
 arch/powerpc/lib/mem_64.S             |   3 +
 arch/powerpc/lib/memcmp_64.S          |   2 +
 arch/powerpc/lib/memcpy_64.S          |   2 +
 arch/powerpc/lib/ppc_ksyms.c          |  29 ------
 arch/powerpc/lib/string.S             |   6 ++
 arch/powerpc/lib/string_64.S          |   2 +
 arch/powerpc/mm/hash_low_32.S         |   3 +
 arch/powerpc/relocs_check.sh          |   4 +-
 arch/powerpc/sysdev/dcr-low.S         |   3 +
 arch/s390/include/asm/Kbuild          |   1 +
 arch/s390/kernel/Makefile             |   2 +-
 arch/s390/kernel/entry.S              |   6 ++
 arch/s390/kernel/mcount.S             |   3 +
 arch/s390/kernel/s390_ksyms.c         |  15 ---
 arch/s390/lib/mem.S                   |   3 +
 arch/sparc/include/asm/Kbuild         |   1 +
 arch/sparc/include/asm/string.h       |  34 +++++++
 arch/sparc/include/asm/string_32.h    |  56 -----------
 arch/sparc/include/asm/string_64.h    |  44 --------
 arch/sparc/kernel/Makefile            |   2 +-
 arch/sparc/kernel/entry.S             |   3 +
 arch/sparc/kernel/head_32.S           |   3 +
 arch/sparc/kernel/head_64.S           |   7 +-
 arch/sparc/kernel/helpers.S           |   2 +
 arch/sparc/kernel/hvcalls.S           |   5 +
 arch/sparc/kernel/sparc_ksyms.c       |  12 +++
 arch/sparc/kernel/sparc_ksyms_32.c    |  31 ------
 arch/sparc/kernel/sparc_ksyms_64.c    |  53 ----------
 arch/sparc/lib/Makefile               |   1 -
 arch/sparc/lib/U1memcpy.S             |   2 +
 arch/sparc/lib/VISsave.S              |   2 +
 arch/sparc/lib/ashldi3.S              |   2 +
 arch/sparc/lib/ashrdi3.S              |   2 +
 arch/sparc/lib/atomic_64.S            |  16 ++-
 arch/sparc/lib/bitops.S               |   7 ++
 arch/sparc/lib/blockops.S             |   3 +
 arch/sparc/lib/bzero.S                |   4 +
 arch/sparc/lib/checksum_32.S          |   3 +
 arch/sparc/lib/checksum_64.S          |   2 +
 arch/sparc/lib/clear_page.S           |   3 +
 arch/sparc/lib/copy_in_user.S         |   2 +
 arch/sparc/lib/copy_page.S            |   2 +
 arch/sparc/lib/copy_user.S            |   2 +
 arch/sparc/lib/csum_copy.S            |   3 +
 arch/sparc/lib/divdi3.S               |   2 +
 arch/sparc/lib/ffs.S                  |   3 +
 arch/sparc/lib/hweight.S              |   5 +
 arch/sparc/lib/ipcsum.S               |   2 +
 arch/sparc/lib/ksyms.c                | 174 --------------------------------
 arch/sparc/lib/locks.S                |   5 +
 arch/sparc/lib/lshrdi3.S              |   2 +
 arch/sparc/lib/mcount.S               |   2 +
 arch/sparc/lib/memcmp.S               |   2 +
 arch/sparc/lib/memcpy.S               |  86 +---------------
 arch/sparc/lib/memmove.S              |   2 +
 arch/sparc/lib/memscan_32.S           |   4 +
 arch/sparc/lib/memscan_64.S           |   4 +
 arch/sparc/lib/memset.S               |   3 +
 arch/sparc/lib/muldi3.S               |   2 +
 arch/sparc/lib/strlen.S               |   2 +
 arch/sparc/lib/strncmp_32.S           |   2 +
 arch/sparc/lib/strncmp_64.S           |   2 +
 arch/sparc/lib/xor.S                  |   9 ++
 arch/x86/entry/entry_32.S             |   2 +
 arch/x86/entry/entry_64.S             |   2 +
 arch/x86/entry/thunk_32.S             |   3 +
 arch/x86/entry/thunk_64.S             |   3 +
 arch/x86/include/asm/export.h         |   4 +
 arch/x86/kernel/Makefile              |   4 +-
 arch/x86/kernel/head_32.S             |   2 +
 arch/x86/kernel/head_64.S             |   3 +
 arch/x86/kernel/i386_ksyms_32.c       |  47 ---------
 arch/x86/kernel/mcount_64.S           |   2 +
 arch/x86/kernel/x8664_ksyms_64.c      |  85 ----------------
 arch/x86/lib/checksum_32.S            |   3 +
 arch/x86/lib/clear_page_64.S          |   2 +
 arch/x86/lib/cmpxchg8b_emu.S          |   2 +
 arch/x86/lib/copy_page_64.S           |   2 +
 arch/x86/lib/copy_user_64.S           |   8 ++
 arch/x86/lib/csum-partial_64.c        |   1 +
 arch/x86/lib/getuser.S                |   5 +
 arch/x86/lib/hweight.S                |   3 +
 arch/x86/lib/memcpy_64.S              |   4 +
 arch/x86/lib/memmove_64.S             |   3 +
 arch/x86/lib/memset_64.S              |   3 +
 arch/x86/lib/putuser.S                |   5 +
 arch/x86/lib/strstr_32.c              |   3 +-
 arch/x86/um/Makefile                  |   2 +-
 arch/x86/um/checksum_32.S             |   2 +
 arch/x86/um/ksyms.c                   |  13 ---
 include/asm-generic/export.h          |  94 +++++++++++++++++
 include/asm-generic/vmlinux.lds.h     |  57 ++++++-----
 include/linux/compiler.h              |  23 +++++
 include/linux/export.h                |  30 +++---
 include/linux/init.h                  |  38 +++----
 init/Makefile                         |   2 +
 scripts/Makefile.build                |  43 +++++++-
 scripts/Makefile.modpost              |  14 ++-
 scripts/basic/fixdep.c                |  86 ++++++----------
 scripts/gen_initramfs_list.sh         |   5 +-
 scripts/genksyms/lex.l                |  35 ++++---
 scripts/genksyms/lex.lex.c_shipped    |  35 ++++---
 scripts/link-vmlinux.sh               |  71 +++++++++++--
 262 files changed, 1094 insertions(+), 1403 deletions(-)
 delete mode 100644 arch/alpha/kernel/alpha_ksyms.c
 delete mode 100644 arch/arm/kernel/armksyms.c
 delete mode 100644 arch/arm/mach-imx/ssi-fiq-ksym.c
 create mode 100644 arch/ia64/include/asm/export.h
 create mode 100644 arch/m68k/include/asm/export.h
 delete mode 100644 arch/m68k/kernel/m68k_ksyms.c
 delete mode 100644 arch/powerpc/kernel/ppc_ksyms.c
 delete mode 100644 arch/powerpc/kernel/ppc_ksyms_32.c
 delete mode 100644 arch/powerpc/lib/ppc_ksyms.c
 delete mode 100644 arch/s390/kernel/s390_ksyms.c
 create mode 100644 arch/sparc/kernel/sparc_ksyms.c
 delete mode 100644 arch/sparc/kernel/sparc_ksyms_32.c
 delete mode 100644 arch/sparc/kernel/sparc_ksyms_64.c
 delete mode 100644 arch/sparc/lib/ksyms.c
 create mode 100644 arch/x86/include/asm/export.h
 delete mode 100644 arch/x86/kernel/i386_ksyms_32.c
 delete mode 100644 arch/x86/kernel/x8664_ksyms_64.c
 delete mode 100644 arch/x86/um/ksyms.c
 create mode 100644 include/asm-generic/export.h
