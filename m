Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33974 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751769AbbHUJI7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2015 05:08:59 -0400
Message-ID: <1440148124.2632.39.camel@decadent.org.uk>
Subject: Re: [PATCH v3] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 21 Aug 2015 11:08:44 +0200
In-Reply-To: <55D4867B.40802@suse.cz>
References: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
	 <55D4867B.40802@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-sHPww6jasBFiM6rDaZ5n"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>


--=-sHPww6jasBFiM6rDaZ5n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-08-19 at 15:36 +0200, Michal Marek wrote:
> On 2015-06-11 10:11, riku.voipio@linaro.org wrote:
> > From: Riku Voipio <riku.voipio@linaro.org>
> >=20
> > Make deb-pkg build both source and binary package like make rpm-pkg doe=
s.
> > For people who only need binary kernel package, there is now bindeb-pkg
> > target, same target also used to build the .deb files if built from the
> > source package using dpkg-buildpackage.
> >=20
> > Generated source package will build the same kernel .config than what
> > was available for make deb-pkg. The name of the source package can
> > be set with KDEB_SOURCENAME enviroment variable.
> >=20
> > The source package is useful for gpl compliance, or for feeding to a
> > automated debian package builder.
> >=20
> > Cc: Chris J Arges <chris.j.arges@canonical.com>
> > Cc: maximilian attems <maks@stro.at>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> > ---
> > v3,
> >  * Allow setting source package name with KDEB_SOURCENAME
> >  * Fix issues noted by Ben: drop python and fix target in debian/rules
> >  * Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges
>=20
> Ben,
>=20
> are you OK with the v3 of this patch?

I've gone through this with Riku and found a couple of problems:

- The 'clean' rule in the generated debian/rules calls 'make clean',
  but scripts/package/Makefile includes debian/ in clean-dirs.
  Currently that directory does not get removed for some reason, but I
  think that's a bug and the clean rule in debian/rules should guard
  against removal.
- Building of the 'orig' tarball uses git, i.e. it depends on the
  kernel source being in a git repository and not simply unpacked from
  a tarball (or from other VCS).  The rpmpkg target doesn't have this=20
  same restriction.

I leave it to you to decide whether these are important enough to block
it.

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
                                - John Levine, moderator of comp.compilers


--=-sHPww6jasBFiM6rDaZ5n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVdbqnOe/yOyVhhEJAQqUXA/+Kj+Izf7JNL9wxGYeeF6R3/+a5fGGsVCX
3uQmQU5fNvyU0nxjMKeqfASOguNCXwvPJUbftaAkpr7yjqEEpMwbdIzLL9hDI6xL
BbqczRk45bxaHgc6Pz30+PaJzlpsB/zpCD4WbD3Ie+leN1DcRAfZuLt2GLisDWGF
IgPSvYza+19rwpuEk0G+IAm9FrhSASC6iXX1eyPZKzd5348zghUHeCi/K7u3LAy/
uIqh+Nxrq8I4OQtDuTWPAGpyF0YziCJLc/DDewYcY0EVSZHlykV2vWaN0YZjG9ld
ulfqpgfyx34oE6dvN/POoph0ytEPnDD9xvQAmkub6icNfsfVudKvXWJYkxtOx+Z1
CstGTkfqJm0NfkTMmjqGexsFRLFhsZE77mFhe+/hNlzSSDxOpw0xRMf1TJWvukV2
PiqlvDHh0MShSx2uHon2iusByhFyWcmDIXC1bsXqx55W4AR2Hb/+gfXFQGIb6UFB
NFw2EeG7lih/6zlYQjjVCv1kgcqXmBxG+o9zUSZ+S2XfLLJOe1IQO4tQl9OJHzJs
tXYoSDJZOQftGefSMBo07sLtvtGIM6frqIf4eVwVahtukCIgUA4ijqN1vR2Ll0m9
5ujRti2+NFWdOMvNhXpsfbwYv8Z14u/quKPi3pI95mJ6lw1UI+y1GEu18AKxwJeR
6MELqFsZs1E=
=9kDT
-----END PGP SIGNATURE-----

--=-sHPww6jasBFiM6rDaZ5n--
