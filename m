Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36910 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935717AbeCBHiI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Mar 2018 02:38:08 -0500
Date: Thu, 1 Mar 2018 21:38:03 -1000
From: Joey Pabalinas <joeypabalinas@gmail.com>
Subject: [PATCH] scripts/kconfig: replace single character strcat() appends
Message-ID: <20180302073803.ocrbfxx6xxxtku2z@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="edy6nsnmyukhqzdb"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel@vger.kernel.org, Joey Pabalinas <joeypabalinas@gmail.com>


--edy6nsnmyukhqzdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Convert strcat() calls which only append single characters
to the end of res into simpler (and most likely cheaper)
single assignment statements.

Signed-off-by: Joey Pabalinas <joeypabalinas@gmail.com>

 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index cca9663be5ddd91870..67600f48660f2ac142 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -910,8 +910,7 @@ char *sym_expand_string_value(const char *in)
 	 * freed, so make sure to always allocate a new string
 	 */
 	reslen =3D strlen(in) + 1;
-	res =3D xmalloc(reslen);
-	res[0] =3D '\0';
+	res =3D xcalloc(1, reslen);
=20
 	while ((src =3D strchr(in, '$'))) {
 		char *p, name[SYMBOL_MAXLENGTH];
@@ -951,7 +950,7 @@ const char *sym_escape_string_value(const char *in)
 {
 	const char *p;
 	size_t reslen;
-	char *res;
+	char *res, *end;
 	size_t l;
=20
 	reslen =3D strlen(in) + strlen("\"\"") + 1;
@@ -968,25 +967,25 @@ const char *sym_escape_string_value(const char *in)
 		p++;
 	}
=20
-	res =3D xmalloc(reslen);
-	res[0] =3D '\0';
-
-	strcat(res, "\"");
+	res =3D xcalloc(1, reslen);
+	end =3D res;
+	*end++ =3D '\"';
=20
 	p =3D in;
 	for (;;) {
 		l =3D strcspn(p, "\"\\");
 		strncat(res, p, l);
 		p +=3D l;
+		end +=3D l;
=20
 		if (p[0] =3D=3D '\0')
 			break;
=20
-		strcat(res, "\\");
-		strncat(res, p++, 1);
+		*end++ =3D '\\';
+		*end++ =3D *p++;
 	}
+	*end =3D '\"';
=20
-	strcat(res, "\"");
 	return res;
 }
=20
--=20
2.16.2

--edy6nsnmyukhqzdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEKlZXrihdNOcUPZTNruvLfWhyVBkFAlqY/1sACgkQruvLfWhy
VBme9w/+ILgo47u16XZKUkmGNMqbGNcXzJ9pKKpG2kD0ePZQAJzyLEIJAN4B0B9C
ZmlOoucgFaXQxTjZ1Psi3xTZLA80fxaK0PiRtuGKisEC3JURUtc+3/1PukvSnrH/
Deb84VCKRh/gvr8lcvJI+T+/3W41IICIgH3qk+bP2T6KcYoPUwWFj/oJJd0/FF7+
DNdRl2Inqy2PJkxqKQ9q3Tybp/0UJyQacnPo4kCz2XjDxVTCgos5h4OiIZrX+uQ0
a0hktxTpbbKgAKQjtcwy1FfUr1SZ4Grfeu9/t1cvq9TS6MnXPtg2R04YKTD7eCBb
GXg3opzzIsfUBag5W694YEHexx/Ko1WfTOeCLiTRhe15DRKv+x2ulAQQA4ESj7kz
VytIbX45iN7vA/xvbQIwfsrY4i7IRiDMf5ZnS0mITrLjghQ84kqxzzPCHHc/B30l
C+SYLvDt9Uya2N3pHziLAoBgfU/3daXKGF+92eEr8jMTaObVlROhXoG8tcsfRzBp
bAwoC7V6icbejoycbx+BVJUMLxsf7/idU7j/qGd1V5Q91Ue+Vv2zQdHNIIMRqheG
r6DLpchfcu+yZ9Zr8hA8YZipAhnz2adZG/Te2zOSE/2SBxbjUqRxllEDRcwQ4Hd/
U2BH2oXkVX1h0GwQ+PQtThqmn22PKVJUXQaaueZ0QIjx2vASXOs=
=bmfQ
-----END PGP SIGNATURE-----

--edy6nsnmyukhqzdb--
