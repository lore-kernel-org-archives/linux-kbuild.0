Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48]:36510 "EHLO
	mtaout02-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750909AbYKXWHZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Nov 2008 17:07:25 -0500
From: Ian Campbell <ijc@hellion.org.uk>
In-Reply-To: <1227560095-32597-8-git-send-email-sam@ravnborg.org>
References: <20081124205150.GA32497@uranus.ravnborg.org>
	 <1227560095-32597-8-git-send-email-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PDHTPpob3MhAZPVFgIKK"
Date: Mon, 24 Nov 2008 22:07:14 +0000
Message-Id: <1227564434.16868.14.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: Re: [PATCH 8/8] kbuild: move tags support to a shell script
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, kbuild <linux-kbuild@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>


--=-PDHTPpob3MhAZPVFgIKK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-11-24 at 21:54 +0100, Sam Ravnborg wrote:
>=20
> +# Support um (which has SUBARCH)
> +# FIXME: add support for ALLSOURCE_ARCHS if really used
> +if [ "${ARCH}" =3D=3D "${SUBARCH}" ]; then
> +       archs=3D"${ARCH} ${SUBARCH}"
> +else
> +       archs=3D"${SRCARCH}"
> +fi

I've never used um but is this conditional backwards? If ${ARCH} =3D=3D
${SUBARCH} then archs=3D"${ARCH} ${SUBARCH}" is equivalent to archs=3D"
${ARCH} ${ARCH}", isn't it?

I'm not quite sure I understand the distinction between ARCH, SRCARCH
and SUBARCH either but is it expected that for ARCH=3Dum, SUBARCH will be
i386/x86_64 or x86? I think it's the former in which case I'd expect
these days nothing will be found in arch/i386 or arch/x86_64? is a
SRCSUBARCH required?

Ian.

--=20
Ian Campbell

To do two things at once is to do neither.
		-- Publilius Syrus

--=-PDHTPpob3MhAZPVFgIKK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkrJZIACgkQM0+0qS9rzVlhqgCcD6WjVPkLRZcsXo83z29YS99m
EiAAn1YrUc3lZRJGnBr+c4mBCuUrQHOj
=tgag
-----END PGP SIGNATURE-----

--=-PDHTPpob3MhAZPVFgIKK--

