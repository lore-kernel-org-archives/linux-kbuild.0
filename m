Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:47516 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbaHKRXY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Aug 2014 13:23:24 -0400
Message-ID: <53E8FC07.1090609@gentoo.org>
Date: Mon, 11 Aug 2014 19:23:19 +0200
From: justin <jlec@gentoo.org>
MIME-Version: 1.0
Subject: Re: [RFC] [PATCH] pkg-config default search pathes
References: <cover.1407766447.git.silvio.fricke@gmail.com>
In-Reply-To: <cover.1407766447.git.silvio.fricke@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xpuBKw8q4QSLP9mFn2jttWOafpCxTDi41"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Silvio Fricke <silvio.fricke@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xpuBKw8q4QSLP9mFn2jttWOafpCxTDi41
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11/08/14 16:22, Silvio Fricke wrote:
> Hi,
>=20
> please review this patch.
> I'm a little bit unsure if this patch is technicaly state-of-the-art be=
cause
> kbuild does it right. The problem is that some cross-toolchains (on my =
box is
> yocto installed) change the pkg-config search pathes to do some package=
-config
> setups for cross compiling.
> But the init of the toolchain manipulates PKG_CONFIG_SYSROOT_DIR and
> PKG_CONFIG_PATH variables that a pkg-config call searches in the wrong =
place to
> find the package and gives back the wrong values which we use to test t=
he
> availability of ncurses installation and this break the [x,g,menu]confi=
g.
>=20
> Some recommendations for this?
>=20
>=20

Hi Silvio,

What would happen in a real crosscompile case?

Justin



--xpuBKw8q4QSLP9mFn2jttWOafpCxTDi41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJT6PwIXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyQ0JDQjFGMzBDQ0UxMjFGNENDNDgxMDdC
OUQ0RjIzMUJEMTU1OEFCAAoJELnU8jG9FVirdQ0P/jRuxmMN3m/+8qiP5Ilk7uVw
/zwojC2czG5g8ATJEWlQuo5u/ZDAJCldo4dfzbrzG9nrIT2cd4/wpLAT+vTz/XO9
PSVxILnZ1+xfnGrzS1yqKsAjg8c+RlM+vAbw6Ickn9Lg8ZZ/0N6r2Sp8dWXRy2n/
2pxVj6QacMp/8s7Gk4uTY3eujni99Thoz3sSVileQsW1PU8j0oBi4UlgpKZ8DLtn
H9hwX98Id1WUkRv49AnC22xqctzSm931u0kPMrkMAowGtPscDpsYrQVqcpCM6eph
VIcD5c8MWkuscjO+ASnUN4ezQKFP2jvvuplvsZpq1yAOE99ZQDpcXVInMOSNi+wm
qzqmk9tECIauUDcpwIvApC7/v1rqw+KkznJVMn/IpvumNajPa7E85Y/v333Abbi3
tFvGqAVaX4dY0Mo57rAFWnrjOVHVh99jCHW0LjJYalZsseSV26+q4In2qXkXVLh5
O0PH45Qc5L5Q6WqbmHa2PqPBz6RYe0Rgw0RjSQY9fNaAklNOLu6H0WOb4PbCwF0h
vaNRkCDb65ytb0yUS8SFqmwTNZXvUGjO8yt1CwM/tbQFrgPTk4doDiocjtNFLsDP
pgWpI8QDh99jpZtR4E96Eyw1mizH2fa8xyuxGb7uVDRkhrXM0FnM1q4WsmlntdTb
kk5jMztEcVVQtT6MEAPr
=iwPA
-----END PGP SIGNATURE-----

--xpuBKw8q4QSLP9mFn2jttWOafpCxTDi41--
