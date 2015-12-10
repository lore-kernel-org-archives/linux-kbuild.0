Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:39930 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751289AbbLJHoz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 02:44:55 -0500
Subject: Re: Behaviour of kernel makefiles when entering a subdir using a
 config symbol = m
References: <56687204.4080404@ti.com> <20151209213255.GA11031@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <56692D6D.6060607@ti.com>
Date: Thu, 10 Dec 2015 09:44:45 +0200
MIME-Version: 1.0
In-Reply-To: <20151209213255.GA11031@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ctmkp4GLiQMuOq56HFK3wIOUrVj424rnV"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

--ctmkp4GLiQMuOq56HFK3wIOUrVj424rnV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On 09/12/15 23:32, Sam Ravnborg wrote:

> kbuild may enter a sub directory for two purposes:
> 1) to build object files to be part of the final image
>    Only subdirs specified using obj-y is visited.
>=20
> 2) to build object files that will be included in a module
>    Subdirs specified with obj-y and obj-m is visited
>=20
> Since you have the following code in your Makefile:
>=20
>     obj-m +=3D foo/
>=20
> then foo/ is only visited to build modules.
>=20
> So bar.o is built but is NOT included in the final image.
> This is also the behaviour you see.

Right.

We have three drivers (one fbdev, two drm), each of which can be built
as a module. But each of them also may require small boot-time setup,
which needs to be built-in.

I can get around the problem by entering the dir with obj-y, or by
creating a new extra config define which is y/n, and using that in the
makefile. The former makes make enter the dir even if the driver is not
enabled, and latter creates a config symbol only to solve this problem.

So I'd rather use the normal obj-$(CONFIG_MYDRIVER), as that's used by
all the fbdev and drm drivers, and (to me) makes most sense.

Is the purpose of the current behaviour to speed up the build when
compiling only the modules? Or why does it behave that way?

 Tomi


--ctmkp4GLiQMuOq56HFK3wIOUrVj424rnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWaS1tAAoJEPo9qoy8lh71Ts4P/RZLHcQgGx8pQ5Mb9VgDRI0y
6xd8xhlryqDjsTyHtciARnRVkRcUe257mANKaicZ1Nkzb9P2Jskw/S9F8LDLzaog
1SROABlzYZ20waKDAFsWTxhvXUI0tWff3sHWofIYLPT3VmMNDeyXVOquywbaCW99
z9y2NLIapQVPr0CaNJFdf/i8O3IEDFHSiZstfOxHVeV1EXFZnuq8W4zIJeLoJBgW
KfFJscAW3GABDiVwpxhQYq4/2RiSqJIN4moDI+8l750zKDqFq2iy0g2k1t35YQCZ
zkih2jzV0n6qrQj5Xd2UWv6s27AIsfZRTg+qtIMFE65Czsp85B91fJLtsfewmR+X
W58GTlXbxrwTU0DBfMRf4Ksg4pJHh2vchJ47xncjoo5rn9Ew1dH3Tr4K5/16GtZg
D+hsUQrDhjUQr3gedGSnNsspETo5UqEhuJTRLo/KsVqdGRTP3rcVMwvm48PlCIY1
1n/6OkTTMxOafEGx6Hc+8AM6yhSyXdWrLWfmZteMIq7wH/JwtP11bGH4MnFsK8/L
xyKI2ZF6Acy+r8AK0xGbZqSXkfbZWv3Uko4RQ01mfoEnMn0tJZSgZb0s7QEhrR72
tV4lHmWcHL2UkUN//OjoXUtgzVSrl1x/9xWf1xbZLvdA0U98eA+EWk2/KNz//mg1
aTBChyIlgAXghstq9Qio
=4+ca
-----END PGP SIGNATURE-----

--ctmkp4GLiQMuOq56HFK3wIOUrVj424rnV--
