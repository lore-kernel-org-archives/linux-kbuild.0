Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56235 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750877AbaKFA7I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Nov 2014 19:59:08 -0500
Received: from deadeye.wl.decadent.org.uk ([192.168.4.249] helo=deadeye)
	by shadbolt.decadent.org.uk with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <ben@decadent.org.uk>)
	id 1XmBPm-0000j6-0x
	for linux-kbuild@vger.kernel.org; Thu, 06 Nov 2014 00:59:06 +0000
Received: from ben by deadeye with local (Exim 4.84)
	(envelope-from <ben@decadent.org.uk>)
	id 1XmBPg-0003Vp-IL
	for linux-kbuild@vger.kernel.org; Thu, 06 Nov 2014 00:59:00 +0000
Message-ID: <1415235534.3398.35.camel@decadent.org.uk>
Subject: [PATCH] kbuild: Use -nostdinc in compile tests
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 06 Nov 2014 00:58:54 +0000
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xqiVDHztrK2ygq+pgsyh"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>


--=-xqiVDHztrK2ygq+pgsyh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gcc 4.8 and later include <stdc-predef.h> by default.  In some
versions of eglibc that includes <bits/predefs.h>, but that may be
missing when building with a biarch compiler.  Also <stdc-predef.h>
itself could be missing as we are only trying to build a kernel, not
userland.

The -nostdinc option disables this, though it isn't explicitly
documented.  This option is already used when actually building
the kernel, but not by cc-option and other tests.  This can result
in silently miscompiling the kernel.

References: https://bugs.debian.org/717557
References: https://bugs.debian.org/726861
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This specific issue appeared and then was fixed in Debian about a year
ago, but it seems like it can also affect cross-builds.

It may also be worth adding some sort of sanity test, so we stop
immediately if $(cc-option $(empty),broken) yields 'broken'.

Ben.

 Makefile               |  4 +++-
 scripts/Kbuild.include | 15 ++++++++-------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index ffc1ce2..c0fbf67 100644
--- a/Makefile
+++ b/Makefile
@@ -619,6 +619,8 @@ endif
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dallow-store-data-races=3D0)
=20
+NOSTDINC_FLAGS +=3D -nostdinc
+
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
 # reorder blocks reorders the control in the function
@@ -742,7 +744,7 @@ KBUILD_CFLAGS +=3D $(call cc-option, -fno-inline-functi=
ons-called-once)
 endif
=20
 # arch Makefile may override CC so keep this after arch Makefile is includ=
ed
-NOSTDINC_FLAGS +=3D -nostdinc -isystem $(shell $(CC) -print-file-name=3Din=
clude)
+NOSTDINC_FLAGS +=3D -isystem $(shell $(CC) -print-file-name=3Dinclude)
 CHECKFLAGS     +=3D $(NOSTDINC_FLAGS)
=20
 # warn about C99 declaration after statement
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 65e7b08..e87fc08 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -111,12 +111,12 @@ as-instr =3D $(call try-run,\
 # Usage: cflags-y +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di586)
=20
 cc-option =3D $(call try-run,\
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TM=
P",$(1),$(2))
+	$(CC) $(NOSTDINC_FLAGS) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c =
/dev/null -o "$$TMP",$(1),$(2))
=20
 # cc-option-yn
 # Usage: flag :=3D $(call cc-option-yn,-march=3Dwinchip-c6)
 cc-option-yn =3D $(call try-run,\
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TM=
P",y,n)
+	$(CC) $(NOSTDINC_FLAGS) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c =
/dev/null -o "$$TMP",y,n)
=20
 # cc-option-align
 # Prefix align with either -falign or -malign
@@ -126,16 +126,17 @@ cc-option-align =3D $(subst -functions=3D0,,\
 # cc-disable-warning
 # Usage: cflags-y +=3D $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning =3D $(call try-run,\
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/nu=
ll -o "$$TMP",-Wno-$(strip $(1)))
+	$(CC) $(NOSTDINC_FLAGS) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1=
)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
=20
 # cc-version
 # Usage gcc-ver :=3D $(call cc-version)
-cc-version =3D $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $=
(CC))
+cc-version =3D $(shell $(CONFIG_SHELL) \
+	$(srctree)/scripts/gcc-version.sh $(CC) $(NOSTDINC_FLAGS))
=20
 # cc-fullversion
 # Usage gcc-ver :=3D $(call cc-fullversion)
 cc-fullversion =3D $(shell $(CONFIG_SHELL) \
-	$(srctree)/scripts/gcc-version.sh -p $(CC))
+	$(srctree)/scripts/gcc-version.sh -p $(CC) $(NOSTDINC_FLAGS))
=20
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS +=3D $(call cc-ifversion, -lt, 0402, -O1)
@@ -144,12 +145,12 @@ cc-ifversion =3D $(shell [ $(call cc-version, $(CC)) =
$(1) $(2) ] && echo $(3))
 # cc-ldoption
 # Usage: ldflags +=3D $(call cc-ldoption, -Wl$(comma)--hash-style=3Dboth)
 cc-ldoption =3D $(call try-run,\
-	$(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(NOSTDINC_FLAGS) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2=
))
=20
 # ld-option
 # Usage: LDFLAGS +=3D $(call ld-option, -X)
 ld-option =3D $(call try-run,\
-	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1)=
,$(2))
+	$(CC) $(NOSTDINC_FLAGS) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMP=
O" -o "$$TMP",$(1),$(2))
=20
 # ar-option
 # Usage: KBUILD_ARFLAGS :=3D $(call ar-option,D)

--=20
Ben Hutchings
Beware of programmers who carry screwdrivers. - Leonard Brandwein

--=-xqiVDHztrK2ygq+pgsyh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVFrH1Oe/yOyVhhEJAQpwBRAAhEjhsDY/j8nW2apB0JMJ0ha2/48bHW7e
R1rWH3nz8gTlSgKuJJB3/sAk+qhs95NQPdXmAQGc6J7Ksu3UsObNhlICRUlqyE7F
2lVtDfw2SghKbgDxFlPU02KstGmlrALmbJ/BxFiEA+q/GEc+A+zAxUdPon4G1iIh
Ktm/m5F404D+Dw07DVtHM8j5wwiJ/P1iZVcoLQ/IRxOtlC8B18GREg6SxysYYdAE
kFicTYBxdeKhSKXTVK4GWnztpeZXslZMMc2qn41B/xqy94LNIk1Rm2ewkbPRvt72
aDWaEJjc3Qzk15j6P3cjOl/ZQwfd31I8Ik4CdLC0+hvJ/VIYobcn0ltl6Y2vBG5m
Hdgm9Y7EDOtcwg/9XkWw6eNftlaQkpQyNzIH0TMH4RoI8fZmJEvu8QX4FN24exRz
UbayuoohQLL5ZxV8/7SxLCrT9uqb29adHSoB2DA9zLgx2lQzh2KiS/OXsKUhyn7A
94ST5jdvzqGKAPbH5u/Sq40k8uaI2c6z4pm3x3V1h+qmT6BSX+m4HKSsgnZ2IKWG
T97sepT5iyQq/eeoWUEAj3CfiouPYF4OGgmhaVUveCbRoOwMpf7cqS6InR9GAzHA
17q4SK9z9LAz7JQPxR8nUsb2VFlvw+s/dAaNA0N+KameXi0640brjJlSA3C8xUcA
tRGnG1Gd5Fs=
=mxrp
-----END PGP SIGNATURE-----

--=-xqiVDHztrK2ygq+pgsyh--
