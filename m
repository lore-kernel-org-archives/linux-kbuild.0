Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59875 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729103AbeGZLjF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:39:05 -0400
Date: Thu, 26 Jul 2018 11:22:54 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102253.GF14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4fo3mGi7Q6pk/+I3"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 12/12] builddeb: Add automatic support for sh{3,4}{,eb}
 architectures
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--4fo3mGi7Q6pk/+I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Different generations of the SH architecture are not very compatible,
so there are/were separate Debian ports for SH3 and SH4.

Move the fallback out of the "case" statement, so that it will also be
used in case we find some SH architecture version without a known
mapping.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 3ef2fd0c5086..663a7f343b42 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -63,7 +63,15 @@ set_debarch() {
 		;;
 	openrisc)
 		debarch=3Dor1k ;;
-	*)
+	sh)
+		if is_enabled CPU_SH3; then
+			debarch=3Dsh3$(if_enabled_echo CPU_BIG_ENDIAN eb)
+		elif is_enabled CPU_SH4; then
+			debarch=3Dsh4$(if_enabled_echo CPU_BIG_ENDIAN eb)
+		fi
+		;;
+	esac
+	if [ -z "$debarch" ]; then
 		debarch=3D$(dpkg-architecture -qDEB_HOST_ARCH)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
@@ -73,8 +81,7 @@ set_debarch() {
 		echo "Falling back to the current host architecture ($debarch)." >&2
 		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
 		echo "" >&2
-		;;
-	esac
+	fi
 }
=20
 # Some variables and settings used throughout the script

--4fo3mGi7Q6pk/+I3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg/ee/yOyVhhEJAQonAQ//bsrHU+XmY5IdqwGVgHW5Dz72alVj3848
WgqNsbyzTqOHW3e9TLIj9jQ6rX33b/iSFHFcjfhErWiXmvWC66r18CyXnHiyMgs8
cYBlrk6Pf5Uj4daPZEngrK4UlSdPaLdzONq+H13+3xxumiw65dP9z63deVAWGICh
amaBRw27RCmWj5H9uMypDjqRQDcchKexeTZuKvHwSVDPJ+7gialtGxuxXht3MzfV
mD1C8I8cIwGJbccCM5ktDzQG2nLovAV30REyKXYqBlJY7n7AQT8CbJ/9ievYRZZ9
gAoHhxF8PVeoG36ApZgdwYdwEmOD+XMg2U0d78+lDFXvJr0e/fTsMn9ia+gM+OnO
Bg16iq2rNemwF1ApP/ayGOAcNgvtqyzAWGojIkkaZyZqy+TZey0624ayWz2V21EI
B8UBQ/P0lIWZNcn9hmVh+HRi2wLxZi89IA2ZrC5el2eiBO1HF4d5/j3vPUhqswro
8RwtGKQWXh1OjPLTSQAQkJCgIdL5JvoCs0VtKqFCrOk8HWwRcnjfaVU8dhGAJhQH
CCWlAZ8pAol1EkqyUG0mqW3Nd4TJivEZq4i+YFlhOck5yauzHGkQVMT9H3Rb8vSF
iO/2XbcFRe7hbWxvDcyZd67sQqtv9oTOMngS9rOcGaINgRWcqf86zN513ehxDhnO
bowhm4v88og=
=82cM
-----END PGP SIGNATURE-----

--4fo3mGi7Q6pk/+I3--
