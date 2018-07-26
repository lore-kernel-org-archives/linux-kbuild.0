Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59844 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLhU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:37:20 -0400
Date: Thu, 26 Jul 2018 11:21:09 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102109.GY14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wHYmV+hLPeNaasdK"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 05/12] builddeb: Add automatic support for ppc64 and
 powerpcspe architectures
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--wHYmV+hLPeNaasdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We currently label 64-bit big-endian kernel packages as
powerpc (32-bit), mostly because it was officially supported while
ppc64 (64-bit big-endian) was not.  Now neither is officially
supported, so label these packages as ppc64.

Debian also has a powerpcspe (32-bit with SPE) architecture.
Label packages with a suitable configuration as powerpcspe.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ada3c73d1493..0891974f499b 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -35,7 +35,12 @@ set_debarch() {
 	s390*)
 		debarch=s390x ;;
 	ppc*)
-		debarch=$(if_enabled_echo CPU_LITTLE_ENDIAN ppc64el powerpc) ;;
+		if is_enabled 64BIT; then
+			debarch=ppc64$(if_enabled_echo CPU_LITTLE_ENDIAN el)
+		else
+			debarch=powerpc$(if_enabled_echo SPE spe)
+		fi
+		;;
 	parisc*)
 		debarch=hppa ;;
 	mips*)


--wHYmV+hLPeNaasdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mglOe/yOyVhhEJAQrYBQ//fhLvdxPP+Al453zEZbQZ9BFXWWNty1Pq
abUrpMa9mdWEvGKoOY44jxOo9bD8zvhb4qrcYpXvXfUq3KMruff8LN0TkBtcYC2i
wclXMdYge+NaorZEkMY1LeKad+RgpJwAOk9vDfMter96a0Q1m2X9VzNSmnmuLSLF
fDP16MYNQnC8Yb/j/UDmsXhgiZVpfqWzLTGlUF8iqgSyygv9kd/zdMCujNYwZZEt
7leywU/Vx5/hycDOnszKTNo/XNu8pLiKvEHK7g8r3fyToBrA5wcXIGsDvW+4n9vt
8LIM5wSHLU5S5RaU8kat1gYRFcB/6SI3DyPhZrdvhbVCQTi2IULh9fiySA3/kvHg
7mMz51BLpfFKXrgYBSWCXo3A2o7DGQ+ha0ELPsWXcJOZoB5fbdVKtKwNvKLcQ7SV
HW51rC2TFN/B2hX3eVztJak0kkgSuDWzVUImYdFhLdWwR3fIHhzU8DzlEiYQ2HkY
Tb4WAfwgWJdCaGZlQ15YyGeSBt5ruh2Jk8yCtSHzQNThhb5dUWZoynP5bOIPGGL6
2SsDPFp7nbVZo/OpZV52+1oJHaAs+MN8m2kFXMEd6DvhPAP9j9b5fEoqYSofPdQ3
0mMRbLTTYfCfCdbgquV0QhjAzcIFZW1UBDzO/iZvkXMnMqlVhuMF8fuANMKe6kHn
hnNf2AolYeI=
=UgNs
-----END PGP SIGNATURE-----

--wHYmV+hLPeNaasdK--
