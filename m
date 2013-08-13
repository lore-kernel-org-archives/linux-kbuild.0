Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43652 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932069Ab3HMVCy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Aug 2013 17:02:54 -0400
Message-ID: <1376427766.11676.42.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] Provide version number for Debian firmware package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 13 Aug 2013 23:02:46 +0200
In-Reply-To: <520A9528.4000309@suse.cz>
References: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de>
	 <520A9528.4000309@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-F/QthZYE05KtNk90fmDV"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>


--=-F/QthZYE05KtNk90fmDV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-08-13 at 22:20 +0200, Michal Marek wrote:
> Dne 11.8.2013 21:55, Heinrich Schuchardt napsal(a):
> > scripts/package/builddeb is used to create Debian packages.
> > Currently the firmware package always gets the same version number
> > irrespective of the Kernel version.
> > The paths inside the firmware package depend on the Kernel
> > version.
> >=20
> > With the patch supplied the Kernel version becomes part of the
> > Debian firmware package number.
>=20
> Ben, Max, is this how the official linux-firmware-image package is built
> in Debian? The change makes sense to me.

We package firmware in an entirely different (and selective) way.  We
take selected files from linux-firmware.git, we don't install anything
in /lib/firmware/$version, and we use multiple package names beginning
with the prefix 'firmware-'.

I don't think it's very useful to package the firmware subdirectory -
but since builddeb is already doing so, and the generated package
installs files in /lib/firmware/$version, it would make sense to include
$version in the package name.

Ben.

--=20
Ben Hutchings
Experience is what causes a person to make new mistakes instead of old ones=
.

--=-F/QthZYE05KtNk90fmDV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUgqe9ue/yOyVhhEJAQp+fRAAwX1z83m1QRLWSTkKKET8IQJy/3mEI++s
C/9oCkWz0mSGmMLgLPNdjeHmdE3ewmE7geRpUEipERVgxpW9sngYtygkra5q6RZ/
xj9EiiHCyUGSkwqMYYHHfa51DDbDC4r8SP76pfxlIAC2G/HZjPPokuqgTGpQC6OY
KY00r52p/apnsW4fLkqWJ1kaBSK68MnTz2+WyHttWWPBnUgsfHXtodg3KEpr36Dc
MuV2XAvPG7RgQ6OOpvUpcuswdJwk1VovHcWrKFkhA4ziIFJZAQ5G1hHnlOv/tGlm
B0cREcVwOIiBYkL6kpfXKpv7hRnKegWrMEn36Xac8d5Y20ab8u8lJrayKYmRIiyr
2vSscsVeC+O7p50NnF0e9Eb3wvE7L4PRWCOLdVLXk9I+HIpX/y6Bnpq5SHgrVE9H
D0L/IuP++glujzkiMV5MByB/GCiUZL4Ry8GOrk0251yQYONx3hHj3kVWSfcg7PGy
n2E29OSZE7YjycqK2lYxN3yqoFGrdhZQHNpbMzHbpSDstjY9JIoc+v9xUqPLKN1v
IJDADzbMfxXiBAEXZ9JDPbhZU2S+zasapkCRhZfPIP3y8SNdF/qsE6nwPXAMsnWN
t3WLY5dZdBBo0zTuxFcE+zCA7rt1uS+enkTAHuk1btaq+5n1lcY9AocOf/VzqcR6
TUCxA4nIQt0=
=hhrj
-----END PGP SIGNATURE-----

--=-F/QthZYE05KtNk90fmDV--
