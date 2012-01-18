Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:40623 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751915Ab2ARMNg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jan 2012 07:13:36 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: details on internal kbuild magic
Date: Wed, 18 Jan 2012 07:13:41 -0500
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1379469.oCClb2cNcZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201201180713.41922.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: vapier@gentoo.org

--nextPart1379469.oCClb2cNcZ
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

i've been flipping through the source but haven't made much headway.  the=20
documentation doesn't really cover kbuild internals, so that didn't help. =
=20
hopefully someone here can point me in the right direction.

i'm interested in the exact make mechanics that kbuild utilizes to avoid ma=
ke=20
recursion (`make -C`) but while supporting its own include recursion.

for example, fs/Makefile has lines like:
	obj-y +=3D ramfs/
where is the logic that parses $(obj-y) and knows that it needs to recursiv=
ely=20
include ramfs/Makefile ?

also, how are collisions avoided in variable names ?  for example,=20
kernel/Makefile has lines like:
CFLAGS_REMOVE_irq_work.o =3D -pg
how does kbuild know to apply this to building kernel/irq_work.o and not a=
=20
irq_work.o object in any other dir ?
=2Dmike

--nextPart1379469.oCClb2cNcZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPFrd1AAoJEEFjO5/oN/WBiqYQAIlzPypwevgiaYzjHfPHyf8n
6gkEw2wmjheXpcPylqkGCE+Z7NRPhZqgz9b4uWl1u4dM+G8QF8IeKBlm6EsgbbOm
Wq8p9SuMZZZCSQNwg+nM0ta8bx3KgePUoqwvSTrWpXXn4EkITOHbm5u/cgYqcnpm
e4aah64zXjoYJbeYEEy4r/XQ0qn+ZcX/HVZ92ptPYrEvIX9XAFpXoCWgK8xPo+Ri
JhhZvYDFsKPvlOp4HoMxl15ULPyoezRlJTqW6V5qp2/F3v/kJ1+tBE+PlMlp9Bng
Gg+U0EqSwEd8m7VpeMRbC07mdRVv6i1IZDfIOK7d71huskm/M43Qz2Bmx3YFSUkv
FKE77qFy3QNdSOMjUKK+EUNlsMcFDKZf/y4jbiM/4qoIb/r75yN9NDnIPU93/spM
+F3U4woZDTW/1llq76oAekLr6HL68O0YBeGeFuAgFuNjs8kqkMjJspxroMqzS6wo
joSjg87mOxN6sua9sxY+a/Ubn5gIsADFqEve7tlYSgUnwJZgPxcJEW0J/gTpHjty
LrUDbQJcdBWYopOyKzfesNjGob5l9CNItPvbUAoDKrshNKS8VKgoisVa+lXtbkF3
P4AHSioroGcgkIIvZHGckScuoYB0mpamncadkN8MtkGwE5zhauILylWdnqn/HQXN
Fh+ZY2ZSGuaEQWgNhGlR
=vOqE
-----END PGP SIGNATURE-----

--nextPart1379469.oCClb2cNcZ--
