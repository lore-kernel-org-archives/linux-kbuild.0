Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36164 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753398AbbI1AIP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Sep 2015 20:08:15 -0400
Message-ID: <1443398870.2517.11.camel@decadent.org.uk>
Subject: [PATCH v2 0/2] More reproducible document builds
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 28 Sep 2015 01:07:50 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GqbFESSzrF2fxo2kUMoK"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?ISO-8859-1?Q?J=E9r=E9my?= Bobbio <lunar@debian.org>, reproducible-builds@lists.alioth.debian.org, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>


--=-GqbFESSzrF2fxo2kUMoK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes a couple more reproducibility bugs:

1. The 'mandocs' target always creates dummy man pages in the source
tree.  Aside from their very existence being a nasty hack, and the
wrong-ness of writing to the source tree, they contain a build
timestamp and if we build a package of the source later it won't be
reproducible.  This moves them to the same place as all the other man
pages are built.

(Moving the dummy man pages shouldn't cause a problem for
reproducibility of the man page packages, because the dummies are in
section 1 and not section 9. However the dummies still don't get
cleaned properly.)

2. The current locale affects the encoding of HTML pages.

With these patches (and the previous set) applied, Debian's package of
Linux 4.2 became fully reproducible.

v2: Rebase on 4.3-rc3.
    Add an explanatory comment to check-lc_type.c.

Ben.

Ben Hutchings (2):
  Documentation: Avoid creating man pages in source tree
  DocBook: Use a fixed encoding for output

 Documentation/DocBook/Makefile |  6 ++++++
 Makefile                       |  2 +-
 scripts/Makefile               |  7 +++++--
 scripts/check-lc_ctype.c       | 11 +++++++++++
 scripts/kernel-doc             |  9 +++++----
 5 files changed, 28 insertions(+), 7 deletions(-)
 create mode 100644 scripts/check-lc_ctype.c

--=20
Ben Hutchings
All extremists should be taken out and shot.

--=-GqbFESSzrF2fxo2kUMoK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVgiE1ue/yOyVhhEJAQrEkRAAsItExDz5NtnwUlcNkzlSqEvHAsUwFPWs
1LGa0puLaGsj9zM8ORhxrmod5mdDGJuWMIanRWmZWIXI69Xwrt6C0JTTxfSLABpq
sIODg3f5+TeqjrW9rFTHD51+Sb0vl0SANEkXyMkgEx3wrNBOM/ND7u8pxCFENOFg
B/tGsKlze/nnUaG2x7h3OtsquTd96a+4gjh+3MUdnaI9RGudjOycQ/PEKKvdivkQ
RJ5J5p/pOl1kIAMXpelxyfB9GSH2Wu7dMWl2Zn9s4Me+VTQqp1QfEPcFGy15cT+K
EKnpgm0Vm7knMODlBHabxTAuZip5zO5MG8heCGy4lJofUfFRgTjsAWnh1Pyc63sV
7yny4tqMZm6helFLDiYnr4nck8EVH93qbbHfQhHOytNylh+EM3plNmS0fbJ2CJ6Y
yqF0DZhkkorSM38bgmZiDRQZKDyWkfyvTGIij2fNrTfWjg8kqRQ9GmkMOe1CyAaV
sK/rBaYa8rgleIm4sugqzW3YDCEChUfOayDIO1R0k5Kb0h5FhTckuL5DYOCcfHu9
qtMqExYE7G9YIMWb5UMVqi/vrMdWVoYTvLqdvbELwg45TyIES9gzSDfG10FoWI4v
L4UR9stT9Ciqb1xBe0utA7kX0MlJnYhh2m9lZ9fyTJbKVviTGPlh8bDuFzhCjAYl
WTCZYHO+Hqg=
=517f
-----END PGP SIGNATURE-----

--=-GqbFESSzrF2fxo2kUMoK--
