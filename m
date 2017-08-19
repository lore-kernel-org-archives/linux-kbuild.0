Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37330 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752025AbdHSVaE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 17:30:04 -0400
Date: Sat, 19 Aug 2017 22:30:02 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20170819213002.GI18698@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DfnuYBTqzt7sVGu3"
Content-Disposition: inline
Subject: [PATCH v2] kbuild: Do not use hyphen in exported variable name
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org, Masahiro Yamada <yamada.masahiro@socionext.com>


--DfnuYBTqzt7sVGu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This definition in Makefile.dtbinst:

    export dtbinst-root ?=3D $(obj)

should define and export dtbinst-root when handling the root dts
directory, and do nothing in the subdirectories.  However some shells,
including dash, will not pass through environment variables whose name
includes a hyphen.  Usually GNU make does not use a shell to recurse,
but if e.g. $(srctree) contains '~' it will use a shell here.

Rename the variable to dtbinst_root.

References: https://bugs.debian.org/833561
Fixes: 323a028d39cdi ("dts, kbuild: Implement support for dtb vendor subdir=
s")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
v2: Revised the commit message to explain exactly how the hyphenated
variable can be lost.

 scripts/Makefile.dtbinst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 34614a48b717..993fb85982df 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -14,7 +14,7 @@ src :=3D $(obj)
 PHONY :=3D __dtbs_install
 __dtbs_install:
=20
-export dtbinst-root ?=3D $(obj)
+export dtbinst_root ?=3D $(obj)
=20
 include include/config/auto.conf
 include scripts/Kbuild.include
@@ -27,7 +27,7 @@ dtbinst-dirs	:=3D $(dts-dirs)
 quiet_cmd_dtb_install =3D	INSTALL $<
       cmd_dtb_install =3D	mkdir -p $(2); cp $< $(2)
=20
-install-dir =3D $(patsubst $(dtbinst-root)%,$(INSTALL_DTBS_PATH)%,$(obj))
+install-dir =3D $(patsubst $(dtbinst_root)%,$(INSTALL_DTBS_PATH)%,$(obj))
=20
 $(dtbinst-files): %.dtb: $(obj)/%.dtb
 	$(call cmd,dtb_install,$(install-dir))

--DfnuYBTqzt7sVGu3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWZit2ee/yOyVhhEJAQqu0Q//Que3uRTCER/+OXDO3Y/DHVPZf3Ifp+OL
kpKhZ5Ah+wmgTvHwfnXD4jH5amqos7BQJakc0/0onrac+/IHzYlNxY79f7jL1bW6
enjheDdSDLk+by/+koIUUz+zCAQZ+Phs91N0jwqjvTvrOniw79SYW5DbNGuk82ix
nNVvR+UIbhX1CjGT49hQ1aQDOJihJet2xPF91CJsIirDFtjJwCiubPrRLsRp/Qkt
7qzAzdeZ1HHA0FGcITV4WaK5dkqk8tFQWb3VPqDbEWL3TL0W83Lj8sTcJCvifL4F
xAJabF8fd1yMvzRpG3FXRACCQOnx2pDA+Fu7iO75QNp7TexQgLipPLUgH/rc1GOa
0DgoVy/BQSC1Kt5WGXbOl45FXDxG2ckQADp2BJ/KARZeWdUukKqQSZh1ERlbntVN
ZhjSmAIWOfDAO4RnVQvpkgQIoV9nIAJs61IVB8xqH1/zEgSwhXeDit/74e2EKU/5
mllDbRgzkm+rnJP80K04GByzcRFA8VnE20A+UQMJrL5Q5pK7ssTflS1RMUukfI24
5ztZQkwxcQnU7qCH/Qx4TEx9AoahhySQFM8DN9mNMd0LjjLWT9htBTQz2pyld4Vd
1KcQhS47M05wMJnaJSplSGROnP9Ns7x1HdEBE0PKR/JloHflg0vihceZIQvnuEqh
oYYPi3tN3rs=
=+Z48
-----END PGP SIGNATURE-----

--DfnuYBTqzt7sVGu3--
