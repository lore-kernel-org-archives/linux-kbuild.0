Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59848 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLh2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:37:28 -0400
Date: Thu, 26 Jul 2018 11:21:16 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102116.GZ14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SqEPCaGsKgsesFh5"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 06/12] builddeb: Add automatic support for mips64el
 architecture
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--SqEPCaGsKgsesFh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We currently label 64-bit little-endian kernel packages as
mipsel (32-bit little-endian), mostly it was officially supported
while mips64el (64-bit little-endian) was not.  Now both are
officially supported, so label these packages as mips64el.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 0891974f499b..350724cdc5af 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -44,7 +44,12 @@ set_debarch() {
 	parisc*)
 		debarch=hppa ;;
 	mips*)
-		debarch=mips$(if_enabled_echo CPU_LITTLE_ENDIAN el) ;;
+		if is_enabled CPU_LITTLE_ENDIAN; then
+			debarch=mips$(if_enabled_echo 64BIT 64)el
+		else
+			debarch=mips
+		fi
+		;;
 	aarch64|arm64)
 		debarch=arm64 ;;
 	arm*)


--SqEPCaGsKgsesFh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mgnOe/yOyVhhEJAQq+YBAAorRukKyqkXZD7Uj00mjfwiSXGc/KL+Jt
D90mXlvxeynPHrk80I3eo2OK0v8EMNHCePWHwzZJ78e0PuXZaynZ1egIyYiUYI83
5ue16xXFk5ygF144MIovW2DMhDMI0dhEPTSDH9/a/2h5x60wHR9d40PELi2WYrFB
VODWZiiS1rBf21uuJ+BFYytcYLT+AnNJi+3DLldxNmZsGBhNeJjuB5roO6ZvimLr
JVBCgRRQmLv8sL6a9ul8MYfz3NUZPA/fGldFj76CurqfVgfyIO25oXU9Dc43gqpY
R0dLEPc6CwyQGAABz8/r2uwCfTd3guzzlOwqMrjMUQVLQ4lTbwjzxHvYkDeYQrtt
6r2gVvpmM3v517jzGrU7V1jySZScVk+gcW6qP6GCfulJBKJe0sJ0hPp/z2S5WkxB
9fJK0xVHY9ZzR7HP7k0yiCzVWyOwqfBLEpfM5OVz1Y+G/r7kDYHOFtaeFFf1u//4
/CtWaU1kl8OmByI4mXvpSRnkzO89hDpPshttRAQhPC06TEgwwOLPBTpPSdI4dLdJ
L6OXqFL+Rv+iP3KPm6+Nzx2EfSMnSTi4OUdI/3YplON1OpETYNEK4TlROzXbc4qf
ae/mgf7pJztkHhoxyntWcuPkyCf8KI3zbz2xGKicJbjCYUbCtKO4dumyLgHMdDHV
+L/Mn8NzyZk=
=EiZh
-----END PGP SIGNATURE-----

--SqEPCaGsKgsesFh5--
