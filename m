Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59862 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLiq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:38:46 -0400
Date: Thu, 26 Jul 2018 11:22:34 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102234.GC14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nG7dHWd/DOCuxGWF"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 09/12] builddeb: Add automatic support for or1k architecture
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--nG7dHWd/DOCuxGWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 83179a4c6fda..fb0d3056f3e2 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -61,6 +61,8 @@ set_debarch() {
 			debarch=arm
 		fi
 		;;
+	openrisc)
+		debarch=or1k ;;
 	*)
 		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
 		echo "" >&2


--nG7dHWd/DOCuxGWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg6ue/yOyVhhEJAQrCkw/+Lk5ggEr691w3vSyKZwfQsQoUYO6UgtyL
jc+YmTFCFLXwu/fgoeTsD9AClWCoE49bAVVQpD6N2k/WQLebAKqRT/W4ybIfkk77
dkRjV7La1NBaoBb8dTl7uhKDDeVdSqRVX8lnveZyUWLgxm4ZDqKEu0YgoK2ah06z
jpgV98t8RPIYB3Cmfbt7Blu8AxkvN25yRFIxLuoGLwAcX/8P9Lzzlp8D0rvWR/GA
m05SUGRA3oMplhVHr5D3uSrWWc87v1FiNbms2X7fzo7Rs01VH8Zyeax1EJpElR2/
O9/eLFHaxI5zlu6TTLlDyoZi5t4M5thVt9nFCevhpvR9Ucs45tmptqV7bImfyydQ
z6ktqhWRSXll/ZO6qTQKWqMl+LVp6LKWYto6hUDrbKylAJWExiVO1ArGYLyaHpmt
XPeAujMri5A5ZsaRNoxMdY6/2T9iXkET6fHAwx1Fi5c9vWnF+VWYZ0vYnZQYtts+
2PVR0FKmeFwXNVcgPGQ1S47TcH+5Nm5bei7waZkbb12QKG34vpvZ+ftbnX8WBGaL
/7kxW4M4KZWHHehEeieqDYFc7F71h3MwJyzcGYSMCDDAyJt0nDogfimC6njxPxOY
meulaCH/+YlrvD3RA9eojwYCTLVMbL2NcPrA5KbKhxa4xVrB7vpuKcrCSaCjXF1s
T77poZuuoj4=
=mPHC
-----END PGP SIGNATURE-----

--nG7dHWd/DOCuxGWF--
