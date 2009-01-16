Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yorgi.telenet-ops.be ([195.130.133.69]:45280 "EHLO
	yorgi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754681AbZAPM5o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2009 07:57:44 -0500
Received: from monty.telenet-ops.be (monty.telenet-ops.be [195.130.132.56])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id EB6AB68243A
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2009 13:57:42 +0100 (CET)
Date: Fri, 16 Jan 2009 13:57:11 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k,m68knommu: merge header files
In-Reply-To: <49707AE0.1040803@opengear.com>
Message-ID: <Pine.LNX.4.64.0901161354410.18756@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org>
 <20081213205251.GC27748@uranus.ravnborg.org> <20081213205828.GD27748@uranus.ravnborg.org>
 <49707AE0.1040803@opengear.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Ungerer <greg.ungerer@opengear.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, 16 Jan 2009, Greg Ungerer wrote:
> Sam Ravnborg wrote:
> > > From 5a8b9717a399679c4753e596ea864b02a1197025 Mon Sep 17 00:00:00 2001
> > From: Sam Ravnborg <sam@ravnborg.org>
> > Date: Sat, 13 Dec 2008 21:23:08 +0100
> > Subject: [PATCH] m68k,m68knommu: merge header files
> > 
> > Merge header files for m68k and m68knommu to the single location:
> > 
> >     arch/m68k/include/asm
> > 
> > The majority of this patch was the result of the
> > script that is included in the changelog below.
> > 
> > The script was originally written by Arnd Bergman and
> > exten by me to cover a few more files.
> > 
> > When the header files differed the script uses the following:
> > 
> > The original m68k file is named <file>_mm.h  [mm for memory manager]
> > The m68knommu file is named <file>_no.h [no for no memory manager]
> > 
> > The files uses the following include guard:
> > 
> > This include gaurd works as the m68knommu toolchain set
> > the __uClinux__ symbol - so this should work in userspace too.
> > 
> > Merging the header files for m68k and m68knommu exposes the
> > (unexpected?) ABI differences thus it is easier to actually
> > identify these and thus to fix them.
> > 
> > The commit has been build tested with both a m68k and
> > a m68knommu toolchain - with success.
> > 
> > The commit has also been tested with "make headers_check"
> > and this patch fixes make headers_check for m68knommu.
> > 
> > The script used:
> > TARGET=arch/m68k/include/asm
> > SOURCE=arch/m68knommu/include/asm
> > 
> > INCLUDE="cachectl.h errno.h fcntl.h hwtest.h ioctls.h ipcbuf.h \
> > linkage.h math-emu.h md.h mman.h movs.h msgbuf.h openprom.h \
> > oplib.h poll.h posix_types.h resource.h rtc.h sembuf.h shmbuf.h \
> > shm.h shmparam.h socket.h sockios.h spinlock.h statfs.h stat.h \
> > termbits.h termios.h tlb.h types.h user.h"
> > 
> > EQUAL="auxvec.h cputime.h device.h emergency-restart.h futex.h \
> > ioctl.h irq_regs.h kdebug.h local.h mutex.h percpu.h \
> > sections.h topology.h"
> > 
> > NOMUUFILES="anchor.h bootstd.h coldfire.h commproc.h dbg.h \
> > elia.h flat.h m5206sim.h m520xsim.h m523xsim.h m5249sim.h \
> > m5272sim.h m527xsim.h m528xsim.h m5307sim.h m532xsim.h \
> > m5407sim.h m68360_enet.h m68360.h m68360_pram.h m68360_quicc.h \
> > m68360_regs.h MC68328.h MC68332.h MC68EZ328.h MC68VZ328.h \
> > mcfcache.h mcfdma.h mcfmbus.h mcfne.h mcfpci.h mcfpit.h \
> > mcfsim.h mcfsmc.h mcftimer.h mcfuart.h mcfwdebug.h \
> > nettel.h quicc_simple.h smp.h"
> > 
> > FILES="atomic.h bitops.h bootinfo.h bug.h bugs.h byteorder.h cache.h \
> > cacheflush.h checksum.h current.h delay.h div64.h \
> > dma-mapping.h dma.h elf.h entry.h fb.h fpu.h hardirq.h hw_irq.h io.h \
> > irq.h kmap_types.h machdep.h mc146818rtc.h mmu.h mmu_context.h \
> > module.h page.h page_offset.h param.h pci.h pgalloc.h \
> > pgtable.h processor.h ptrace.h scatterlist.h segment.h \
> > setup.h sigcontext.h siginfo.h signal.h string.h system.h \
> > thread_info.h timex.h tlbflush.h traps.h uaccess.h ucontext.h \
> > unaligned.h unistd.h"
> > 
> > mergefile() {
> > 	BASE=${1%.h}
> > 	git mv ${SOURCE}/$1 ${TARGET}/${BASE}_no.h
> > 	git mv ${TARGET}/$1 ${TARGET}/${BASE}_mm.h
> > 
> > cat << EOF > ${TARGET}/$1
> > EOF
> > 
> > 	git add ${TARGET}/$1
> > }
> > 
> > set -e
> > 
> > mkdir -p ${TARGET}
> > 
> > git mv include/asm-m68k/* ${TARGET}
> > rmdir include/asm-m68k
> > 
> > git rm ${SOURCE}/Kbuild
> > for F in $INCLUDE $EQUAL; do
> > 	git rm ${SOURCE}/$F
> > done
> > 
> > for F in $NOMUUFILES; do
> > 	git mv ${SOURCE}/$F ${TARGET}/$F
> > done
> > 
> > for F in $FILES ; do
> > 	mergefile $F
> > done
> > 
> > rmdir arch/m68knommu/include/asm
> > rmdir arch/m68knommu/include
> > 
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Greg Ungerer <gerg@uclinux.org>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> So I took this, applied, and have been running some tests
> on m68knommu.
> 
> I had to make 2 small changes to make it work on 2.6.29-rc1.
> I had to add swab.h into the list of FILES, and move the seting
> of hdr-arch for m68knommu in the top level Makefile to after the
> global hdr-arch setting (so all of about 3 lines later).
> 
> Otherwise it builds and runs fine for m68knommu in all
> cases I have tested so far.

Thanks!

> I have this applied as the only change at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> m68k-merge-includes

Huh, is this git repository really ca. 200 MiB?

> Sam Ravnborg (1):
>       m68k,m68knommu: merge header files
> 
> 
> More review, testing, comments welcome...
> Where to from here?

I'll pull from it and give it some m68k test builds.
After that, you can move it to for-next. If everything's well, it can go to
Linus.

Or should I amend and add my SoB and put it in m68k for-next?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
