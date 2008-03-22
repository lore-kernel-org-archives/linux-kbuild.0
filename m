Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41618 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752511AbYCVSpL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 22 Mar 2008 14:45:11 -0400
Date: Sat, 22 Mar 2008 14:45:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD: Move files that don't check __KERNEL__.
Message-ID: <alpine.LFD.1.00.0803221442550.22665@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@osdl.org>



Move files that don't check __KERNEL__ from unifdef-y to header-y.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index 4108b38..e57f006 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -20,6 +20,7 @@ header-y += affs_hardblocks.h
 header-y += aio_abi.h
 header-y += arcfb.h
 header-y += atmapi.h
+header-y += atmarp.h
 header-y += atmbr2684.h
 header-y += atmclip.h
 header-y += atm_eni.h
@@ -48,6 +49,7 @@ header-y += coff.h
 header-y += comstats.h
 header-y += const.h
 header-y += cgroupstats.h
+header-y += cramfs_fs.h
 header-y += cycx_cfm.h
 header-y += dlmconstants.h
 header-y += dlm_device.h
@@ -70,10 +72,12 @@ header-y += firewire-constants.h
 header-y += fuse.h
 header-y += genetlink.h
 header-y += gen_stats.h
+header-y += gfs2_ondisk.h
 header-y += gigaset_dev.h
 header-y += hysdn_if.h
 header-y += i2o-dev.h
 header-y += i8k.h
+header-y += if_addrlabel.h
 header-y += if_arcnet.h
 header-y += if_bonding.h
 header-y += if_cablemodem.h
@@ -90,6 +94,7 @@ header-y += if_tunnel.h
 header-y += in6.h
 header-y += in_route.h
 header-y += ioctl.h
+header-y += ip6_tunnel.h
 header-y += ipmi_msgdefs.h
 header-y += ipsec.h
 header-y += ipx.h
@@ -151,11 +156,14 @@ header-y += tipc_config.h
 header-y += toshiba.h
 header-y += ultrasound.h
 header-y += un.h
+header-y += unistd.h
 header-y += utime.h
 header-y += veth.h
 header-y += video_decoder.h
 header-y += video_encoder.h
 header-y += videotext.h
+header-y += virtio_blk.h
+header-y += virtio_net.h
 header-y += x25.h

 unifdef-y += acct.h
@@ -164,7 +172,6 @@ unifdef-y += adfs_fs.h
 unifdef-y += agpgart.h
 unifdef-y += apm_bios.h
 unifdef-y += atalk.h
-unifdef-y += atmarp.h
 unifdef-y += atmdev.h
 unifdef-y += atm.h
 unifdef-y += atm_tcp.h
@@ -180,7 +187,6 @@ unifdef-y += cm4000_cs.h
 unifdef-y += cn_proc.h
 unifdef-y += coda.h
 unifdef-y += connector.h
-unifdef-y += cramfs_fs.h
 unifdef-y += cuda.h
 unifdef-y += cyclades.h
 unifdef-y += dccp.h
@@ -204,7 +210,6 @@ unifdef-y += futex.h
 unifdef-y += fs.h
 unifdef-y += gameport.h
 unifdef-y += generic_serial.h
-unifdef-y += gfs2_ondisk.h
 unifdef-y += hayesesp.h
 unifdef-y += hdlcdrv.h
 unifdef-y += hdlc.h
@@ -217,7 +222,6 @@ unifdef-y += i2c-dev.h
 unifdef-y += icmp.h
 unifdef-y += icmpv6.h
 unifdef-y += if_addr.h
-unifdef-y += if_addrlabel.h
 unifdef-y += if_arp.h
 unifdef-y += if_bridge.h
 unifdef-y += if_ec.h
@@ -243,7 +247,6 @@ unifdef-y += ipc.h
 unifdef-y += ipmi.h
 unifdef-y += ipv6.h
 unifdef-y += ipv6_route.h
-unifdef-y += ip6_tunnel.h
 unifdef-y += isdn.h
 unifdef-y += isdnif.h
 unifdef-y += isdn_divertif.h
@@ -339,14 +342,11 @@ unifdef-y += udf_fs_i.h
 unifdef-y += udp.h
 unifdef-y += uinput.h
 unifdef-y += uio.h
-unifdef-y += unistd.h
 unifdef-y += usbdevice_fs.h
 unifdef-y += utsname.h
 unifdef-y += videodev2.h
 unifdef-y += videodev.h
 unifdef-y += virtio_config.h
-unifdef-y += virtio_blk.h
-unifdef-y += virtio_net.h
 unifdef-y += vt.h
 unifdef-y += wait.h
 unifdef-y += wanrouter.h
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
