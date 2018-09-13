Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36889 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727383AbeINAeb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Sep 2018 20:34:31 -0400
Message-ID: <455ac03b7e23c8361b197a62a8f4dcbfde2d1452.camel@decadent.org.uk>
Subject: Re: 4.19-rc3: bindeb-pkg target is failing on ppc64
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 13 Sep 2018 20:23:26 +0100
In-Reply-To: <CALjTZvZFT5Ku+e8CD6mQv5Pbo5TU9cWQfmEnxJ_atRrfaoM94g@mail.gmail.com>
References: <CALjTZvb4hOY_Hew-jEUtpyhkGbmh4Tgb0doPC6EaGtz_rMGt7A@mail.gmail.com>
         <eb1fe15c9ced6950d6a38c901278b8196ae4938d.camel@decadent.org.uk>
         <CALjTZvYcKOycB=XeF-Eqtmq3ADh2be+gfWGiw0jbSgEUo6q8Dw@mail.gmail.com>
         <0dbcdd4d81ed965915ccf2471dd4d5a3d025c93b.camel@decadent.org.uk>
         <CALjTZvZFT5Ku+e8CD6mQv5Pbo5TU9cWQfmEnxJ_atRrfaoM94g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-DMIUeLyXeFMGsNn3e7S5"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--=-DMIUeLyXeFMGsNn3e7S5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-13 at 19:32 +0100, Rui Salvaterra wrote:
> On Thu, 13 Sep 2018 at 16:49, Ben Hutchings <ben@decadent.org.uk> wrote:
> >=20
> > Like I said, please send the error messages; we're not going to guess.
> >=20
> > Ben.
> >=20
> > --
> > Ben Hutchings
> > Computers are not intelligent.  They only think they are.
>=20
> I'm an idiot. Turns out it's something completely unrelated. Here's
> the relevant part of the build failure:
>=20
> [snip]
>=20
> In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:23=
3,
>                  from arch/powerpc/boot/decompress.c:42:
> arch/powerpc/boot/../../../lib/xz/xz_crc32.c:18:10: fatal error:
> linux/crc32poly.h: No such file or directory
>  #include <linux/crc32poly.h>
>           ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[4]: *** [arch/powerpc/boot/Makefile:217:
> arch/powerpc/boot/decompress.o] Error 1
> make[3]: *** [arch/powerpc/Makefile:288: zImage] Error 2
>=20
> [snip]
>=20
> It's the xz kernel compression option which is failing, gzip builds
> fine (but it's still pointless, powerpc kernels seem to be always
> installed uncompressed). Broken .config attached, if relevant.
>=20
> Sorry for the misdirection.

Oh right, I totally forgot about that breakage.  This is fixed by <
https://patchwork.ozlabs.org/patch/963258/>.

Ben.

--=20
Ben Hutchings
Computers are not intelligent.	They only think they are.


--=-DMIUeLyXeFMGsNn3e7S5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAluauS4ACgkQ57/I7JWG
EQlnSA//edXE/okED4iMMMhvZ5fLBd5USlSZE5s9QXYTswfyIp4WyzD62F+78cAv
M9IlP4tlPmO4ZUlXf+oAFLpidU+Q39heF6egkdYJ1dAQqPdkm6T3tPshXeqPWQBS
Psvp1t4jLp16JoHeQFBRZAVvbZFCAVVZ5VbmMItQ+pozAZ4hZMM+d5Czn6CZcwML
opXcvbeo0y8NaCdLb7DBjbEMOy0B3NbhxBgxKoiRCeQKkLdHtRsnUkHVzrjiIV2k
vwYVDOxfoG6yXhQmaGASWPtWVgZU60foBmjBXEerpdo4HicjuOzN9EWNCwrKMPeI
m7z38yYJZDNd5NxMNi3ik1awnZROPmfWKOLL1XbGQztt+kALL1upwJrKNdOgh7+G
dFk0Vjq+6FuYEADuLO79SPHLu+KVSXynvpAYKIO2WVQvFoh9ufURRhXCz4xhlLol
nLuHaUrMrkY1Y8NsLkpC2W3fXwO1u3o+HbDD7++I+jdeezWRgxzuOHHpZ6sGEqBV
Y4LQt8FA3VFcGQiGj2va+n3tntunJL2bT+1smgFbthFUDJ5ht5M8DKoUkQZofUX6
E1uO4Bey85gpaAUgLXqm7TeBJ9pnFPdRzYbir+dx1v35Cm0M3LZHHFnSBZ/M370T
pYmsdJVNgn5hPYxbwAT4hLeqWLIexaPqGK7TcTtBy+QFfrquNoo=
=FaQL
-----END PGP SIGNATURE-----

--=-DMIUeLyXeFMGsNn3e7S5--
