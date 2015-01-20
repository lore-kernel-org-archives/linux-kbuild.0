Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43254 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751737AbbATQFM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Jan 2015 11:05:12 -0500
Message-ID: <1421769898.31046.194.camel@decadent.org.uk>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 20 Jan 2015 16:04:58 +0000
In-Reply-To: <87lhkyictc.fsf@lebrac.rtp-net.org>
References: <20150114123201.434698327@rtp-net.org>
	 <20150114123658.185884720@rtp-net.org>
	 <1421239885.19708.82.camel@decadent.org.uk>
	 <87lhkyictc.fsf@lebrac.rtp-net.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AAu2v+X8n6zDm5BN96Om"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-AAu2v+X8n6zDm5BN96Om
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
> Ben Hutchings <ben@decadent.org.uk> writes:
>=20
> > [Please submit patches inline.]
>=20
> I've no way to control the way quilt is sending mails.
>=20
> >
> > On Wed, 2015-01-14 at 13:32 +0100, Arnaud Patard wrote:
> >> When building a package with make deb-pkg (say, for arm), the dtb file=
s are
> >> not added to the package. Given that things are still evolving on arm,=
 it
> >> make sense to have them along with the kernel and modules.
> >>=20
> >> v2: make use of dtbs_install
> >>=20
> >> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> >> ---
> >>=20
> >> Index: linux-next/scripts/package/builddeb
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45.84=
5922441 +0100
> >> +++ linux-next/scripts/package/builddeb 2015-01-14 13:19:26.121883720 =
+0100
> >> @@ -143,6 +143,10 @@ else
> >>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_pat=
h"
> >>  fi
> >> =20
> >> +if grep -q "^CONFIG_OF=3Dy" .config ; then
> >> +       make INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/$packagename" dtbs_i=
nstall
> >> +fi
> >
> > Only arm and arm64 support that target.  You should maybe run something
> > like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
> > target is defined.
>=20
> There's a 'set -e' on top of the script so using make -n will likely
> result in the script failing, which wouldn't be so nice imho.
[...]

That's why you use it with the if statement:

# Only some architectures with OF support have this target
if make -n dtbs_install >/dev/null 2>&1; then
	make INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/$packagename" dtbs_install
fi

Ben.

--=20
Ben Hutchings
Larkinson's Law: All laws are basically false.

--=-AAu2v+X8n6zDm5BN96Om
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVL58r+e/yOyVhhEJAQoWHhAA1GKtJj+Nfph1RRrOn4+w4ybp5dEeHbuI
tGHxG0LIZX0dQ/swzD3p2QnGVq+AwzXlcNQkOr+T0pdp6joCyHtEvU24F/BSC1ZZ
sMzFL271qaKj2DvjIpSo8JV87YQTqVURrvMapcwb7vb3MTkLFK04DYAbIJIoodQ6
rSlBrpXJD9bTk6TfONfuBzfEcBvGq4Aamlj23Z8k4c5QMYeuRgPybT8qNAesrOEK
j1Y2WfoK1w+6Dk4VqKgZM0w2ClW3P/6xPPCGxNfSTvlcXj242yqZi+YA0vCJLNii
ytT0HwhJFXh/MUQ2uYMd23hVknF+mOWdqib1sljPewmfcDfaw36xNRhKldEQqmyH
kt37QJks3nF14VthEbt14Wl6/doNuzCw12nJ7j7NH3HU0DdQHW0s2nUsEi3roGl3
XshvFnZXmV9VZI4uCma2DGOEv7LN/1GMG4H8focm+v1Xrb34Lwa4SxQyn3b32zpd
mnwqyHzbXUGQAjhoh2lAgo9qh7pYMcHT7b8rYpt2+yg9ACFgF1r5cKLobtPMEhb+
+2LSXCoc9AQNAn5HVNrf4lbqkuCa0WcoKLy34/I8UnPgvTDWcbYa8QafmWIQhrBs
Fg9Qjr0pkpFKSAmFkQ0grTbCLDSTNu9Y5JX1VAgrbkmK9PlksYvOs4GVsQHXe239
eiLicZLzluk=
=2KhW
-----END PGP SIGNATURE-----

--=-AAu2v+X8n6zDm5BN96Om--
