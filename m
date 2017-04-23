Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:58607 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1427689AbdDWHXL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 03:23:11 -0400
Message-ID: <1492932183.31767.64.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 23 Apr 2017 08:23:03 +0100
In-Reply-To: <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
References: <20170418010011.GC4152@decadent.org.uk>
         <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-uv22otSze/ZVEm+P0Jq5"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-uv22otSze/ZVEm+P0Jq5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-04-23 at 15:47 +0900, Masahiro Yamada wrote:
[...]
> I tested dtbs_install once again by myself, but
> dtbinst-root is exported to the sub make
> and the vendor directories are created correctly.
>=20
>=20
> I checked the debian's forum you gave
> > References: https://bugs.debian.org/833561
>=20
> In there, you mentioned:
> "This looks like a bug in make, but we can at least work around it by
> using a non-hyphenated variable name."
>=20
>=20
> Does this issue happen on a specific Make version?
>=20
> I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
> but I was not hit by the problem.

I don't think this is make version dependent.  I can't reproduce the
issue today with make 4.1.  But I would have been using the same
version in August when I wrote that.

What more can I say?  Clearly the hyphenated variable gets passed to
the sub-make in most cases.  But it's not totally reliable because last
year it wasn't working for us.

> In the last post in the thread, you concluded:
> "We believe that the bug you reported is fixed in the latest version of
> linux, which is due to be installed in the Debian FTP archive."

I didn't write that, it's a standard message generated for bugs marked
as closed in a package changelog. :-)

> If so, why is this patch here?
> How is the dtbs_install procedure different in the Debian package?

This is the patch I applied to the package.

Ben.

--=20
Ben Hutchings
I haven't lost my mind; it's backed up on tape somewhere.

--=-uv22otSze/ZVEm+P0Jq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlj8VlcACgkQ57/I7JWG
EQlbxQ/8D9AcqIKXVWShZ+Rg2dnqfMw7Vtj4kVXhAQ0geIwWVRjzpoYbEtIIM4wD
rGMBqM/1KtZudyXt3sAXmuuobENtqRZ2m2Z6Y9uzF1mOFB2h6f19PZja8Y4R5fdP
odd1nqfi5YZg4oELP/3+72kqTgvSRS4ckKrbTUGufuu24ykGrbw3dedz7/HVTlhk
qo8NWrRoaNZUVTPq4piUxGs1TUxAyQHJnycx/a22bGX6Yl240idGpVgYoZdRT3kD
degC0lD2vHjShrWa6cUPQnVVCE5cpe75mv+SJD+wjxSiVaJ05lRJpnDeQrltA7YR
LFRmDfL+zS/cGxF7OokBBX1Za7Hckawtt4EfWT+Q0qRhUnoc3+UZsrebIrj/F3d4
aU0AJKjwq2lW9YEgY2nlEoMOXK0cp/dBsR17jyAr2TzT0yp4+yPM2Tb5fRC6o6uE
z/kxtwjflPO22lrGQt4a59s6j3ov/MuKs2QOkq76s3Nd6dSWChduaF3aFkXvpX5B
VgUg38GrdkRUTtPf3+7lmf1vs2kZfV4fG8MN3Gb4J2c0lIK1wihtw+PejcKsr8th
utjud8mWvXwc6U94vSVEpmEEAo+WFQ5HbgvqVH1zA8UMvcmmK5qwVn26xG4Iw1g6
f0E9QmCfAl007+yalWC3CcpbmrvdlaJqSl5VIzX56vN9YT8Yih0=
=XGfM
-----END PGP SIGNATURE-----

--=-uv22otSze/ZVEm+P0Jq5--
