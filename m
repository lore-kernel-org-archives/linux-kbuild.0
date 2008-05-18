Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:44508 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755453AbYERASL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 17 May 2008 20:18:11 -0400
Date: Sat, 17 May 2008 20:18:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to header-y.
Message-ID: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@osdl.org>


Move exported header files under include/linux that don't check the
__KERNEL__ preprocessor from unifdef-y to header-y.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index b7d81b2..6333a16 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -104,6 +104,7 @@ header-y += iso_fs.h
 header-y += ixjuser.h
 header-y += jffs2.h
 header-y += keyctl.h
+header-y += kvm.h
 header-y += limits.h
 header-y += dlm_plock.h
 header-y += magic.h
@@ -157,11 +158,18 @@ header-y += toshiba.h
 header-y += udf_fs_i.h
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
+header-y += virtio_9p.h
+header-y += virtio_balloon.h
+header-y += virtio_pci.h
+header-y += wireless.h
 header-y += x25.h

 unifdef-y += acct.h
@@ -253,7 +261,6 @@ unifdef-y += kd.h
 unifdef-y += kernelcapi.h
 unifdef-y += kernel.h
 unifdef-y += keyboard.h
-unifdef-y += kvm.h
 unifdef-y += llc.h
 unifdef-y += loop.h
 unifdef-y += lp.h
@@ -338,24 +345,17 @@ unifdef-y += types.h
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
-unifdef-y += virtio_9p.h
-unifdef-y += virtio_balloon.h
 unifdef-y += virtio_console.h
-unifdef-y += virtio_pci.h
 unifdef-y += virtio_ring.h
 unifdef-y += vt.h
 unifdef-y += wait.h
 unifdef-y += wanrouter.h
 unifdef-y += watchdog.h
-unifdef-y += wireless.h
 unifdef-y += xattr.h
 unifdef-y += xfrm.h


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
