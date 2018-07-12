Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38061 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732591AbeGLW3Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 18:29:25 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fdjuH-0007kS-PZ
        for linux-kbuild@vger.kernel.org; Thu, 12 Jul 2018 23:17:49 +0100
Date: Thu, 12 Jul 2018 23:17:49 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180712221749.GL14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WuT04sMzYDXq8et0"
Content-Disposition: inline
In-Reply-To: <20180712221619.GH14131@decadent.org.uk>
Subject: [RFC PATCH 1/3] kbuild: Move final argument to modpost into
 $(cmd_modpost)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--WuT04sMzYDXq8et0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes to the definition of $(cmd) will require that it
is given a complete command line, and no additional arguments can be
appended..

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index df4174405feb..4e56df933b79 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -85,11 +85,11 @@ MODPOST_OPT=3D$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
=20
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost =3D MODPOST $(words $(filter-out vmlinux FORCE, $^)) mod=
ules
-      cmd_modpost =3D $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MO=
DPOST_OPT) -s -T -
+      cmd_modpost =3D $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MO=
DPOST_OPT) -s -T - $(wildcard vmlinux)
=20
 PHONY +=3D __modpost
 __modpost: $(modules:.ko=3D.o) FORCE
-	$(call cmd,modpost) $(wildcard vmlinux)
+	$(call cmd,modpost)
=20
 quiet_cmd_kernel-mod =3D MODPOST $@
       cmd_kernel-mod =3D $(modpost) $@


--WuT04sMzYDXq8et0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW0fTjee/yOyVhhEJAQr1JxAAxtZ7ohg6zqmGyqjTlaUxfYqndaGIdqYl
Qb+hwxguVFFlpuCTU0MsISedVboeNBtYclYGK/sR/Dfg3T6EASbyTofkV/4Wky6A
PPYx9FvyRhCT+FcgIsJIMWgmFZa+LAiCqIpx32M6VU65oWSZOU4b2c/B0WZIOm9l
Q9afu38v4SRPCcSB/4d2gckUT1/Ys9OLbiErQzuI3MAqDoHgo1yEhLXXRjDa+2MM
Nk1256j2zFU3YQNHe8vtoYeFQcYBGVY7VqOt7QZH3w7xDhg+3YBkZ4Js0q75HWGR
wnGX9F26/B34FKlDMI8Mm9OZEAZXAixX/7tnujwcL3vWAvFNS/z2DSpHNDNSd1Qf
FcPV+5ccGkYyP9wEvYN3xPILPe3MB09Rdb7qZD4Cy4bHvyC20xjLajIJI8rR9eo8
UiFA2K845BqCp757QBjd8prRzT9ss444DRUMWFEzo2q4mvd+of04SHHnY4qoyOSE
99gXJexs4Lx/xXeJ95B4v2TgmpFDHu4/R8iuMaPhr2IIT9bLi/kz4JjQJt1ui5ol
B5OLxqTr0TBiRj9iBWUQ0cc8ThgomfwH4QPQ7R2H/RfS/MBbNxkDsXF28XmNr2FW
V+N7CKiTkDfLOizZP1u/yd6AmISKnubUlVyDn7qcjsiUtplYKxfhGGGZV+F2mb2R
fun63lAIguE=
=pnyA
-----END PGP SIGNATURE-----

--WuT04sMzYDXq8et0--
