Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38059 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732298AbeGLW3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 18:29:05 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fdjty-0007k5-8L
        for linux-kbuild@vger.kernel.org; Thu, 12 Jul 2018 23:17:30 +0100
Date: Thu, 12 Jul 2018 23:17:30 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180712221730.GK14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pN9MePJoZbRKbUk1"
Content-Disposition: inline
In-Reply-To: <20180712221619.GH14131@decadent.org.uk>
Subject: [RFC PATCH 3/3] kbuild: In quiet mode, print the full command line
 if it fails
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--pN9MePJoZbRKbUk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In the $(run-cmd) macro, add a trap on EXIT that prints the
full command line.  Remove the trap after running the command(s)
successfully.

(A more straightforward approach would be to use "if" or "||" to test
for failure, but that doesn't work.  Some command lines given to
$(run-cmd) have multiple commands separated by semi-colons, and the
caller must run "set -e" to enable exit-on-error.  Testing the result
of such a command line, even if it is probably grouped and run in a
sub-shell, inhibits exit-on-error and would cause some errors to be
ignored.)

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/Kbuild.include | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8778ae4a3476..c2525aaa36ac 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -224,7 +224,10 @@ flags =3D $(foreach o,$($(1)),$(if $(filter -I%,$(o)),=
$(call addtree,$(o)),$(o)))
 echo-cmd =3D $(if $($(quiet)cmd_$(1)),\
 	echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
=20
-run-cmd =3D $(echo-cmd) $(cmd_$(1))
+trap-cmd-failed =3D trap 'test $$? =3D 0 || echo Failed command: '\''$(cal=
l escsq,$(call escsq,$(cmd_$(1))))'\' EXIT
+untrap-cmd-failed =3D trap - EXIT
+
+run-cmd =3D $(echo-cmd) $(if $(cmd_$(1)), $(if $(quiet), $(trap-cmd-failed=
); $(cmd_$(1)); $(untrap-cmd-failed), $(cmd_$(1))))
=20
 # printing commands
 cmd =3D @$(run-cmd)

--pN9MePJoZbRKbUk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW0fTeee/yOyVhhEJAQrHxg//WZenecExjikTbolOgG7PmRdDO59AdSTC
ifkQeeKSUuOuqWI7o/hvD1CsqfG4FoKTX3mx43jdkl+eo1mgckfQrLXu2ur9T0D2
9mSBdY47LswjBlr4AvO2x2Bb1pQczsGdIH5kk6hivTEpVeBpeLwn4EfKVaMa+lBE
1XFVnQZXjae/Iu8sCKc2p9A7h6li8/kXFdWd1mrP8KE6Ff67lwzttBQCgsSQMT8x
Trwet4agPnvZaDRd6yajy1oSfwCobGIIh58abUuOGzT26XthAwtPZ0XkemVHm7cy
QReUfWG+M7K4Rd9b0XMh+fW2xXBQkjVx9crKXrTlpNAcLdOCDKg4hjnMcyX9JlbA
XKL1r34AqjK8sa3cG/XHFPNj6mslJgO+6ziVpMNPLdyC78q8qaO/78aE4DZhBcX/
wo17uH7fkQt33B8tssBgdl6flnFGCKYwcXtQGdYbmZxQBOBeLXsd0H7SNaozL/PX
CXcDwh4PnpeTFNxJVBgqiN5YvbYuwDCjlWqQYvNWAWP5bDJDzsgnIKKaEXhy0h3D
S6qboCHUpM3wLoGwBi25Q6TeNv7bEVctJ2cvmrZsmpv8zwZlsY1gG8bF6fu+5IgJ
kZkzEdgSY4R8/AtvV6kRkI0QGY1PoNER0FMvY8V7xMMXbqkiQG4TJI7ULeb83Wyb
SX2b7luTnws=
=1AI0
-----END PGP SIGNATURE-----

--pN9MePJoZbRKbUk1--
