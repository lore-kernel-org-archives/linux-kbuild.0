Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59859 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729155AbeGZLij (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:38:39 -0400
Date: Thu, 26 Jul 2018 11:22:27 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102227.GB14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YV7D9JCVdz8QpFLW"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 08/12] builddeb: Add automatic support for sparc64
 architecture
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--YV7D9JCVdz8QpFLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We currently label 64-bit kernel packages as sparc (32-bit), mostly
because it was officially supported while sparc64 was not.  Now
neither is officially supported, so label these packages as sparc64.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 595482923844..83179a4c6fda 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -31,7 +31,7 @@ set_debarch() {
 	x86_64)
 		debarch=amd64 ;;
 	sparc*)
-		debarch=sparc ;;
+		debarch=sparc$(if_enabled_echo 64BIT 64) ;;
 	s390*)
 		debarch=s390x ;;
 	ppc*)


--YV7D9JCVdz8QpFLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg4ue/yOyVhhEJAQrfVQ//Qf+m6G5QmNVfe0FXB6teDTqjrb4j33sl
iLFuRB/+dFGD6hcegklXAfYvhKpF3Mg4p0rTeateP51lCRLT92aAM1YF6YKRCqm1
qE3oyxN4cIQZ0Rm9ecgLvi9au8Yl8ixbsDRbVJLLhR1xQbcx12C+xiqgw76rftnq
4urxOGoK/WvHs+lTR6blSWcPtPv7+aV/YQHsArJDW/AGaBcM4aLHWEVJtZdgOmbY
791MG4cncqBx+Mh0bnfASLGcztppyKXYBVSR66zE+/R9vyrBpbxdeFZ1ececRRuq
RXfdJviSwpmT2pbuG1+Apb6Fe4Z4AB6OczblUU0X6XrKKX5hpqCg1H9yxLrpZo45
p8Pcx6fVA0ssv+cvXfpm5Qk/6+4fVvAR2Tv1GrlwtcadREICnsyKfJD3YB7+kWrD
mua7+Gwx2iHPRA3y3+Ne1N08TLQXQXre+JvA3vUcIAQTznH83b9KB8h4dpy1kklI
yMORT3l1ijyk3GclPIdnENQKs8j6fdXdC+jMaRnPfPCYTAgk6t6Ik9QE/ZPKdyKt
IiYYHljI0hHTRzsKPpF2ex84FU8LtIxLkJObROtbw/2g5h5wlYSIQcuDtfdY3l7G
Ah3+qPBnEUGWnPdHjWiBqkYVlFcCoSoXpnMC9MbejLTJZUN4gMYp1Jdhvh5XRExB
inV+QlPZIaY=
=pxt8
-----END PGP SIGNATURE-----

--YV7D9JCVdz8QpFLW--
