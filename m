Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:59749 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753642Ab3DVQvp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 12:51:45 -0400
From: Mike Frysinger <vapier@gentoo.org>
Subject: non-visible options vs menuconfigs
Date: Mon, 22 Apr 2013 12:51:53 -0400
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart10290676.A6I2GGp54u";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304221251.54695.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

--nextPart10290676.A6I2GGp54u
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

the current EXPERT menuconfig is broken by some new options that happen to =
be=20
sprinkled into the wrong place.  seems like if a node is unprintable, it=20
should get skipped for menuconfig purposes ?  otherwise, this is a constant=
ly=20
losing battle where someone inserts new Kconfig options and forgets this=20
nuance, and then it stays broken for a while until someone notices.  this=20
particular bug wrt EXPERT has been linux-3.2.

for example, in the General setup section, you currently see:
	[ ] Configure standard kernel features (expert users)  --->
	[ ] Embedded system

if you enable EXPERT there, the options get dumped into the same level inst=
ead=20
of being under that menuconfig:
	[*] Configure standard kernel features (expert users)  --->
	[ ] Sysctl syscall support
	[*] Load all symbols for debugging/ksymoops
	...
	[ ] Embedded system

is this feasible in the kconfig code ?
=2Dmike

=2D-- a/init/Kconfig
+++ b/init/Kconfig
@@ -1177,6 +1177,35 @@ config SYSCTL
 config ANON_INODES
 	bool
=20
+config HAVE_UID16
+	bool
+
+config SYSCTL_EXCEPTION_TRACE
+	bool
+	help
+	  Enable support for /proc/sys/debug/exception-trace.
+
+config SYSCTL_ARCH_UNALIGN_NO_WARN
+	bool
+	help
+	  Enable support for /proc/sys/kernel/ignore-unaligned-usertrap
+	  Allows arch to define/use @no_unaligned_warning to possibly warn
+	  about unaligned access emulation going on under the hood.
+
+config SYSCTL_ARCH_UNALIGN_ALLOW
+	bool
+	help
+	  Enable support for /proc/sys/kernel/unaligned-trap
+	  Allows arches to define/use @unaligned_enabled to runtime toggle
+	  the unaligned access emulation.
+	  see arch/parisc/kernel/unaligned.c for reference
+
+config HOTPLUG
+	def_bool y
+
+config HAVE_PCSPKR_PLATFORM
+	bool
+
 menuconfig EXPERT
 	bool "Configure standard kernel features (expert users)"
 	# Unhide debug options, to make the on-by-default options visible
@@ -1187,9 +1216,6 @@ menuconfig EXPERT
           environments which can tolerate a "non-standard" kernel.
           Only use this if you really know what you are doing.
=20
=2Dconfig HAVE_UID16
=2D	bool
=2D
 config UID16
 	bool "Enable 16-bit UID system calls" if EXPERT
 	depends on HAVE_UID16
@@ -1214,26 +1240,6 @@ config SYSCTL_SYSCALL
=20
 	  If unsure say N here.
=20
=2Dconfig SYSCTL_EXCEPTION_TRACE
=2D	bool
=2D	help
=2D	  Enable support for /proc/sys/debug/exception-trace.
=2D
=2Dconfig SYSCTL_ARCH_UNALIGN_NO_WARN
=2D	bool
=2D	help
=2D	  Enable support for /proc/sys/kernel/ignore-unaligned-usertrap
=2D	  Allows arch to define/use @no_unaligned_warning to possibly warn
=2D	  about unaligned access emulation going on under the hood.
=2D
=2Dconfig SYSCTL_ARCH_UNALIGN_ALLOW
=2D	bool
=2D	help
=2D	  Enable support for /proc/sys/kernel/unaligned-trap
=2D	  Allows arches to define/use @unaligned_enabled to runtime toggle
=2D	  the unaligned access emulation.
=2D	  see arch/parisc/kernel/unaligned.c for reference
=2D
 config KALLSYMS
 	 bool "Load all symbols for debugging/ksymoops" if EXPERT
 	 default y
@@ -1259,9 +1265,6 @@ config KALLSYMS_ALL
=20
 	   Say N unless you really need all symbols.
=20
=2Dconfig HOTPLUG
=2D	def_bool y
=2D
 config PRINTK
 	default y
 	bool "Enable support for printk" if EXPERT
@@ -1300,9 +1303,6 @@ config PCSPKR_PLATFORM
           This option allows to disable the internal PC-Speaker
           support, saving some memory.
=20
=2Dconfig HAVE_PCSPKR_PLATFORM
=2D	bool
=2D
 config BASE_FULL
 	default y
 	bool "Enable full-sized data structures for core" if EXPERT

--nextPart10290676.A6I2GGp54u
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdWqqAAoJEEFjO5/oN/WBjuMP/20MtjnO/+DjeZ9nCDK2mH+U
acURh1OViNUnGLsKLQot0+83xwC9UwQYujiuUr+jTrFfhk5xqwd+VTsNJGvZVeT5
ho8pqCc5hT1+vPD9YZU9zZpAupJ1wuLFvB16qntv8thiBoZiVwXDqP6qezezGU2Z
2xg6EtriQ3b/LP2InBiCdrM8HPjOA5tvTPBmFFxJUCS/BSfbr24tbJXAtBoKG8fy
AHPijRx75Trps+j8HQFKd1gcyox1OcpG3HL3h8Gd8Nx+wgXhrWuAUwxVPo0s86wZ
AK+viBzcK2BrcdlfopJkxgRvJMfoIktZJfD3oyv/BaODiWBcARybtB8OrR45VFeo
Xb5w5wCE/QCBK+//nw0mu4Ne/+jE5WHqYWMdiBT0I1zuO+2adgP0A0YBsy3zmYnx
ZMFgMTuaQMN1AoG3ChHk0nXVY89S0xQ/QhBRUtEaeeYLhDGfkXNYZYQFSKZAF4TM
0YSQxrhKaJwrT8ZYs/5XVqKbLQLp8P3KhvCP7A7V2RVxyUKlPdSGgfmVqbC4RquM
YUNWcqktYMALa1E37uHsWeXLZCRBwcu6bZjbKyw2mUQyNu+/4OsJsHckLlA9D+4S
qnKqo7cDVyLHDGJH0UZizNt6FgcpdET4mqT59Eqq9Roi65J1Fmgs8N6MLf50W855
7CiAIdknDPgeH7zTdhTq
=NSrj
-----END PGP SIGNATURE-----

--nextPart10290676.A6I2GGp54u--
