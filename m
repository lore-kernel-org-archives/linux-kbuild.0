Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56091 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750788AbbJAXPo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 19:15:44 -0400
Message-ID: <1443741332.2730.75.camel@decadent.org.uk>
Subject: [PATCH] kbuild: Add support for SOURCE_DATE_EPOCH environment
 variable
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 02 Oct 2015 00:15:32 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XBUWhZocGLBSbCLzAhs2"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, reproducible-builds@lists.alioth.debian.org


--=-XBUWhZocGLBSbCLzAhs2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As part of the reproducible builds project, the SOURCE_DATE_EPOCH
environment variable has been specified as a project- and
distribution-independent means to specify a timestamp at build
time: https://reproducible-builds.org/specs/source-date-epoch/

Add support for this by converting it to KBUILD_BUILD_TIMESTAMP
if they aren't both set.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 Documentation/kbuild/kbuild.txt | 15 +++++++++------
 Makefile                        | 10 ++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.=
txt
index 0ff6a46..9f95228 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -211,12 +211,15 @@ KBUILD_ENABLE_EXTRA_GCC_CHECKS
 If enabled over the make command line with "W=3D1", it turns on additional
 gcc -W... options for more extensive build-time checking.
=20
-KBUILD_BUILD_TIMESTAMP
---------------------------------------------------
-Setting this to a date string overrides the timestamp used in the
-UTS_VERSION definition (uname -v in the running kernel). The value has to
-be a string that can be passed to date -d. The default value
-is the output of the date command at one point during build.
+KBUILD_BUILD_TIMESTAMP, SOURCE_DATE_EPOCH
+--------------------------------------------------
+Setting KBUILD_BUILD_TIMESTAMP to a date string overrides the
+timestamp used in the UTS_VERSION definition (uname -v in the running
+kernel). The value has to be a string that can be passed to date -d.
+The default value is the output of the date command at one point
+during build. Alternately, the timestamp may be specified in
+SOURCE_DATE_EPOCH as the number of whole non-leap seconds since the
+epoch.
=20
 KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 --------------------------------------------------
diff --git a/Makefile b/Makefile
index 1d341eb..bfb0243 100644
--- a/Makefile
+++ b/Makefile
@@ -417,6 +417,16 @@ export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUIL=
D_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
 export KBUILD_ARFLAGS
=20
+ifndef KBUILD_BUILD_TIMESTAMP
+  # If SOURCE_DATE_EPOCH is set in the environment (only), then
+  # generate a timestamp string based on that, independent of the
+  # current time zone and locale.
+  ifeq ("$(origin SOURCE_DATE_EPOCH)", "environment")
+    KBUILD_BUILD_TIMESTAMP :=3D $(shell LC_TIME=3DC date -u -d@$(SOURCE_DA=
TE_EPOCH))
+    export KBUILD_BUILD_TIMESTAMP
+  endif
+endif
+
 # When compiling out-of-tree modules, put MODVERDIR in the module
 # tree rather than in the kernel tree. The kernel tree might
 # even be read-only.
--=20
Ben Hutchings
When in doubt, use brute force. - Ken Thompson
--=-XBUWhZocGLBSbCLzAhs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVg2+lOe/yOyVhhEJAQrOQhAAqIMyj2wHQ8KLcWi6BoSSWF91duE+v5ie
pmDZpd6c5O0KfNS77ajlqz6pLS7CMEx22cNuXQfJsTqNDTENHQ05TosJc/EkqDaf
JbnoAwqnenP5vKck8K1WpNA3CQvhddlzQ3z1dQo2gtFC+t6WPnB35GiL1BF87ToY
zeI+bbpZuraX5mt4BiHK0ewCyxu+lXUP73kyKY5VUNl6al1F4yUFkLim0QvWIx3G
mmKhrN3wMUbEL1UI1186W/j8FHO/fSDKIVP97UOU9Wvama26Jj2F/yIxbHWgPEVh
e7vuw9nAHzBoWrUc48KWvI2iZLCOR4kH9EGfT5c0KLjj0FOaDxo2QQyPIvdVwPaA
NhnJOCls0EtJs4pe7lLjtnuhgMm9WPIRU6fAFjmM/2v/F0X7TGqmjKrPWi5ecsqP
e+3M4I3P2KZgbKw8HEnsb6CSS5qAHNrcTp0b2oJPSBPlk+DU9Vi1kslo0KuAprE7
nkTquXD6wIA8gYu/mWXtfTq2xB3qHm33kyctY6dz1l8We8CXSY97N+q+0ys6g1Uc
ZWz9TAfpaHPY3uByVb7qBexpOXc+RtizJW+PWTRzwauipOfhN2aAx6wUO3EYYzxa
oAqcwsmsF62NUuDkXXCfprrNBXLVw1lbNwjqOGwuUEfigdYtlGqnN3QbZytldGox
fjQENL/2sGc=
=KpYG
-----END PGP SIGNATURE-----

--=-XBUWhZocGLBSbCLzAhs2--
