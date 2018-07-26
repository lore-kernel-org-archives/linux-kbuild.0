Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59818 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLfp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:35:45 -0400
Date: Thu, 26 Jul 2018 11:19:34 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9hshNW4m6zn79FF/"
Content-Disposition: inline
Subject: [PATCH 00/12] Update architecture detection
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--9hshNW4m6zn79FF/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series cleans up the set_debarch function in
scripts/package/mkdebian and adds support for several additional
Debian architectures.

Ben.

Ben Hutchings (12):
  builddeb: Skip architecture detection when KBUILD_DEBARCH is set
  builddeb: Change architecture detection fallback to use
    dpkg-architecture
  builddeb: Drop check for 32-bit s390
  builddeb: Introduce functions to simplify kconfig tests in set_debarch
  builddeb: Add automatic support for ppc64 and powerpcspe architectures
  builddeb: Add automatic support for mips64el architecture
  builddeb: Add automatic support for mips46{,64}{,el} architectures
  builddeb: Add automatic support for sparc64 architecture
  builddeb: Add automatic support for or1k architecture
  builddeb: Add automatic support for m68k architecture
  builddeb: Add automatic support for riscv* architectures
  builddeb: Add automatic support for sh{3,4}{,eb} architectures

 scripts/package/mkdebian | 68 +++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 18 deletions(-)


--9hshNW4m6zn79FF/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mgNue/yOyVhhEJAQrTJhAAudKNUGrjI4wzto9qZIuoMaAdVuphB+7p
XEH9RYxCIphVAaZqaDjtWwOX5tTN4pLPLgJVGQXoWu511yu8FLncpM5/gVr5vNuz
10R7lri1lSbFpHHKazUNOcneAplfmWzOMcGlMHBHkSHF2PTzln2MEVenH8SM4o7I
Nu5aF4LnlNahvwC6W1Aui5+ThGkWcNAXZlX6+2QDaAOp5F/LmVM5/AkDnhPRHdsO
TBxNjF/lWyiUXfbHwMCT7Cv8RTVEBJrvn4euODp4OLVxStuLwfIRE2CfiDuAgLOG
hQAw6zf7DmWh43TYaZ98Q9J91WB5GPILoqPpsd6Nmxn+gBmoVUFmhEAToZdSQbiI
EaMs2wF8jWRRY3d6mcjxxnDsug0XXs1W0KBdQuOWqeyOWvDVh78prH/HjTQ2SDpX
fmD0otYcz+b9hCq02KQtkxY5k3/6ROCcHlCLQA0yxsm47ymzmGKCQoh9WAH+8GCj
Cn2BI2zvmf2nnm8prI7UasdzreNfZWIbCHu29cmxtwiNHmqFCoIM5ZJPk7Au8u0Y
P0KPIapOmYiGbddtS2bqPYeND+NIzMFZf2tc1sEgiZJqJuwdVZu9YlRet7PweLRs
+PIadEc+aya7de1RRrFIKpJEz9l8ZHt0wf0oXguTIvfAp+Idc2upcWYtEUKSGJSo
m7uRFseDh2U=
=UasN
-----END PGP SIGNATURE-----

--9hshNW4m6zn79FF/--
