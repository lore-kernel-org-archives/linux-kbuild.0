Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:53667 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935419AbYEURoA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 13:44:00 -0400
Date: Wed, 21 May 2008 20:41:43 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] run all userspace headers through unifdef
Message-ID: <20080521174143.GE15355@cs181133002.pp.htv.fi>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain> <20080520000835.80f7b14a.akpm@linux-foundation.org> <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain> <20080521014337.1543ff20.akpm@linux-foundation.org> <1211360434.21380.319.camel@pmac.infradead.org> <20080521100245.GC18352@cs181133002.pp.htv.fi> <1211366874.21380.341.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1211366874.21380.341.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, sam@ravnborg.org
Cc: Andrew Morton <akpm@linux-foundation.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, May 21, 2008 at 11:47:54AM +0100, David Woodhouse wrote:
> On Wed, 2008-05-21 at 13:02 +0300, Adrian Bunk wrote:
> > > So I see no particular reason why we shouldn't drop header-y completely
> > > and just unifdef the lot.
> > 
> > Sam already ACK'ed this idea when I suggested it a few weeks ago and 
> > I'll get my ass up and cook a patch today or tomorrow.
> 
> Thanks.

Patch below.

> dwmw2

cu
Adrian


<--  snip  -->


Facts:
- installing userspace headers is nothing that is required as part of a 
  normal kernel build
- unifdef is relatively fast
- there are sometimes patches moving headers from header-y to unifdef-y 
  or the other way round

Instead of constantly seeing headers moving between header-y and 
unifdef-y this patch removes unifdef-y and runs all userspace headers 
through unifdef.

It also contains some unrelated sorting corrections in the Kbuild files 
since I used GNU sort for the semi-automatic conversion of the Kbuild 
files.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 include/asm-alpha/Kbuild              |   11 
 include/asm-arm/Kbuild                |    2 
 include/asm-cris/Kbuild               |    5 
 include/asm-frv/Kbuild                |    5 
 include/asm-generic/Kbuild            |    9 
 include/asm-generic/Kbuild.asm        |   61 +--
 include/asm-ia64/Kbuild               |    9 
 include/asm-parisc/Kbuild             |    2 
 include/asm-powerpc/Kbuild            |   59 +--
 include/asm-s390/Kbuild               |    7 
 include/asm-sh/Kbuild                 |    9 
 include/asm-sparc/Kbuild              |    7 
 include/asm-sparc64/Kbuild            |    5 
 include/asm-x86/Kbuild                |   27 -
 include/linux/Kbuild                  |  399 ++++++++++++--------------
 include/linux/byteorder/Kbuild        |    6 
 include/linux/dvb/Kbuild              |    7 
 include/linux/netfilter/Kbuild        |   17 -
 include/linux/netfilter_arp/Kbuild    |    3 
 include/linux/netfilter_bridge/Kbuild |    5 
 include/linux/netfilter_ipv4/Kbuild   |    5 
 include/linux/netfilter_ipv6/Kbuild   |    3 
 include/linux/nfsd/Kbuild             |   12 
 include/linux/sunrpc/Kbuild           |    2 
 include/sound/Kbuild                  |    9 
 include/video/Kbuild                  |    4 
 scripts/Makefile.headersinst          |   27 -
 27 files changed, 343 insertions(+), 374 deletions(-)

ae5fb1894656676fec7029934a3425ba6dc0fbe6 diff --git a/include/asm-alpha/Kbuild b/include/asm-alpha/Kbuild
index b7c8f18..e80530f 100644
--- a/include/asm-alpha/Kbuild
+++ b/include/asm-alpha/Kbuild
@@ -1,11 +1,10 @@
 include include/asm-generic/Kbuild.asm
 
+header-y += compiler.h
+header-y += console.h
+header-y += fpu.h
 header-y += gentrap.h
-header-y += regdef.h
 header-y += pal.h
+header-y += regdef.h
 header-y += reg.h
-
-unifdef-y += console.h
-unifdef-y += fpu.h
-unifdef-y += sysinfo.h
-unifdef-y += compiler.h
+header-y += sysinfo.h
diff --git a/include/asm-arm/Kbuild b/include/asm-arm/Kbuild
index 73237bd..6550db3 100644
--- a/include/asm-arm/Kbuild
+++ b/include/asm-arm/Kbuild
@@ -1,3 +1,3 @@
 include include/asm-generic/Kbuild.asm
 
-unifdef-y += hwcap.h
+header-y += hwcap.h
diff --git a/include/asm-cris/Kbuild b/include/asm-cris/Kbuild
index 1745545..43d0816 100644
--- a/include/asm-cris/Kbuild
+++ b/include/asm-cris/Kbuild
@@ -4,8 +4,7 @@ header-$(CONFIG_ETRAX_ARCH_V10) += arch-v10/
 header-$(CONFIG_ETRAX_ARCH_V32) += arch-v32/
 
 header-y += ethernet.h
+header-y += etraxgpio.h
+header-y += rs485.h
 header-y += rtc.h
 header-y += sync_serial.h
-
-unifdef-y += etraxgpio.h
-unifdef-y += rs485.h
diff --git a/include/asm-frv/Kbuild b/include/asm-frv/Kbuild
index bc3f12c..48a1195 100644
--- a/include/asm-frv/Kbuild
+++ b/include/asm-frv/Kbuild
@@ -1,6 +1,5 @@
 include include/asm-generic/Kbuild.asm
 
+header-y += ptrace.h
 header-y += registers.h
-
-unifdef-y += termios.h
-unifdef-y += ptrace.h
+header-y += termios.h
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 4c9932a..137c418 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -1,13 +1,12 @@
 header-y += errno-base.h
 header-y += errno.h
 header-y += fcntl.h
+header-y += int-l64.h
+header-y += int-ll64.h
 header-y += ioctl.h
 header-y += mman.h
 header-y += poll.h
+header-y += resource.h
+header-y += siginfo.h
 header-y += signal.h
 header-y += statfs.h
-
-unifdef-y += int-l64.h
-unifdef-y += int-ll64.h
-unifdef-y += resource.h
-unifdef-y += siginfo.h
diff --git a/include/asm-generic/Kbuild.asm b/include/asm-generic/Kbuild.asm
index 92a6d91..dfbb88b 100644
--- a/include/asm-generic/Kbuild.asm
+++ b/include/asm-generic/Kbuild.asm
@@ -1,33 +1,32 @@
-header-y  += kvm.h
-
 ifeq ($(wildcard include/asm-$(SRCARCH)/a.out.h),include/asm-$(SRCARCH)/a.out.h)
-unifdef-y += a.out.h
+header-y += a.out.h
 endif
-unifdef-y += auxvec.h
-unifdef-y += byteorder.h
-unifdef-y += errno.h
-unifdef-y += fcntl.h
-unifdef-y += ioctl.h
-unifdef-y += ioctls.h
-unifdef-y += ipcbuf.h
-unifdef-y += mman.h
-unifdef-y += msgbuf.h
-unifdef-y += param.h
-unifdef-y += poll.h
-unifdef-y += posix_types.h
-unifdef-y += ptrace.h
-unifdef-y += resource.h
-unifdef-y += sembuf.h
-unifdef-y += setup.h
-unifdef-y += shmbuf.h
-unifdef-y += sigcontext.h
-unifdef-y += siginfo.h
-unifdef-y += signal.h
-unifdef-y += socket.h
-unifdef-y += sockios.h
-unifdef-y += stat.h
-unifdef-y += statfs.h
-unifdef-y += termbits.h
-unifdef-y += termios.h
-unifdef-y += types.h
-unifdef-y += unistd.h
+header-y += auxvec.h
+header-y += byteorder.h
+header-y += errno.h
+header-y += fcntl.h
+header-y += ioctl.h
+header-y += ioctls.h
+header-y += ipcbuf.h
+header-y += kvm.h
+header-y += mman.h
+header-y += msgbuf.h
+header-y += param.h
+header-y += poll.h
+header-y += posix_types.h
+header-y += ptrace.h
+header-y += resource.h
+header-y += sembuf.h
+header-y += setup.h
+header-y += shmbuf.h
+header-y += sigcontext.h
+header-y += siginfo.h
+header-y += signal.h
+header-y += socket.h
+header-y += sockios.h
+header-y += statfs.h
+header-y += stat.h
+header-y += termbits.h
+header-y += termios.h
+header-y += types.h
+header-y += unistd.h
diff --git a/include/asm-ia64/Kbuild b/include/asm-ia64/Kbuild
index eb24a3f..f787655 100644
--- a/include/asm-ia64/Kbuild
+++ b/include/asm-ia64/Kbuild
@@ -1,16 +1,15 @@
 include include/asm-generic/Kbuild.asm
 
 header-y += break.h
-header-y += fpu.h
 header-y += fpswa.h
+header-y += fpu.h
+header-y += gcc_intrin.h
 header-y += ia64regs.h
 header-y += intel_intrin.h
 header-y += intrinsics.h
 header-y += perfmon_default_smpl.h
+header-y += perfmon.h
 header-y += ptrace_offsets.h
 header-y += rse.h
 header-y += ucontext.h
-
-unifdef-y += gcc_intrin.h
-unifdef-y += perfmon.h
-unifdef-y += ustack.h
+header-y += ustack.h
diff --git a/include/asm-parisc/Kbuild b/include/asm-parisc/Kbuild
index f88b252..19a434f 100644
--- a/include/asm-parisc/Kbuild
+++ b/include/asm-parisc/Kbuild
@@ -1,3 +1,3 @@
 include include/asm-generic/Kbuild.asm
 
-unifdef-y += pdc.h
+header-y += pdc.h
diff --git a/include/asm-powerpc/Kbuild b/include/asm-powerpc/Kbuild
index 7381916..bca8d53 100644
--- a/include/asm-powerpc/Kbuild
+++ b/include/asm-powerpc/Kbuild
@@ -1,41 +1,40 @@
 include include/asm-generic/Kbuild.asm
 
 header-y += a.out.h
+header-y += asm-compat.h
 header-y += auxvec.h
-header-y += ioctls.h
-header-y += mman.h
-header-y += sembuf.h
-header-y += siginfo.h
-header-y += stat.h
+header-y += bootx.h
+header-y += byteorder.h
+header-y += cputable.h
+header-y += elf.h
 header-y += errno.h
-header-y += ipcbuf.h
-header-y += msgbuf.h
-header-y += shmbuf.h
-header-y += socket.h
-header-y += termbits.h
 header-y += fcntl.h
-header-y += poll.h
-header-y += sockios.h
-header-y += ucontext.h
 header-y += ioctl.h
+header-y += ioctls.h
+header-y += ipcbuf.h
 header-y += linkage.h
+header-y += mman.h
+header-y += msgbuf.h
+header-y += nvram.h
+header-y += param.h
+header-y += poll.h
+header-y += posix_types.h
+header-y += ps3fb.h
+header-y += ptrace.h
 header-y += resource.h
+header-y += seccomp.h
+header-y += sembuf.h
+header-y += shmbuf.h
 header-y += sigcontext.h
+header-y += siginfo.h
+header-y += signal.h
+header-y += socket.h
+header-y += sockios.h
+header-y += spu_info.h
 header-y += statfs.h
-header-y += ps3fb.h
-
-unifdef-y += asm-compat.h
-unifdef-y += bootx.h
-unifdef-y += byteorder.h
-unifdef-y += cputable.h
-unifdef-y += elf.h
-unifdef-y += nvram.h
-unifdef-y += param.h
-unifdef-y += posix_types.h
-unifdef-y += ptrace.h
-unifdef-y += seccomp.h
-unifdef-y += signal.h
-unifdef-y += spu_info.h
-unifdef-y += termios.h
-unifdef-y += types.h
-unifdef-y += unistd.h
+header-y += stat.h
+header-y += termbits.h
+header-y += termios.h
+header-y += types.h
+header-y += ucontext.h
+header-y += unistd.h
diff --git a/include/asm-s390/Kbuild b/include/asm-s390/Kbuild
index 13c9805..9dd2316 100644
--- a/include/asm-s390/Kbuild
+++ b/include/asm-s390/Kbuild
@@ -1,13 +1,12 @@
 include include/asm-generic/Kbuild.asm
 
+header-y += cmb.h
 header-y += dasd.h
+header-y += debug.h
+header-y += kvm.h
 header-y += monwriter.h
 header-y += qeth.h
 header-y += tape390.h
 header-y += ucontext.h
 header-y += vtoc.h
 header-y += zcrypt.h
-header-y += kvm.h
-
-unifdef-y += cmb.h
-unifdef-y += debug.h
diff --git a/include/asm-sh/Kbuild b/include/asm-sh/Kbuild
index 43910cd..51e5b24 100644
--- a/include/asm-sh/Kbuild
+++ b/include/asm-sh/Kbuild
@@ -1,8 +1,7 @@
 include include/asm-generic/Kbuild.asm
 
 header-y += cpu-features.h
-
-unifdef-y += unistd_32.h
-unifdef-y += unistd_64.h
-unifdef-y += posix_types_32.h
-unifdef-y += posix_types_64.h
+header-y += posix_types_32.h
+header-y += posix_types_64.h
+header-y += unistd_32.h
+header-y += unistd_64.h
diff --git a/include/asm-sparc/Kbuild b/include/asm-sparc/Kbuild
index 6712237..91fc496 100644
--- a/include/asm-sparc/Kbuild
+++ b/include/asm-sparc/Kbuild
@@ -3,12 +3,11 @@ include include/asm-generic/Kbuild.asm
 header-y += apc.h
 header-y += asi.h
 header-y += bpp.h
+header-y += fbio.h
 header-y += jsflash.h
 header-y += openpromio.h
+header-y += perfctr.h
+header-y += psr.h
 header-y += reg.h
 header-y += traps.h
 header-y += vfc_ioctls.h
-
-unifdef-y += fbio.h
-unifdef-y += perfctr.h
-unifdef-y += psr.h
diff --git a/include/asm-sparc64/Kbuild b/include/asm-sparc64/Kbuild
index dce1cf9..3f44ebd 100644
--- a/include/asm-sparc64/Kbuild
+++ b/include/asm-sparc64/Kbuild
@@ -10,14 +10,13 @@ header-y += bbc.h
 header-y += bpp.h
 header-y += display7seg.h
 header-y += envctrl.h
+header-y += fbio.h
 header-y += openprom.h
 header-y += openpromio.h
+header-y += perfctr.h
 header-y += psrcompat.h
 header-y += pstate.h
 header-y += reg.h
 header-y += uctx.h
 header-y += utrap.h
 header-y += watchdog.h
-
-unifdef-y += fbio.h
-unifdef-y += perfctr.h
diff --git a/include/asm-x86/Kbuild b/include/asm-x86/Kbuild
index 1e35545..eae3fd8 100644
--- a/include/asm-x86/Kbuild
+++ b/include/asm-x86/Kbuild
@@ -3,24 +3,23 @@ include include/asm-generic/Kbuild.asm
 header-y += boot.h
 header-y += bootparam.h
 header-y += debugreg.h
+header-y += e820.h
+header-y += ist.h
 header-y += kvm.h
 header-y += ldt.h
+header-y += mce.h
+header-y += msr.h
 header-y += msr-index.h
+header-y += mtrr.h
+header-y += posix_types_32.h
+header-y += posix_types_64.h
 header-y += prctl.h
+header-y += processor-flags.h
 header-y += ptrace-abi.h
+header-y += ptrace.h
 header-y += sigcontext32.h
 header-y += ucontext.h
-header-y += processor-flags.h
-
-unifdef-y += e820.h
-unifdef-y += ist.h
-unifdef-y += mce.h
-unifdef-y += msr.h
-unifdef-y += mtrr.h
-unifdef-y += posix_types_32.h
-unifdef-y += posix_types_64.h
-unifdef-y += ptrace.h
-unifdef-y += unistd_32.h
-unifdef-y += unistd_64.h
-unifdef-y += vm86.h
-unifdef-y += vsyscall.h
+header-y += unistd_32.h
+header-y += unistd_64.h
+header-y += vm86.h
+header-y += vsyscall.h
diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index 93b9885..f28e1b1 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -16,14 +16,22 @@ header-y += netfilter_ipv4/
 header-y += netfilter_ipv6/
 header-y += usb/
 
+header-y += acct.h
+header-y += adb.h
+header-y += adfs_fs.h
 header-y += affs_hardblocks.h
+header-y += agpgart.h
 header-y += aio_abi.h
+header-y += apm_bios.h
 header-y += arcfb.h
+header-y += atalk.h
 header-y += atmapi.h
 header-y += atmarp.h
 header-y += atmbr2684.h
 header-y += atmclip.h
+header-y += atmdev.h
 header-y += atm_eni.h
+header-y += atm.h
 header-y += atm_he.h
 header-y += atm_idt77105.h
 header-y += atmioc.h
@@ -33,330 +41,321 @@ header-y += atm_nicstar.h
 header-y += atmppp.h
 header-y += atmsap.h
 header-y += atmsvc.h
+header-y += atm_tcp.h
 header-y += atm_zatm.h
+header-y += audit.h
 header-y += auto_fs4.h
+header-y += auto_fs.h
+header-y += auxvec.h
 header-y += ax25.h
 header-y += b1lli.h
 header-y += baycom.h
 header-y += bfs_fs.h
+header-y += binfmts.h
 header-y += blkpg.h
 header-y += bpqether.h
 header-y += can.h
+header-y += capability.h
+header-y += capi.h
+header-y += cciss_ioctl.h
 header-y += cdk.h
+header-y += cdrom.h
+header-y += cgroupstats.h
 header-y += chio.h
+header-y += cm4000_cs.h
+header-y += cn_proc.h
+header-y += coda.h
 header-y += coda_psdev.h
 header-y += coff.h
 header-y += comstats.h
+header-y += connector.h
 header-y += const.h
-header-y += cgroupstats.h
 header-y += cramfs_fs.h
+header-y += cuda.h
+header-y += cyclades.h
 header-y += cycx_cfm.h
+header-y += dccp.h
+header-y += dirent.h
 header-y += dlmconstants.h
 header-y += dlm_device.h
+header-y += dlm.h
 header-y += dlm_netlink.h
+header-y += dlm_plock.h
 header-y += dm-ioctl.h
 header-y += dn.h
 header-y += dqblk_v1.h
 header-y += dqblk_v2.h
 header-y += dqblk_xfs.h
+header-y += edd.h
 header-y += efs_fs_sb.h
-header-y += elf-fdpic.h
+header-y += elfcore.h
 header-y += elf-em.h
+header-y += elf-fdpic.h
+header-y += elf.h
+header-y += errno.h
+header-y += errqueue.h
+header-y += ethtool.h
+header-y += eventpoll.h
+header-y += ext2_fs.h
 header-y += fadvise.h
 header-y += falloc.h
+header-y += fb.h
+header-y += fcntl.h
 header-y += fd.h
 header-y += fdreg.h
 header-y += fib_rules.h
+header-y += filter.h
 header-y += firewire-cdev.h
 header-y += firewire-constants.h
+header-y += flat.h
+header-y += fs.h
 header-y += fuse.h
+header-y += futex.h
+header-y += gameport.h
+header-y += generic_serial.h
 header-y += genetlink.h
 header-y += gen_stats.h
 header-y += gfs2_ondisk.h
 header-y += gigaset_dev.h
+header-y += hayesesp.h
+header-y += hdlcdrv.h
+header-y += hdlc.h
+header-y += hdreg.h
+header-y += hiddev.h
+header-y += hid.h
+header-y += hidraw.h
+header-y += hpet.h
 header-y += hysdn_if.h
+header-y += i2c-dev.h
+header-y += i2c.h
 header-y += i2o-dev.h
 header-y += i8k.h
+header-y += icmp.h
+header-y += icmpv6.h
+header-y += if_addr.h
 header-y += if_addrlabel.h
 header-y += if_arcnet.h
+header-y += if_arp.h
 header-y += if_bonding.h
+header-y += if_bridge.h
 header-y += if_cablemodem.h
+header-y += if_ec.h
+header-y += if_eql.h
+header-y += if_ether.h
 header-y += if_fc.h
+header-y += if_fddi.h
+header-y += if_frad.h
 header-y += if.h
 header-y += if_hippi.h
 header-y += if_infiniband.h
+header-y += if_link.h
+header-y += if_ltalk.h
 header-y += if_packet.h
 header-y += if_plip.h
 header-y += if_ppp.h
+header-y += if_pppol2tp.h
+header-y += if_pppox.h
 header-y += if_slip.h
 header-y += if_strip.h
+header-y += if_tr.h
 header-y += if_tun.h
 header-y += if_tunnel.h
+header-y += if_vlan.h
+header-y += igmp.h
+header-y += in6.h
+header-y += inet_diag.h
+header-y += in.h
+header-y += inotify.h
+header-y += input.h
 header-y += in_route.h
 header-y += ioctl.h
 header-y += ip6_tunnel.h
+header-y += ipc.h
+header-y += ip.h
+header-y += ipmi.h
 header-y += ipmi_msgdefs.h
 header-y += ipsec.h
+header-y += ipv6.h
+header-y += ipv6_route.h
 header-y += ipx.h
 header-y += irda.h
+header-y += isdn_divertif.h
+header-y += isdn.h
+header-y += isdnif.h
+header-y += isdn_ppp.h
 header-y += iso_fs.h
 header-y += ixjuser.h
 header-y += jffs2.h
+header-y += joystick.h
+header-y += kdev_t.h
+header-y += kd.h
+header-y += kernelcapi.h
+header-y += kernel.h
+header-y += keyboard.h
 header-y += keyctl.h
+header-y += kvm.h
 header-y += limits.h
+header-y += llc.h
+header-y += loop.h
+header-y += lp.h
 header-y += magic.h
 header-y += major.h
 header-y += matroxfb.h
+header-y += mempolicy.h
 header-y += meye.h
+header-y += mii.h
 header-y += minix_fs.h
+header-y += mman.h
 header-y += mmtimer.h
 header-y += mqueue.h
+header-y += mroute6.h
+header-y += mroute.h
+header-y += msdos_fs.h
+header-y += msg.h
 header-y += mtio.h
+header-y += nbd.h
+header-y += ncp_fs.h
+header-y += ncp.h
+header-y += ncp_mount.h
 header-y += ncp_no.h
 header-y += neighbour.h
+header-y += netdevice.h
 header-y += netfilter_arp.h
+header-y += netfilter_bridge.h
+header-y += netfilter_decnet.h
+header-y += netfilter.h
+header-y += netfilter_ipv4.h
+header-y += netfilter_ipv6.h
+header-y += net.h
+header-y += netlink.h
 header-y += netrom.h
 header-y += nfs2.h
+header-y += nfs3.h
+header-y += nfs4.h
 header-y += nfs4_mount.h
+header-y += nfsacl.h
+header-y += nfs_fs.h
+header-y += nfs.h
+header-y += nfs_idmap.h
 header-y += nfs_mount.h
 header-y += nl80211.h
+header-y += n_r3964.h
+header-y += nubus.h
+header-y += nvram.h
+header-y += oom.h
 header-y += param.h
+header-y += parport.h
+header-y += patchkey.h
+header-y += pci.h
 header-y += pci_regs.h
+header-y += personality.h
 header-y += pfkeyv2.h
 header-y += pg.h
 header-y += phantom.h
+header-y += pim.h
+header-y += pktcdvd.h
 header-y += pkt_cls.h
 header-y += pkt_sched.h
+header-y += pmu.h
+header-y += poll.h
 header-y += posix_types.h
 header-y += ppdev.h
+header-y += ppp-comp.h
+header-y += ppp_defs.h
 header-y += prctl.h
+header-y += ptrace.h
+header-y += qnx4_fs.h
 header-y += qnxtypes.h
+header-y += quota.h
 header-y += quotaio_v1.h
 header-y += quotaio_v2.h
 header-y += radeonfb.h
+header-y += random.h
 header-y += raw.h
+header-y += reboot.h
+header-y += reiserfs_fs.h
+header-y += reiserfs_xattr.h
 header-y += resource.h
+header-y += romfs_fs.h
 header-y += rose.h
+header-y += route.h
+header-y += rtc.h
+header-y += rtnetlink.h
+header-y += scc.h
+header-y += sched.h
+header-y += screen_info.h
+header-y += sdla.h
+header-y += selinux_netlink.h
+header-y += sem.h
+header-y += serial_core.h
+header-y += serial.h
 header-y += serial_reg.h
+header-y += serio.h
+header-y += shm.h
+header-y += signalfd.h
+header-y += signal.h
+header-y += smb_fs.h
+header-y += smb.h
+header-y += smb_mount.h
 header-y += smbno.h
 header-y += snmp.h
+header-y += socket.h
 header-y += sockios.h
 header-y += som.h
+header-y += sonet.h
+header-y += sonypi.h
+header-y += soundcard.h
 header-y += sound.h
+header-y += stat.h
+header-y += stddef.h
+header-y += string.h
 header-y += suspend_ioctls.h
+header-y += synclink.h
+header-y += sysctl.h
 header-y += taskstats.h
+header-y += tcp.h
 header-y += telephony.h
 header-y += termios.h
+header-y += time.h
 header-y += times.h
+header-y += timex.h
 header-y += tiocl.h
-header-y += tipc.h
 header-y += tipc_config.h
+header-y += tipc.h
 header-y += toshiba.h
+header-y += tty.h
+header-y += types.h
 header-y += udf_fs_i.h
+header-y += udp.h
+header-y += uinput.h
+header-y += uio.h
 header-y += ultrasound.h
 header-y += un.h
+header-y += unistd.h
+header-y += usbdevice_fs.h
 header-y += utime.h
+header-y += utsname.h
 header-y += veth.h
 header-y += video_decoder.h
+header-y += videodev2.h
+header-y += videodev.h
 header-y += video_encoder.h
 header-y += videotext.h
+header-y += virtio_9p.h
+header-y += virtio_balloon.h
+header-y += virtio_blk.h
+header-y += virtio_config.h
+header-y += virtio_console.h
+header-y += virtio_net.h
+header-y += virtio_pci.h
+header-y += virtio_ring.h
+header-y += vt.h
+header-y += wait.h
+header-y += wanrouter.h
+header-y += watchdog.h
+header-y += wireless.h
 header-y += x25.h
-
-unifdef-y += acct.h
-unifdef-y += adb.h
-unifdef-y += adfs_fs.h
-unifdef-y += agpgart.h
-unifdef-y += apm_bios.h
-unifdef-y += atalk.h
-unifdef-y += atmdev.h
-unifdef-y += atm.h
-unifdef-y += atm_tcp.h
-unifdef-y += audit.h
-unifdef-y += auto_fs.h
-unifdef-y += auxvec.h
-unifdef-y += binfmts.h
-unifdef-y += capability.h
-unifdef-y += capi.h
-unifdef-y += cciss_ioctl.h
-unifdef-y += cdrom.h
-unifdef-y += cm4000_cs.h
-unifdef-y += cn_proc.h
-unifdef-y += coda.h
-unifdef-y += connector.h
-unifdef-y += cuda.h
-unifdef-y += cyclades.h
-unifdef-y += dccp.h
-unifdef-y += dirent.h
-unifdef-y += dlm.h
-unifdef-y += dlm_plock.h
-unifdef-y += edd.h
-unifdef-y += elf.h
-unifdef-y += elfcore.h
-unifdef-y += errno.h
-unifdef-y += errqueue.h
-unifdef-y += ethtool.h
-unifdef-y += eventpoll.h
-unifdef-y += signalfd.h
-unifdef-y += ext2_fs.h
-unifdef-y += fb.h
-unifdef-y += fcntl.h
-unifdef-y += filter.h
-unifdef-y += flat.h
-unifdef-y += futex.h
-unifdef-y += fs.h
-unifdef-y += gameport.h
-unifdef-y += generic_serial.h
-unifdef-y += hayesesp.h
-unifdef-y += hdlcdrv.h
-unifdef-y += hdlc.h
-unifdef-y += hdreg.h
-unifdef-y += hid.h
-unifdef-y += hiddev.h
-unifdef-y += hidraw.h
-unifdef-y += hpet.h
-unifdef-y += i2c.h
-unifdef-y += i2c-dev.h
-unifdef-y += icmp.h
-unifdef-y += icmpv6.h
-unifdef-y += if_addr.h
-unifdef-y += if_arp.h
-unifdef-y += if_bridge.h
-unifdef-y += if_ec.h
-unifdef-y += if_eql.h
-unifdef-y += if_ether.h
-unifdef-y += if_fddi.h
-unifdef-y += if_frad.h
-unifdef-y += if_ltalk.h
-unifdef-y += if_link.h
-unifdef-y += if_pppol2tp.h
-unifdef-y += if_pppox.h
-unifdef-y += if_tr.h
-unifdef-y += if_vlan.h
-unifdef-y += igmp.h
-unifdef-y += inet_diag.h
-unifdef-y += in.h
-unifdef-y += in6.h
-unifdef-y += inotify.h
-unifdef-y += input.h
-unifdef-y += ip.h
-unifdef-y += ipc.h
-unifdef-y += ipmi.h
-unifdef-y += ipv6.h
-unifdef-y += ipv6_route.h
-unifdef-y += isdn.h
-unifdef-y += isdnif.h
-unifdef-y += isdn_divertif.h
-unifdef-y += isdn_ppp.h
-unifdef-y += joystick.h
-unifdef-y += kdev_t.h
-unifdef-y += kd.h
-unifdef-y += kernelcapi.h
-unifdef-y += kernel.h
-unifdef-y += keyboard.h
-unifdef-y += kvm.h
-unifdef-y += llc.h
-unifdef-y += loop.h
-unifdef-y += lp.h
-unifdef-y += mempolicy.h
-unifdef-y += mii.h
-unifdef-y += mman.h
-unifdef-y += mroute.h
-unifdef-y += mroute6.h
-unifdef-y += msdos_fs.h
-unifdef-y += msg.h
-unifdef-y += nbd.h
-unifdef-y += ncp_fs.h
-unifdef-y += ncp.h
-unifdef-y += ncp_mount.h
-unifdef-y += netdevice.h
-unifdef-y += netfilter_bridge.h
-unifdef-y += netfilter_decnet.h
-unifdef-y += netfilter.h
-unifdef-y += netfilter_ipv4.h
-unifdef-y += netfilter_ipv6.h
-unifdef-y += net.h
-unifdef-y += netlink.h
-unifdef-y += nfs3.h
-unifdef-y += nfs4.h
-unifdef-y += nfsacl.h
-unifdef-y += nfs_fs.h
-unifdef-y += nfs.h
-unifdef-y += nfs_idmap.h
-unifdef-y += n_r3964.h
-unifdef-y += nubus.h
-unifdef-y += nvram.h
-unifdef-y += oom.h
-unifdef-y += parport.h
-unifdef-y += patchkey.h
-unifdef-y += pci.h
-unifdef-y += personality.h
-unifdef-y += pim.h
-unifdef-y += pktcdvd.h
-unifdef-y += pmu.h
-unifdef-y += poll.h
-unifdef-y += ppp_defs.h
-unifdef-y += ppp-comp.h
-unifdef-y += ptrace.h
-unifdef-y += qnx4_fs.h
-unifdef-y += quota.h
-unifdef-y += random.h
-unifdef-y += reboot.h
-unifdef-y += reiserfs_fs.h
-unifdef-y += reiserfs_xattr.h
-unifdef-y += romfs_fs.h
-unifdef-y += route.h
-unifdef-y += rtc.h
-unifdef-y += rtnetlink.h
-unifdef-y += scc.h
-unifdef-y += sched.h
-unifdef-y += screen_info.h
-unifdef-y += sdla.h
-unifdef-y += selinux_netlink.h
-unifdef-y += sem.h
-unifdef-y += serial_core.h
-unifdef-y += serial.h
-unifdef-y += serio.h
-unifdef-y += shm.h
-unifdef-y += signal.h
-unifdef-y += smb_fs.h
-unifdef-y += smb.h
-unifdef-y += smb_mount.h
-unifdef-y += socket.h
-unifdef-y += sonet.h
-unifdef-y += sonypi.h
-unifdef-y += soundcard.h
-unifdef-y += stat.h
-unifdef-y += stddef.h
-unifdef-y += string.h
-unifdef-y += synclink.h
-unifdef-y += sysctl.h
-unifdef-y += tcp.h
-unifdef-y += time.h
-unifdef-y += timex.h
-unifdef-y += tty.h
-unifdef-y += types.h
-unifdef-y += udp.h
-unifdef-y += uinput.h
-unifdef-y += uio.h
-unifdef-y += unistd.h
-unifdef-y += usbdevice_fs.h
-unifdef-y += utsname.h
-unifdef-y += videodev2.h
-unifdef-y += videodev.h
-unifdef-y += virtio_config.h
-unifdef-y += virtio_blk.h
-unifdef-y += virtio_net.h
-unifdef-y += virtio_9p.h
-unifdef-y += virtio_balloon.h
-unifdef-y += virtio_console.h
-unifdef-y += virtio_pci.h
-unifdef-y += virtio_ring.h
-unifdef-y += vt.h
-unifdef-y += wait.h
-unifdef-y += wanrouter.h
-unifdef-y += watchdog.h
-unifdef-y += wireless.h
-unifdef-y += xattr.h
-unifdef-y += xfrm.h
+header-y += xattr.h
+header-y += xfrm.h
 
 objhdr-y += version.h
diff --git a/include/linux/byteorder/Kbuild b/include/linux/byteorder/Kbuild
index 1133d5f..553c06f 100644
--- a/include/linux/byteorder/Kbuild
+++ b/include/linux/byteorder/Kbuild
@@ -1,3 +1,3 @@
-unifdef-y += big_endian.h
-unifdef-y += little_endian.h
-unifdef-y += swab.h
+header-y += big_endian.h
+header-y += little_endian.h
+header-y += swab.h
diff --git a/include/linux/dvb/Kbuild b/include/linux/dvb/Kbuild
index d97b3a5..f4dba86 100644
--- a/include/linux/dvb/Kbuild
+++ b/include/linux/dvb/Kbuild
@@ -1,9 +1,8 @@
+header-y += audio.h
 header-y += ca.h
+header-y += dmx.h
 header-y += frontend.h
 header-y += net.h
 header-y += osd.h
 header-y += version.h
-
-unifdef-y += audio.h
-unifdef-y += dmx.h
-unifdef-y += video.h
+header-y += video.h
diff --git a/include/linux/netfilter/Kbuild b/include/linux/netfilter/Kbuild
index 3aff513..7d7bfcf 100644
--- a/include/linux/netfilter/Kbuild
+++ b/include/linux/netfilter/Kbuild
@@ -1,8 +1,14 @@
+header-y += nf_conntrack_common.h
+header-y += nf_conntrack_ftp.h
 header-y += nf_conntrack_sctp.h
+header-y += nf_conntrack_tcp.h
 header-y += nf_conntrack_tuple_common.h
 header-y += nfnetlink_conntrack.h
+header-y += nfnetlink.h
+header-y += nfnetlink_compat.h
 header-y += nfnetlink_log.h
 header-y += nfnetlink_queue.h
+header-y += x_tables.h
 header-y += xt_CLASSIFY.h
 header-y += xt_CONNMARK.h
 header-y += xt_CONNSECMARK.h
@@ -29,7 +35,9 @@ header-y += xt_mac.h
 header-y += xt_mark.h
 header-y += xt_multiport.h
 header-y += xt_owner.h
+header-y += xt_physdev.h
 header-y += xt_pkttype.h
+header-y += xt_policy.h
 header-y += xt_rateest.h
 header-y += xt_realm.h
 header-y += xt_sctp.h
@@ -38,12 +46,3 @@ header-y += xt_statistic.h
 header-y += xt_string.h
 header-y += xt_tcpmss.h
 header-y += xt_tcpudp.h
-
-unifdef-y += nf_conntrack_common.h
-unifdef-y += nf_conntrack_ftp.h
-unifdef-y += nf_conntrack_tcp.h
-unifdef-y += nfnetlink.h
-unifdef-y += nfnetlink_compat.h
-unifdef-y += x_tables.h
-unifdef-y += xt_physdev.h
-unifdef-y += xt_policy.h
diff --git a/include/linux/netfilter_arp/Kbuild b/include/linux/netfilter_arp/Kbuild
index 4f13dfc..b27439c 100644
--- a/include/linux/netfilter_arp/Kbuild
+++ b/include/linux/netfilter_arp/Kbuild
@@ -1,3 +1,2 @@
+header-y += arp_tables.h
 header-y += arpt_mangle.h
-
-unifdef-y += arp_tables.h
diff --git a/include/linux/netfilter_bridge/Kbuild b/include/linux/netfilter_bridge/Kbuild
index 76ff4c4..1ceb90c 100644
--- a/include/linux/netfilter_bridge/Kbuild
+++ b/include/linux/netfilter_bridge/Kbuild
@@ -1,3 +1,5 @@
+header-y += ebt_802_3.h
+header-y += ebtables.h
 header-y += ebt_among.h
 header-y += ebt_arp.h
 header-y += ebt_arpreply.h
@@ -12,6 +14,3 @@ header-y += ebt_redirect.h
 header-y += ebt_stp.h
 header-y += ebt_ulog.h
 header-y += ebt_vlan.h
-
-unifdef-y += ebtables.h
-unifdef-y += ebt_802_3.h
diff --git a/include/linux/netfilter_ipv4/Kbuild b/include/linux/netfilter_ipv4/Kbuild
index 3a7105b..4e21dc0 100644
--- a/include/linux/netfilter_ipv4/Kbuild
+++ b/include/linux/netfilter_ipv4/Kbuild
@@ -1,3 +1,5 @@
+header-y += ip_queue.h
+header-y += ip_tables.h
 header-y += ipt_CLASSIFY.h
 header-y += ipt_CLUSTERIP.h
 header-y += ipt_CONNMARK.h
@@ -42,6 +44,3 @@ header-y += ipt_string.h
 header-y += ipt_tcpmss.h
 header-y += ipt_tos.h
 header-y += ipt_ttl.h
-
-unifdef-y += ip_queue.h
-unifdef-y += ip_tables.h
diff --git a/include/linux/netfilter_ipv6/Kbuild b/include/linux/netfilter_ipv6/Kbuild
index 8887a5f..2c6981c 100644
--- a/include/linux/netfilter_ipv6/Kbuild
+++ b/include/linux/netfilter_ipv6/Kbuild
@@ -1,3 +1,4 @@
+header-y += ip6_tables.h
 header-y += ip6t_HL.h
 header-y += ip6t_LOG.h
 header-y += ip6t_MARK.h
@@ -17,5 +18,3 @@ header-y += ip6t_owner.h
 header-y += ip6t_physdev.h
 header-y += ip6t_policy.h
 header-y += ip6t_rt.h
-
-unifdef-y += ip6_tables.h
diff --git a/include/linux/nfsd/Kbuild b/include/linux/nfsd/Kbuild
index fc97204..55d1467 100644
--- a/include/linux/nfsd/Kbuild
+++ b/include/linux/nfsd/Kbuild
@@ -1,6 +1,6 @@
-unifdef-y += const.h
-unifdef-y += debug.h
-unifdef-y += export.h
-unifdef-y += nfsfh.h
-unifdef-y += stats.h
-unifdef-y += syscall.h
+header-y += const.h
+header-y += debug.h
+header-y += export.h
+header-y += nfsfh.h
+header-y += stats.h
+header-y += syscall.h
diff --git a/include/linux/sunrpc/Kbuild b/include/linux/sunrpc/Kbuild
index fb438f1..98df211 100644
--- a/include/linux/sunrpc/Kbuild
+++ b/include/linux/sunrpc/Kbuild
@@ -1 +1 @@
-unifdef-y += debug.h
+header-y += debug.h
diff --git a/include/sound/Kbuild b/include/sound/Kbuild
index fd054a3..b5b7ac7 100644
--- a/include/sound/Kbuild
+++ b/include/sound/Kbuild
@@ -1,10 +1,9 @@
+header-y += asequencer.h
 header-y += asound_fm.h
+header-y += asound.h
+header-y += emu10k1.h
 header-y += hdsp.h
 header-y += hdspm.h
+header-y += sb16_csp.h
 header-y += sfnt_info.h
 header-y += sscape_ioctl.h
-
-unifdef-y += asequencer.h
-unifdef-y += asound.h
-unifdef-y += emu10k1.h
-unifdef-y += sb16_csp.h
diff --git a/include/video/Kbuild b/include/video/Kbuild
index 0e406f7..fff858e 100644
--- a/include/video/Kbuild
+++ b/include/video/Kbuild
@@ -1,2 +1,2 @@
-unifdef-y += sisfb.h uvesafb.h
-unifdef-y += edid.h
+header-y += edid.h
+header-y += sisfb.h uvesafb.h
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 53dae3e..4e22f58 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -1,8 +1,7 @@
 # ==========================================================================
 # Installing headers
 #
-# header-y files will be installed verbatim
-# unifdef-y are the files where unifdef will be run before installing files
+# header-y are the files where unifdef will be run before installing files
 # objhdr-y are generated files that will be installed verbatim
 #
 # ==========================================================================
@@ -51,24 +50,21 @@ ifeq ($(obj)$(ALTARCH),include/asm-$(ARCH)$(BIASMDIR))
 endif
 
 header-y	:= $(sort $(header-y))
-unifdef-y	:= $(sort $(unifdef-y))
 subdir-y	:= $(patsubst %/,%,$(filter %/, $(header-y)))
 header-y	:= $(filter-out %/, $(header-y))
-header-y	:= $(filter-out $(unifdef-y),$(header-y))
 
 # stamp files for header checks
-check-y		:= $(patsubst %,.check.%,$(header-y) $(unifdef-y) $(objhdr-y))
+check-y		:= $(patsubst %,.check.%,$(header-y) $(objhdr-y))
 
 # Work out what needs to be removed
 oldheaders	:= $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/%,%,$(wildcard $(INSTALL_HDR_PATH)/$(_dst)/*.h))
-unwanted	:= $(filter-out $(header-y) $(unifdef-y) $(objhdr-y),$(oldheaders))
+unwanted	:= $(filter-out $(header-y) $(objhdr-y),$(oldheaders))
 
 oldcheckstamps	:= $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/%,%,$(wildcard $(INSTALL_HDR_PATH)/$(_dst)/.check.*.h))
 unwanted	+= $(filter-out $(check-y),$(oldcheckstamps))
 
 # Prefix them all with full paths to $(INSTALL_HDR_PATH)
 header-y 	:= $(patsubst %,$(INSTALL_HDR_PATH)/$(_dst)/%,$(header-y))
-unifdef-y 	:= $(patsubst %,$(INSTALL_HDR_PATH)/$(_dst)/%,$(unifdef-y))
 objhdr-y 	:= $(patsubst %,$(INSTALL_HDR_PATH)/$(_dst)/%,$(objhdr-y))
 check-y 	:= $(patsubst %,$(INSTALL_HDR_PATH)/$(_dst)/%,$(check-y))
 
@@ -89,11 +85,7 @@ quiet_cmd_o_hdr_install   = INSTALL $(patsubst $(INSTALL_HDR_PATH)/%,%,$@)
 			    $(INSTALL_HDR_PATH)/$(_dst)
 
 quiet_cmd_headers_install = INSTALL $(patsubst $(INSTALL_HDR_PATH)/%,%,$@)
-      cmd_headers_install = $(HDRSED) $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/%,$(srctree)/$(obj)/%,$@)	\
-			    > $@
-
-quiet_cmd_unifdef	  = UNIFDEF $(patsubst $(INSTALL_HDR_PATH)/%,%,$@)
-      cmd_unifdef	  = $(UNIFDEF) $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/%,$(srctree)/$(obj)/%,$@) \
+      cmd_headers_install = $(UNIFDEF) $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/%,$(srctree)/$(obj)/%,$@) \
 				   | $(HDRSED) > $@ || :
 
 quiet_cmd_check		  = CHECK   $(patsubst $(INSTALL_HDR_PATH)/$(_dst)/.check.%,$(_dst)/%,$@)
@@ -151,10 +143,10 @@ include /dev/null $(wildcard $(check-y))
 
 else
 # Rules for installing headers
-__headersinst: $(subdir-y) $(header-y) $(unifdef-y) $(altarch-y) $(objhdr-y)
+__headersinst: $(subdir-y) $(header-y) $(altarch-y) $(objhdr-y)
 	@true
 
-$(objhdr-y) $(subdir-y) $(header-y) $(unifdef-y): | $(INSTALL_HDR_PATH)/$(_dst) $(unwanted)
+$(objhdr-y) $(subdir-y) $(header-y): | $(INSTALL_HDR_PATH)/$(_dst) $(unwanted)
 
 $(INSTALL_HDR_PATH)/$(_dst):
 	$(call cmd,mkdir)
@@ -164,7 +156,7 @@ $(unwanted):
 	$(call cmd,remove)
 
 ifdef GENASM
-$(objhdr-y) $(header-y) $(unifdef-y): $(KBUILDFILES)
+$(objhdr-y) $(header-y): $(KBUILDFILES)
 	$(call cmd,gen)
 
 else
@@ -173,9 +165,6 @@ $(objhdr-y) :		$(INSTALL_HDR_PATH)/$(_dst)/%.h: $(objtree)/$(obj)/%.h $(KBUILDFI
 
 $(header-y) :		$(INSTALL_HDR_PATH)/$(_dst)/%.h: $(srctree)/$(obj)/%.h $(KBUILDFILES)
 	$(call cmd,headers_install)
-
-$(unifdef-y) :		$(INSTALL_HDR_PATH)/$(_dst)/%.h: $(srctree)/$(obj)/%.h $(KBUILDFILES)
-	$(call cmd,unifdef)
 endif
 endif
 
@@ -184,7 +173,7 @@ hdrinst := -rR -f $(srctree)/scripts/Makefile.headersinst obj
 .PHONY: altarch-dir
 # All the files in the normal arch dir must be created first, since we test
 # for their existence.
-altarch-dir: $(subdir-y) $(header-y) $(unifdef-y) $(objhdr-y)
+altarch-dir: $(subdir-y) $(header-y) $(objhdr-y)
 	$(Q)$(MAKE) $(hdrinst)=include/asm-$(ALTARCH) dst=include/asm-$(ALTARCH)
 	$(Q)$(MAKE) $(hdrinst)=include/asm dst=include/asm$(BIASMDIR)
 

