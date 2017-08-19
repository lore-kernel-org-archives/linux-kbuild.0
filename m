Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37034 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751663AbdHSUO0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 16:14:26 -0400
Message-ID: <1503173655.3688.35.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 19 Aug 2017 21:14:15 +0100
In-Reply-To: <CAK7LNAQKFRLs9wvg7qdFM5245jqv-6qUhRgF-61qiO_PE-J6kQ@mail.gmail.com>
References: <20170418010011.GC4152@decadent.org.uk>
         <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
         <1492932183.31767.64.camel@decadent.org.uk>
         <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
         <1493563778.2564.11.camel@decadent.org.uk>
         <1503105231.3688.33.camel@decadent.org.uk>
         <CAK7LNAQKFRLs9wvg7qdFM5245jqv-6qUhRgF-61qiO_PE-J6kQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-NY40Lf5ER5KRIdqphJn6"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-NY40Lf5ER5KRIdqphJn6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-08-20 at 02:37 +0900, Masahiro Yamada wrote:
[...]
> I did "grep SHELL" in kernel sources, but I could not
> find suspicious line.
>=20
>=20
> Is there anyone that sets SHELL
> in debian specific patches?

No, there isn't.  But I finally worked out the trigger conditions:

1. Source directory name includes a shell special character.  This is
true in Debian whenever we build a release candidate, because the
source directory is named after the package version, and we use ~ to
represent a pre-release version (e.g. 4.13~rc5 sorts before 4.13).

2. Object directory is outside the source directory, or at least two
levels below it (see the definition of srctree in the top level
Makefile).  This is always true in Debian package builds.

Shell comamnds to reproduce this:

rsync --archive --exclude /.git/ . /tmp/linux~/
cd /tmp/linux~
make mrproper
make O=3Done/two ARCH=3Darm64 defconfig
make -C one/two ARCH=3Darm64 dtbs
make -C one/two ARCH=3Darm64 INSTALL_DTBS_PATH=3Ddtbs~ dtbs_install

Ben.

--=20
Ben Hutchings
The generation of random numbers is too important to be left to chance.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Robert Coveyou

--=-NY40Lf5ER5KRIdqphJn6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlmYnBcACgkQ57/I7JWG
EQl3yBAAkj7KsQQ0d/xfr+UDgd6uPFDAGjYtMnpJT7vYPsVp7LOOkJ2A9cygpmvX
zp/uL2+3pee3azC3ErPNYYtPlORGEUXFR63oam3O4R+acppFH4CrxPbXhzjjkBi2
oGR2ZyxFpKfzlqL5Q0OQH4YTSE4EU8yooorvpczT9f4gn7NQAqZHV6zuea7eSjaX
Hv9CPG+Z+40aHIOXPyJrdpYybHlfxCEU1rgCx0HRrV/S8uFgpeT6SqpLydCln3S2
aBeVWr16LQ4P4CGVovwB1l9+RFbkmtx8fVyPKiFdE0qyzVyMViBViH8SIY7qrXRh
Ea+guu/npi2/SJAwxq86RlkcGKoc4EASnzH9LuKN9WQRBHF0SOLuh4H9Jp/hQeH8
YyUvdVqAm1JyoEY3ERJat40iqNZTj//sQ7yyAFhSY0iFdewRBvfyt+U6sPeZNTdK
PZ4MW+T3dfQcctcabYwM2pZLOgK+3faemJg0cJ2ahOvopFjgrX5tmKbl5W4fNlj6
W81qPmQMV+sU7zs0EGhVqZ7KLJ1a4wEb6ipDWdVBBDnLDpW7usKjv3UajnD9RJ2Q
V5KN4O1p3ZVYAzKw680xkjzpxK7XAcQF5dR9ckf7jbvkRBLTm3XCEY76ucUmUeDw
hCen9+yb1kg3puyhQ3sGgBoRoHfUZU1F14IrKbKcaWwPUoQMM1o=
=zDIv
-----END PGP SIGNATURE-----

--=-NY40Lf5ER5KRIdqphJn6--
