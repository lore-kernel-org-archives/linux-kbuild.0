Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.188]:38143 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753435AbZCRRIl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2009 13:08:41 -0400
Received: by nf-out-0910.google.com with SMTP id d21so28589nfb.21
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2009 10:08:38 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 0/2] New generic headers implementation
Date: Wed, 18 Mar 2009 18:08:33 +0100
Message-Id: <1237396115-28674-1-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <20090312153150.GA11875@uranus.ravnborg.org>
References: <20090312153150.GA11875@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>

Generic headers allow ARCH maintainers to remove all dummy
arch/ARCH/include/asm/XXX.h files or, depending on the architecture, 
include/asm-ARCH/XXX.h (e.g. arch/x86/include/asm/errno.h) that only 
include the _name equivalent_ include/asm-generic/XXX.h file 
(e.g. include/asm-generic/errno.h) with _no_ changes. It was called 
generic headers for short. Arnd Bergmann gave the original idea and 
asked me to implement it. This is the second implementation with the 
changes proposed by Sam Ravnborg.

To use it just one step is necessary:

 - Remove all the dummy arch/ARCH/include/asm/XXX.h files 
   (e.g. rm arch/x86/include/asm/errno.h)

The scripts/Makefile.headersinst was adapted to avoid errors (due to 
the removal of header files from their default locations) so it would 
pass the 'make headers_check'.

The generic headers were applyed and tested in x86 (tested in my 
Notebook with i386_defconfig on kernel 2.6.29-rc8 of 17/Mar/2009 from 
Linus git tree). It compiled and booted without problems.

This approach does not reduce much LOC but, in a rough estimation, it 
would allow the removal of around 90 dummy header files among all 
architectures.

Remis Lima Baima (2):
  Create the infrastructure for generic headers
  Apply generic headers for x86

 Makefile                                     |    1 +
 arch/x86/include/asm/cputime.h               |    1 -
 arch/x86/include/asm/errno.h                 |    1 -
 arch/x86/include/asm/fcntl.h                 |    1 -
 arch/x86/include/asm/ioctl.h                 |    1 -
 arch/x86/include/asm/poll.h                  |    1 -
 arch/x86/include/asm/resource.h              |    1 -
 arch/x86/include/asm/rtc.h                   |    1 -
 arch/x86/include/asm/sections.h              |    1 -
 include/asm-generic/4level-fixup.h           |   38 +--
 include/asm-generic/atomic.h                 |  259 +---------
 include/asm-generic/audit_change_attr.h      |   23 +-
 include/asm-generic/audit_dir_write.h        |   19 +-
 include/asm-generic/audit_read.h             |    9 +-
 include/asm-generic/audit_signal.h           |    4 +-
 include/asm-generic/audit_write.h            |   14 +-
 include/asm-generic/bitops.h                 |   34 +--
 include/asm-generic/bitops/__ffs.h           |   44 +--
 include/asm-generic/bitops/__fls.h           |   44 +--
 include/asm-generic/bitops/atomic.h          |  189 +-------
 include/asm-generic/bitops/ext2-atomic.h     |   23 +-
 include/asm-generic/bitops/ext2-non-atomic.h |   21 +-
 include/asm-generic/bitops/ffs.h             |   42 +--
 include/asm-generic/bitops/ffz.h             |   13 +-
 include/asm-generic/bitops/find.h            |   16 +-
 include/asm-generic/bitops/fls.h             |   42 +--
 include/asm-generic/bitops/fls64.h           |   37 +--
 include/asm-generic/bitops/hweight.h         |   12 +-
 include/asm-generic/bitops/le.h              |   58 +--
 include/asm-generic/bitops/lock.h            |   46 +--
 include/asm-generic/bitops/minix-le.h        |   18 +-
 include/asm-generic/bitops/minix.h           |   16 +-
 include/asm-generic/bitops/non-atomic.h      |  109 +----
 include/asm-generic/bitops/sched.h           |   32 +--
 include/asm-generic/bug.h                    |  144 +-----
 include/asm-generic/cmpxchg-local.h          |   66 +---
 include/asm-generic/cmpxchg.h                |   23 +-
 include/asm-generic/cputime.h                |   70 +---
 include/asm-generic/device.h                 |   13 +-
 include/asm-generic/div64.h                  |   59 +--
 include/asm-generic/dma-coherent.h           |   33 +--
 include/asm-generic/dma-mapping-broken.h     |   83 +---
 include/asm-generic/dma-mapping.h            |  309 +-----------
 include/asm-generic/emergency-restart.h      |   10 +-
 include/asm-generic/errno-base.h             |   40 +--
 include/asm-generic/errno.h                  |  110 +----
 include/asm-generic/fcntl.h                  |  152 +------
 include/asm-generic/futex.h                  |   57 +--
 include/asm-generic/gpio.h                   |  189 +-------
 include/asm-generic/ide_iops.h               |   39 +--
 include/asm-generic/int-l64.h                |   72 +---
 include/asm-generic/int-ll64.h               |   77 +---
 include/asm-generic/ioctl.h                  |  106 +----
 include/asm-generic/iomap.h                  |   73 +---
 include/asm-generic/irq_regs.h               |   38 +--
 include/asm-generic/kdebug.h                 |   10 +-
 include/asm-generic/libata-portmap.h         |    8 +-
 include/asm-generic/local.h                  |   75 +---
 include/asm-generic/memory_model.h           |   78 +---
 include/asm-generic/mm_hooks.h               |   19 +-
 include/asm-generic/mman.h                   |   42 +--
 include/asm-generic/mutex-dec.h              |   91 +----
 include/asm-generic/mutex-null.h             |   20 +-
 include/asm-generic/mutex-xchg.h             |  112 +----
 include/asm-generic/page.h                   |   25 +-
 include/asm-generic/pci-dma-compat.h         |  108 +----
 include/asm-generic/pci.h                    |   56 +--
 include/asm-generic/percpu.h                 |   84 +---
 include/asm-generic/pgtable-nopmd.h          |   70 +---
 include/asm-generic/pgtable-nopud.h          |   62 +---
 include/asm-generic/pgtable.h                |  345 +------------
 include/asm-generic/poll.h                   |   38 +--
 include/asm-generic/resource.h               |   95 +----
 include/asm-generic/rtc.h                    |  219 +--------
 include/asm-generic/sections.h               |   24 +-
 include/asm-generic/siginfo.h                |  297 +-----------
 include/asm-generic/signal.h                 |   29 +-
 include/asm-generic/statfs.h                 |   83 +---
 include/asm-generic/syscall.h                |  142 +-----
 include/asm-generic/termios.h                |   78 +---
 include/asm-generic/tlb.h                    |  149 +------
 include/asm-generic/topology.h               |   83 +---
 include/asm-generic/uaccess.h                |   27 +-
 include/asm-generic/vmlinux.lds.h            |  442 +----------------
 include/asm-generic/xor.h                    |  719 +-------------------------
 include/generic/asm/4level-fixup.h           |   37 ++
 include/generic/asm/atomic.h                 |  258 +++++++++
 include/generic/asm/audit_change_attr.h      |   22 +
 include/generic/asm/audit_dir_write.h        |   18 +
 include/generic/asm/audit_read.h             |    8 +
 include/generic/asm/audit_signal.h           |    3 +
 include/generic/asm/audit_write.h            |   13 +
 include/generic/asm/bitops.h                 |   33 ++
 include/generic/asm/bitops/__ffs.h           |   43 ++
 include/generic/asm/bitops/__fls.h           |   43 ++
 include/generic/asm/bitops/atomic.h          |  188 +++++++
 include/generic/asm/bitops/ext2-atomic.h     |   22 +
 include/generic/asm/bitops/ext2-non-atomic.h |   20 +
 include/generic/asm/bitops/ffs.h             |   41 ++
 include/generic/asm/bitops/ffz.h             |   12 +
 include/generic/asm/bitops/find.h            |   15 +
 include/generic/asm/bitops/fls.h             |   41 ++
 include/generic/asm/bitops/fls64.h           |   36 ++
 include/generic/asm/bitops/hweight.h         |   11 +
 include/generic/asm/bitops/le.h              |   57 ++
 include/generic/asm/bitops/lock.h            |   45 ++
 include/generic/asm/bitops/minix-le.h        |   17 +
 include/generic/asm/bitops/minix.h           |   15 +
 include/generic/asm/bitops/non-atomic.h      |  108 ++++
 include/generic/asm/bitops/sched.h           |   31 ++
 include/generic/asm/bug.h                    |  143 +++++
 include/generic/asm/cmpxchg-local.h          |   65 +++
 include/generic/asm/cmpxchg.h                |   22 +
 include/generic/asm/cputime.h                |   69 +++
 include/generic/asm/device.h                 |   12 +
 include/generic/asm/div64.h                  |   58 ++
 include/generic/asm/dma-coherent.h           |   32 ++
 include/generic/asm/dma-mapping-broken.h     |   82 +++
 include/generic/asm/dma-mapping.h            |  308 +++++++++++
 include/generic/asm/emergency-restart.h      |    9 +
 include/generic/asm/errno-base.h             |   39 ++
 include/generic/asm/errno.h                  |  109 ++++
 include/generic/asm/fcntl.h                  |  151 ++++++
 include/generic/asm/futex.h                  |   56 ++
 include/generic/asm/gpio.h                   |  188 +++++++
 include/generic/asm/ide_iops.h               |   38 ++
 include/generic/asm/int-l64.h                |   71 +++
 include/generic/asm/int-ll64.h               |   76 +++
 include/generic/asm/ioctl.h                  |  105 ++++
 include/generic/asm/iomap.h                  |   72 +++
 include/generic/asm/irq_regs.h               |   37 ++
 include/generic/asm/kdebug.h                 |    9 +
 include/generic/asm/libata-portmap.h         |    7 +
 include/generic/asm/local.h                  |   74 +++
 include/generic/asm/memory_model.h           |   77 +++
 include/generic/asm/mm_hooks.h               |   18 +
 include/generic/asm/mman.h                   |   41 ++
 include/generic/asm/mutex-dec.h              |   90 ++++
 include/generic/asm/mutex-null.h             |   19 +
 include/generic/asm/mutex-xchg.h             |  111 ++++
 include/generic/asm/page.h                   |   24 +
 include/generic/asm/pci-dma-compat.h         |  107 ++++
 include/generic/asm/pci.h                    |   55 ++
 include/generic/asm/percpu.h                 |   83 +++
 include/generic/asm/pgtable-nopmd.h          |   69 +++
 include/generic/asm/pgtable-nopud.h          |   61 +++
 include/generic/asm/pgtable.h                |  344 ++++++++++++
 include/generic/asm/poll.h                   |   37 ++
 include/generic/asm/resource.h               |   94 ++++
 include/generic/asm/rtc.h                    |  218 ++++++++
 include/generic/asm/sections.h               |   23 +
 include/generic/asm/siginfo.h                |  296 +++++++++++
 include/generic/asm/signal.h                 |   28 +
 include/generic/asm/statfs.h                 |   82 +++
 include/generic/asm/syscall.h                |  141 +++++
 include/generic/asm/termios.h                |   77 +++
 include/generic/asm/tlb.h                    |  148 ++++++
 include/generic/asm/topology.h               |   82 +++
 include/generic/asm/uaccess.h                |   26 +
 include/generic/asm/vmlinux.lds.h            |  441 ++++++++++++++++
 include/generic/asm/xor.h                    |  718 +++++++++++++++++++++++++
 scripts/Makefile.headersinst                 |    9 +
 162 files changed, 6565 insertions(+), 6487 deletions(-)
 delete mode 100644 arch/x86/include/asm/cputime.h
 delete mode 100644 arch/x86/include/asm/errno.h
 delete mode 100644 arch/x86/include/asm/fcntl.h
 delete mode 100644 arch/x86/include/asm/ioctl.h
 delete mode 100644 arch/x86/include/asm/poll.h
 delete mode 100644 arch/x86/include/asm/resource.h
 delete mode 100644 arch/x86/include/asm/rtc.h
 delete mode 100644 arch/x86/include/asm/sections.h
 create mode 100644 include/generic/asm/4level-fixup.h
 create mode 100644 include/generic/asm/atomic.h
 create mode 100644 include/generic/asm/audit_change_attr.h
 create mode 100644 include/generic/asm/audit_dir_write.h
 create mode 100644 include/generic/asm/audit_read.h
 create mode 100644 include/generic/asm/audit_signal.h
 create mode 100644 include/generic/asm/audit_write.h
 create mode 100644 include/generic/asm/bitops.h
 create mode 100644 include/generic/asm/bitops/__ffs.h
 create mode 100644 include/generic/asm/bitops/__fls.h
 create mode 100644 include/generic/asm/bitops/atomic.h
 create mode 100644 include/generic/asm/bitops/ext2-atomic.h
 create mode 100644 include/generic/asm/bitops/ext2-non-atomic.h
 create mode 100644 include/generic/asm/bitops/ffs.h
 create mode 100644 include/generic/asm/bitops/ffz.h
 create mode 100644 include/generic/asm/bitops/find.h
 create mode 100644 include/generic/asm/bitops/fls.h
 create mode 100644 include/generic/asm/bitops/fls64.h
 create mode 100644 include/generic/asm/bitops/hweight.h
 create mode 100644 include/generic/asm/bitops/le.h
 create mode 100644 include/generic/asm/bitops/lock.h
 create mode 100644 include/generic/asm/bitops/minix-le.h
 create mode 100644 include/generic/asm/bitops/minix.h
 create mode 100644 include/generic/asm/bitops/non-atomic.h
 create mode 100644 include/generic/asm/bitops/sched.h
 create mode 100644 include/generic/asm/bug.h
 create mode 100644 include/generic/asm/cmpxchg-local.h
 create mode 100644 include/generic/asm/cmpxchg.h
 create mode 100644 include/generic/asm/cputime.h
 create mode 100644 include/generic/asm/device.h
 create mode 100644 include/generic/asm/div64.h
 create mode 100644 include/generic/asm/dma-coherent.h
 create mode 100644 include/generic/asm/dma-mapping-broken.h
 create mode 100644 include/generic/asm/dma-mapping.h
 create mode 100644 include/generic/asm/emergency-restart.h
 create mode 100644 include/generic/asm/errno-base.h
 create mode 100644 include/generic/asm/errno.h
 create mode 100644 include/generic/asm/fcntl.h
 create mode 100644 include/generic/asm/futex.h
 create mode 100644 include/generic/asm/gpio.h
 create mode 100644 include/generic/asm/ide_iops.h
 create mode 100644 include/generic/asm/int-l64.h
 create mode 100644 include/generic/asm/int-ll64.h
 create mode 100644 include/generic/asm/ioctl.h
 create mode 100644 include/generic/asm/iomap.h
 create mode 100644 include/generic/asm/irq_regs.h
 create mode 100644 include/generic/asm/kdebug.h
 create mode 100644 include/generic/asm/libata-portmap.h
 create mode 100644 include/generic/asm/local.h
 create mode 100644 include/generic/asm/memory_model.h
 create mode 100644 include/generic/asm/mm_hooks.h
 create mode 100644 include/generic/asm/mman.h
 create mode 100644 include/generic/asm/mutex-dec.h
 create mode 100644 include/generic/asm/mutex-null.h
 create mode 100644 include/generic/asm/mutex-xchg.h
 create mode 100644 include/generic/asm/page.h
 create mode 100644 include/generic/asm/pci-dma-compat.h
 create mode 100644 include/generic/asm/pci.h
 create mode 100644 include/generic/asm/percpu.h
 create mode 100644 include/generic/asm/pgtable-nopmd.h
 create mode 100644 include/generic/asm/pgtable-nopud.h
 create mode 100644 include/generic/asm/pgtable.h
 create mode 100644 include/generic/asm/poll.h
 create mode 100644 include/generic/asm/resource.h
 create mode 100644 include/generic/asm/rtc.h
 create mode 100644 include/generic/asm/sections.h
 create mode 100644 include/generic/asm/siginfo.h
 create mode 100644 include/generic/asm/signal.h
 create mode 100644 include/generic/asm/statfs.h
 create mode 100644 include/generic/asm/syscall.h
 create mode 100644 include/generic/asm/termios.h
 create mode 100644 include/generic/asm/tlb.h
 create mode 100644 include/generic/asm/topology.h
 create mode 100644 include/generic/asm/uaccess.h
 create mode 100644 include/generic/asm/vmlinux.lds.h
 create mode 100644 include/generic/asm/xor.h

