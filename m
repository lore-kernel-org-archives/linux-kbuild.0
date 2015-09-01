Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55949 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753631AbbIAWrk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 18:47:40 -0400
Message-ID: <1441147632.9215.42.camel@decadent.org.uk>
Subject: [PATCH 0/2] More reproducible document builds
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 01 Sep 2015 23:47:12 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uJb/jfo+rIEjLYNkeU3B"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?ISO-8859-1?Q?J=E9r=E9my?= Bobbio <lunar@debian.org>, reproducible-builds@lists.alioth.debian.org, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>


--=-uJb/jfo+rIEjLYNkeU3B
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
Linux 4.2 is fully reproducible:
https://reproducible.debian.net/rb-pkg/experimental/amd64/linux.html

Ben.

Ben Hutchings (2):
  Documentation: Avoid creating man pages in source tree
  DocBook: Use a fixed encoding for output

 Documentation/DocBook/Makefile | 6 ++++++
 Makefile                       | 2 +-
 scripts/Makefile               | 7 +++++--
 scripts/check-lc_ctype.c       | 6 ++++++
 scripts/kernel-doc             | 9 +++++----
 5 files changed, 23 insertions(+), 7 deletions(-)
 create mode 100644 scripts/check-lc_ctype.c

--=20
Ben Hutchings
The first rule of tautology club is the first rule of tautology club.


--=-uJb/jfo+rIEjLYNkeU3B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVeYq8Oe/yOyVhhEJAQqpzRAAyrVXydZqnnV1cMC9vLWVHrB8Sh4SsmkC
vEpSQ9LH6TzeUYicqalEKVtGuK37W8joS3TBBiKKGPHluqKljGoMK0OLOg5R9oP8
kz4aPujSuAh+tkNH2Wvr68foX/a/XXNW6/TD9TYSb4Ws8RTXsCwrFsVXc6NemEQy
+6C7RCdufawPAx/J3c0oZYjPL6ATCo7Fn/RybPSw9B7to0DX/ekdZOvxYVnssoI1
5JlEPc+b74RQzdgGVCpXSm+G+xQdQW5FWxG4GnjVb7V+dVNmigVVJteFIXeiJnSU
Bt3tVzW/MZMHBZ+lHVzRHdgp3fabpUtdNckmgnZRRJ2tH6s7FYVd69ZlRLLQDXpv
pMidTZS7Qq4wiJLfIlxhiPkjoSou276Zv6sAXEuafyQPVmuPz8HyxsrREmdH9zcv
SQUtgYRNpveFB+l5TgpaJv1JqkitlBcPu8d8aKNL8nMEbqD5G2gGslhaesVm7MND
7Z26i17aQBn88IoyFMdWcCpBp2LKcx00xXKUlIC7gjRdVQjeKkUXVhrTZvWLD56/
uhMgSkaAAWdl9Llcct+0sMyGdgVXeCJvuBZnM0DFEO5nC2UNtMa+sK/0ktAo+TZ6
Yj+TysFnvVD4yn3RALvPak3H6KYcmKp2KBns6pE5iIKWNZ/zaguEvztGQoT+CSua
GyrfgUwQT7I=
=/oQE
-----END PGP SIGNATURE-----

--=-uJb/jfo+rIEjLYNkeU3B--
