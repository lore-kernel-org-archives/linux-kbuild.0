Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:46022 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbYLHU4u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Dec 2008 15:56:50 -0500
Date: Mon, 8 Dec 2008 21:58:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Message-ID: <20081208205814.GA22697@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

[this mail is cross posted to uclinux mailing list which is subscriber only]

Following is a pseudo patch (a script + a patch) that merges
the include files for m68k and m68knommu in one place at:

    arch/m68k/include/asm

The script was written by Arnd and I added a few modifications.

The scripts does the following:

1) move all header files from include/asm-m68k to arch/m68k/include/asm
2) delete all header files in arch/m68knommu/include/asm that are equal
3) copy all unique files from arch/m68knommu/include/asm to m68k
4) merge the reminaing files using a small helper .h files.

The original m68k file is named <file>_mm.h  [mm for memory manager]
The m68knommu file is named <file>_no.h [no for no memory manager]

I have used the following include guard:

#ifdef __uClinux__
#include "atomic_no.h"
#else
#include "atomic_mm.h"
#endif

gcc -E -dM for the two compilers revealed that this was the
only symbol that differed.

With the above construct we do the "right thing" also for
headers exported to userspace.
But actually none of the headers using the above are
subject for export at the moment so we could use a
CONFIG_ symbol for the same.

The script assumes the repository is kept in git and shall be
executed in the root of the kernel source.

Originally we developed support for sharing same set of header files
between two architectures for sparc. So only a minimal patch is
needed in the top-level Makefile which is now a good thing for m68k.

I have tested the following:
- a defconfig build for m68k [partly - I lost patience]
- a allnoconfig build for m68knommu
- headers_check for m68k
- headers_check for m68knommu

To merge the header files run the script and then apply the patch.
The patch has my:
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

I looked at doing this in smaller steps but that
was not doable. And using the script it is anyway a simple
operation to do.

I hope you m68k* guys accept a two step approach where we
merge header files before source code.
Note: we just completed merge of sparc and sparc64 and it
was a painless experience to do so so do not be scared.

Note: the part touching the top-level Makefile will conflict
with some pending sparc changes. But this is trivial to fix.
Or just beat sparc and get this in first :-)

	Sam


Script:
TARGET=arch/m68k/include/asm
SOURCE=arch/m68knommu/include/asm

# files that just do a simple include of the m68k variant
INCLUDE="cachectl.h errno.h fcntl.h hwtest.h ioctls.h ipcbuf.h \
linkage.h math-emu.h md.h mman.h movs.h msgbuf.h openprom.h \
oplib.h poll.h posix_types.h resource.h rtc.h sembuf.h shmbuf.h \
shm.h shmparam.h socket.h sockios.h spinlock.h statfs.h stat.h \
termbits.h termios.h tlb.h types.h user.h"

# files are equal or only include guards differ
EQUAL="auxvec.h cputime.h device.h emergency-restart.h futex.h \
ioctl.h irq_regs.h kdebug.h local.h mutex.h percpu.h \
sections.h topology.h"

# only in nommu68k
NOMUUFILES="anchor.h bootstd.h coldfire.h commproc.h dbg.h \
elia.h flat.h m5206sim.h m520xsim.h m523xsim.h m5249sim.h \
m5272sim.h m527xsim.h m528xsim.h m5307sim.h m532xsim.h \
m5407sim.h m68360_enet.h m68360.h m68360_pram.h m68360_quicc.h \
m68360_regs.h MC68328.h MC68332.h MC68EZ328.h MC68VZ328.h \
mcfcache.h mcfdma.h mcfmbus.h mcfne.h mcfpci.h mcfpit.h \
mcfsim.h mcfsmc.h mcftimer.h mcfuart.h mcfwdebug.h \
nettel.h quicc_simple.h smp.h"

# files that differ
FILES="atomic.h bitops.h bootinfo.h bug.h bugs.h byteorder.h cache.h \
cacheflush.h checksum.h current.h delay.h div64.h \
dma-mapping.h dma.h elf.h entry.h fb.h fpu.h hardirq.h hw_irq.h io.h \
irq.h kmap_types.h machdep.h mc146818rtc.h mmu.h mmu_context.h \
module.h page.h page_offset.h param.h pci.h pgalloc.h \
pgtable.h processor.h ptrace.h scatterlist.h segment.h \
setup.h sigcontext.h siginfo.h signal.h string.h system.h \
thread_info.h timex.h tlbflush.h traps.h uaccess.h ucontext.h \
unaligned.h unistd.h"

mergefile() {
	BASE=${1%.h}
	git mv ${SOURCE}/$1 ${TARGET}/${BASE}_no.h
	git mv ${TARGET}/$1 ${TARGET}/${BASE}_mm.h

cat << EOF > ${TARGET}/$1
#ifdef __uClinux__
#include "${BASE}_no.h"
#else
#include "${BASE}_mm.h"
#endif
EOF

	git add ${TARGET}/$1
}

#catch bugs in script
set -e

mkdir -p ${TARGET}

# move all m68k header files
git mv include/asm-m68k/* ${TARGET}
rmdir include/asm-m68k

# Kbuild n m68knommu is no longer needed - the m68k variant has it all
git rm ${SOURCE}/Kbuild
# Files that are equal or just include the m68k variant can be deleted
for F in $INCLUDE $EQUAL; do
	git rm ${SOURCE}/$F
done

# Files that are unique for m68knommu can be moved
for F in $NOMUUFILES; do
	git mv ${SOURCE}/$F ${TARGET}/$F
done

# merge the incompatible files
for F in $FILES ; do
	mergefile $F
done

#directory should be empty now - remove it (and fail if not empty)
rmdir arch/m68knommu/include/asm
rmdir arch/m68knommu/include




Patch:
diff --git a/Makefile b/Makefile
index 9a49960..fa5a33d 100644
--- a/Makefile
+++ b/Makefile
@@ -211,6 +211,9 @@ ifeq ($(ARCH),sparc64)
 else
        hdr-arch  := $(SRCARCH)
 endif
+ifeq ($(ARCH),m68knommu)
+       hdr-arch  := m68k
+endif
 
 KCONFIG_CONFIG	?= .config
 
diff --git a/arch/m68k/include/asm/pci_no.h b/arch/m68k/include/asm/pci_no.h
index a13f3cc..9abbc03 100644
--- a/arch/m68k/include/asm/pci_no.h
+++ b/arch/m68k/include/asm/pci_no.h
@@ -1,7 +1,7 @@
 #ifndef M68KNOMMU_PCI_H
 #define	M68KNOMMU_PCI_H
 
-#include <asm-m68k/pci.h>
+#include <asm/pci_mm.h>
 
 #ifdef CONFIG_COMEMPCI
 /*
diff --git a/arch/m68k/include/asm/setup_no.h b/arch/m68k/include/asm/setup_no.h
index fb86bb2..45d286c 100644
--- a/arch/m68k/include/asm/setup_no.h
+++ b/arch/m68k/include/asm/setup_no.h
@@ -1,6 +1,6 @@
 #ifdef __KERNEL__
 
-#include <asm-m68k/setup.h>
+#include <asm/setup_mm.h>
 
 /* We have a bigger command line buffer. */
 #undef COMMAND_LINE_SIZE
