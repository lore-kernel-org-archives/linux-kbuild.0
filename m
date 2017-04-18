Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:44686 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753714AbdDRBAP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Apr 2017 21:00:15 -0400
Date: Tue, 18 Apr 2017 02:00:11 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20170418010011.GC4152@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qUGjz7OmxI7iFH2Z"
Content-Disposition: inline
Subject: [PATCH] kbuild: Do not use hyphen in exported variable name
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--qUGjz7OmxI7iFH2Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This definition in Makefile.dtbinst:

    export dtbinst-root ?=3D $(obj)

should define and export dtbinst-root when handling the root dts
directory, and do nothing in the subdirectories.  However, the
variable does not reliably get exported to the environment, perhaps
because its name contains a hyphen.

Rename the variable to dtbinst_root.

References: https://bugs.debian.org/833561
Fixes: 323a028d39cdi ("dts, kbuild: Implement support for dtb vendor subdir=
s")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
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
@@ -22,7 +22,7 @@ include $(src)/Makefile
=20
 PHONY +=3D __dtbs_install_prep
 __dtbs_install_prep:
-ifeq ("$(dtbinst-root)", "$(obj)")
+ifeq ("$(dtbinst_root)", "$(obj)")
 	$(Q)mkdir -p $(INSTALL_DTBS_PATH)
 endif
=20
@@ -33,7 +33,7 @@ dtbinst-dirs	:=3D $(dts-dirs)
 quiet_cmd_dtb_install =3D	INSTALL $<
       cmd_dtb_install =3D	mkdir -p $(2); cp $< $(2)
=20
-install-dir =3D $(patsubst $(dtbinst-root)%,$(INSTALL_DTBS_PATH)%,$(obj))
+install-dir =3D $(patsubst $(dtbinst_root)%,$(INSTALL_DTBS_PATH)%,$(obj))
=20
 $(dtbinst-files) $(dtbinst-dirs): | __dtbs_install_prep
=20

--qUGjz7OmxI7iFH2Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWPVlG+e/yOyVhhEJAQrZ3A//XGVg99cJAZeHD3CKuWmo47IXodn453eG
UhDSC9CWpkrfJ63n1wjwqrHxB5LuPhHRh4rsFhnomTgPCNwkMWiRGCIuIwDQyIXv
ZpImCawmeVFRcgdB/Tbx+xNjziGD+9BAQQW7X5TFiIG/O2wquFzidarncJ1OlUXT
gC+hjRtlW3am7n6LcuxGjxu715LmWgEfb/W3yiGplATKKyG4fzu1JaYvwRHP6npO
GA1KD/4KmnS7izlGsT5mXJhSl3h5zAPVhka0zwHMzZjV3sE1xTOF1FX4U4AoUuJ+
WPel4WVO1pCfynymkJW2S0RoI6IxMiQa8iCXI01/cgbb3lzeCCiORtWJ99GXC7Ds
qRjPa4Eg4Ocvm70s4OGp+LlWgLrQRb7YnTkgdVg2x3LbIBTglo9ZwJX3nrbJIMZj
Fn4K5A4aVnU8QhJZJfV8w1k+lNeF5jXPfapyxvUrYOqhTh8qMG/Az2aq7fQjQEuj
RWjThjSoC4HGJ0gnbeqIBrMrA1SpzfzKlBlGJSEGtoWa9LEm598eO/3msZkwtmWb
dkdl4XmDZefQV5qVYnhsMSUPo+lQw+9BSUo/e5dr+EM1+1un/Sjb3qsf9uzFOMnc
Wj0g5vNTemiefQ9Yf1I4J//W3iPSn5OvaWrUlwntyV16coX+OS2XOd2NoU0vyWok
cy06Q2pc75I=
=m+P4
-----END PGP SIGNATURE-----

--qUGjz7OmxI7iFH2Z--
