Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:38273 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1763418AbYBVUnm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Feb 2008 15:43:42 -0500
From: Toralf =?iso-8859-15?q?F=F6rster?= <toralf.foerster@gmx.de>
Subject: Fwd: Re: Fwd: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i801.c
Date: Fri, 22 Feb 2008 21:43:36 +0100
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5502845.Qb1Hg9kHhB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200802222143.38643.toralf.foerster@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

--nextPart5502845.Qb1Hg9kHhB
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

pls see below for an issue of KConfig which happens for isntance if randcon=
fig selects
CONFIG_INPUT_APANEL.


=2D---------  Weitergeleitete Nachricht  ----------
Subject: Re: Fwd: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busse=
s/i2c-i801.c
Date: Dienstag, 12. Februar 2008
=46rom: Randy Dunlap <rdunlap@xenotime.net>
To: Toralf F=F6rster <toralf.foerster@gmx.de>

On Tue, 12 Feb 2008 11:57:14 +0100 Toralf F=F6rster wrote:

> Hello,
>=20
> does the mentioned  issue (pls see below) belong to kbuild ?

(plz see below)

>=20
> ----------  Weitergeleitete Nachricht  ----------
> Subject: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i=
801.c
> Date: Dienstag, 12. Februar 2008
> From: Jean Delvare <khali@linux-fr.org>
> To: Toralf F=F6rster <toralf.foerster@gmx.de>
>=20
> Hi Toralf,
>=20
> On Tue, 12 Feb 2008 09:38:35 +0100, Toralf F=F6rster wrote:
> > the build with the attached .config failed, make ends with:
> > ...
> >   LD      drivers/i2c/busses/built-in.o
> >   CC [M]  drivers/i2c/busses/i2c-i801.o
> > drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> > drivers/i2c/busses/i2c-i801.c:636: error: implicit declaration of funct=
ion 'pci_request_region'
> > drivers/i2c/busses/i2c-i801.c:676: error: implicit declaration of funct=
ion 'pci_release_region'
> > make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
> > make[2]: *** [drivers/i2c/busses] Error 2
> > make[1]: *** [drivers/i2c] Error 2
> > make: *** [drivers] Error 2
> >=20
> > The build was made with :
> > $> make mrproper && make rndconfig && <tweak config file> && make oldco=
nfig && make
> >=20
> > Here's the config:
> >=20
> > #
> > # Automatically generated make config: don't edit
>=20
> Note, it says: don't edit.
>=20
> > # Linux kernel version: 2.6.25-rc1
> > # Mon Feb 11 17:42:48 2008
> > #
> > (...)
> > # CONFIG_PCI is not set
> > (...)
> > # CONFIG_I2C is not set
> > CONFIG_I2C_I801=3Dm
>=20
> You set CONFIG_I2C_I801=3Dm while PCI and I2C are both disabled. You
> asked for a built breakage, you got it.

randconfig set I2C_I801=3Dm and kconfig does not know how to follow
dependencies of 'select', so I'd say Yes, this is a kconfig problem.

Yes, I see this one often.  I wish someone were willing to try
to fix it.  I've looked at the source code, but I'm not willing to
dive deeply into it.

> You might argue that "make oldconfig" should fix the configuration file
> in such a way that the dependencies are correct again. But then this is
> a kconfig issue, to be reported to the kconfig maintainer, not me.

=2D--
~Randy

=2D------------------------------------------------------

=2D-=20
MfG/Sincerely

Toralf F=F6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

--nextPart5502845.Qb1Hg9kHhB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBHvzP6hyrlCH22naMRAl7qAKCS9YmcvB2yhNDeJL5vnXk3I4yF6ACfYw0i
vxIKH9Wh3tBlPbJSEcqUVrs=
=owP5
-----END PGP SIGNATURE-----

--nextPart5502845.Qb1Hg9kHhB--
