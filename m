Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56101 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751726AbbIAX0b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 19:26:31 -0400
Message-ID: <1441149974.9215.59.camel@decadent.org.uk>
Subject: Re: [PATCH v4] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 02 Sep 2015 00:26:14 +0100
In-Reply-To: <1441115335-25165-2-git-send-email-riku.voipio@linaro.org>
References: <1441115335-25165-2-git-send-email-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CKzD1mAFJV/svcKkujy2"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>


--=-CKzD1mAFJV/svcKkujy2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-09-01 at 16:48 +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> Make deb-pkg build both source and binary package like make rpm-pkg does.
> For people who only need binary kernel package, there is now bindeb-pkg
> target, same target also used to build the .deb files if built from the
> source package using dpkg-buildpackage.
>=20
> Generated source package will build the same kernel .config than what
> was available for make deb-pkg. The name of the source package can
> be set with SOURCENAME enviroment variable.

KDEB_SOURCENAME, not SOURCENAME.

> The source package is useful for GPL compliance, or for feeding to a
> automated debian package builder.
>=20
> Cc: Chris J Arges <chris.j.arges@canonical.com>
> Cc: maximilian attems <maks@stro.at>
> Cc: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v4 address Bens commends,
> - use src_tar function instead of git archive for kernel sources
> - move KDEB_SOURCENAME setting to Makefile so it can be passed to
>   src_tar
> - use a toplevel .config file instead of a copy in debian/control
> - defend against delete of debian/ in clean target
[...]
> @@ -391,4 +396,32 @@ EOF
>  > 	> create_package "$dbg_packagename" "$dbg_dir"
>  fi
> =20
> +if [ "x$1" =3D "xdeb-pkg" ]
> +then
> +    cat < debian/rules
> +#!/usr/bin/make -f
> +
> +build:
> +> 	> \$(MAKE) sourcename=3D${sourcename} KDEB_PKGVERSION=3D${packagevers=
ion}

I don't think this needs to set any variables, though it shouldn't
hurt.

> +binary-arch:
> +	\$(MAKE) sourcename=3D${sourcename} KDEB_PKGVERSION=3D${packageversion}=
 bindeb-pkg
[...]

Shouldn't this be setting KDEB_SOURCENAME, not sourcename?

Ben.

--=20
Ben Hutchings
Horngren's Observation:
                   Among economists, the real world is often a special case=
.


--=-CKzD1mAFJV/svcKkujy2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVeY0Fue/yOyVhhEJAQr0jxAArZkhJHjuYaAB845dCIPdP8bVw/UGHFjl
4GivkZH0OAHdzRCXVjtIXgHmk6V96MDRfafUNg68pMY/5WBCmF2e4mHOwGat4lF3
O9wlSgbm/40tYxSncRfnklcNdCy6r8Cz5ZX6TvqzOXtpSC0FOhbviCiQHn4riWNl
dRjxeAB8oqb8p7qzGd+a0o53nvNO3QtWY6KuqMr4J264Am3BWnwxkzSdea3UtcU7
OtW90nEHShzyu/MRL4iISI2e85SN4lIwfQ/FqTvcDZBGN9t/Ar669pFtxdR4NhXb
OwsU/TBBdg8Pky9PV32NyZCFdhw+ikW63qhwd8rU921eRdI//Dh0d6vNPd+Xe3pA
HbOle14cATYS/krWXPNlbRJzbvtPaSfT8JqDEea1J5OW6rE54ZC3DkMQcL6n6rpo
6PZn+kLDYTSfvoQf/wY4J6Q8uUwmHkR/5mWnB4fRgRx9UkRDKgbQG+aj+mvsAO50
P6jtrgPH3IEW71G1d5zLvq05XklVqevNwoy2fg+c/f7hixFpsVY/VT0/2Vg2SfJD
8TaQMiPCHb3zcezUfvMSNGYpO5G4WUFVjRLsl/Cg6uc3ubY2b/yxxHnd+k+lJjOl
C28lb70Gc9/ioaXTyIZuxcs0nVDNObwUuL7tIrRyQ96Cpalp6sRk2IfIyQINnDvj
2CC3WULPs04=
=Tej5
-----END PGP SIGNATURE-----

--=-CKzD1mAFJV/svcKkujy2--
