Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:32837 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752942AbbFAMDw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 08:03:52 -0400
Message-ID: <1433160219.6319.159.camel@decadent.org.uk>
Subject: Re: [PATCH 2/2] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 01 Jun 2015 13:03:39 +0100
In-Reply-To: <CAAqcGH=whsuOKZRcGRkKHPH_ZxNp+DWmAs-fjYcHp9fRT3JLSg@mail.gmail.com>
References: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
	 <1433034886.6319.80.camel@decadent.org.uk>
	 <CAAqcGH=whsuOKZRcGRkKHPH_ZxNp+DWmAs-fjYcHp9fRT3JLSg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OmEcTnZVdLh58UfttC5F"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>, maximilian attems <maks@stro.at>


--=-OmEcTnZVdLh58UfttC5F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-06-01 at 11:35 +0300, Riku Voipio wrote:
> On 31 May 2015 at 04:14, Ben Hutchings <ben@decadent.org.uk> wrote:
> > On Thu, 2015-05-28 at 12:11 +0300, riku.voipio@linaro.org wrote:
> >> From: Riku Voipio <riku.voipio@linaro.org>
> >>
> >> By passing BUILD_SOURCE=3Dy variable, make deb-pkg builds a debian sou=
rce
> >> package. It will generate a minimal debian/rules file that calls back
> >> to make deb-pkg. Generated source package will build the same kernel
> >> .config than what was available for make deb-pkg.
> >>
> >> The source package is useful for gpl compliance, or for feeding to a
> >> automated debian package builder.
> >>
> >> v2, address Maximilians comments
> >>
> >> - Isolate from my other patches, so it can be merged easier
> >> - Separate bindeb-pkg target for building just binary debs
> >> - Build source package in deb-pkg target to match rpm-pkg target
> > [...]
> >> --- a/scripts/package/builddeb
> >> +++ b/scripts/package/builddeb
> >> @@ -265,12 +265,16 @@ On Debian GNU/Linux systems, the complete text o=
f the GNU General Public
> >>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'=
.
> >>  EOF
> >>
> >> +
> >> +build_depends=3D"bc, kmod, cpio, python "
>=20
> > Why python?
>=20
> I recall seeing python called sometimes in kernel build, and it's
> alsoin debian kernel build-depends. However, a quick git grep suggests
> this would be ia64 only.

Yes, the Debian source package has a bunch of Python scripts but not
upstream.

[...]
> >> +clean:
> >> +     \$(MAKE) clean
> >> +
> >> +binary: binary-arch
> >> +EOF
> >> +
> >> +     (cd $KBUILD_SRC; git archive --prefix=3Dlinux-upstream-${version=
}/ HEAD)|gzip -9 > ../linux-upstream_${version}.orig.tar.gz
>=20
> > Not xz?  (Which would add a build-dependency, of course.)
>=20
> I tried to keep this as universally usable as possible. Can we assume
> xz installed these days? In debian/ubuntu yes, but do we want to cater
> users of other distributions as well?

It would be surprising to have dpkg and not xz.  dpkg doesn't depend on
the xz command any more but it does use liblzma.

Still, I accept that gzip may make this slightly more portable.

Ben.

--=20
Ben Hutchings
Power corrupts.  Absolute power is kind of neat.
                           - John Lehman, Secretary of the US Navy 1981-198=
7

--=-OmEcTnZVdLh58UfttC5F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVWxKIOe/yOyVhhEJAQpnRxAAgMq/NLs3vJNXaDZOwqgDtIL70MVDxoFI
gD1WmTjAN+pxzHXnOphV0cm16ALBluqI9q/qNbrYq/lGBw33zk/jNMeHh0nDTUbm
MPL4HmyhQVkY4Zk4v6L1Picnun8aUIyKxHAFKvHLWVHv3n2eiPX6Kpak2WSTQrGg
i3EUdjU42ygM9ykpoDnXt1F/RjCmC3IpX2dHXkPb6+iaiK2GkM3UwZ9tEk7kPC3L
a/Da9pTG0N9SckacYoD7IDWbJMBUUi/CNoJZj2ZmSlmTnCKcXs3Eq1DZO7uSMJRR
/7WmwqnGnpaDZGzgq+m3Se/OfZEsyOnHlYHIdxxZNyjrwoiMGAI8y1s4Y1KEvcWe
GKHjtSWUQLIQ+l4jP+YHsrj+rRXNk5yGoAcmHL+T+RIhTRNFifHz/KVeHcWYiydh
p/Pda5E9chu/Sac/yknnpqaOuod1wvQIivanXL6hC5l/szFGGC1i7Oi9ziQ+FZKF
wFQyUcb8jrlFuizZaahGyV1ICIcQnBYYMwLbZnDE2G5RTN2rKuQEdiCFzxCLfcOP
XyCqD4oLSsYCehkuGA560d5+ysY0blWxQG6benhNy3audO93djxC+7N5dpq23sXD
N8OHM8ZkaUxglvkquL1jps/hzxnMB0tfrXV475SnIhB8lK4WaKZrE1j3V7raBOKj
rxTLY+derqA=
=5Hpp
-----END PGP SIGNATURE-----

--=-OmEcTnZVdLh58UfttC5F--
