Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50696 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751979AbbAVNPk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 08:15:40 -0500
Message-ID: <1421932525.31046.208.camel@decadent.org.uk>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 22 Jan 2015 13:15:25 +0000
In-Reply-To: <CAGNsrLD97yDkUxsNPb9Ni2JNuwxLEamtBxyT9A8VSDwNfZ8BWg@mail.gmail.com>
References: <20150114123201.434698327@rtp-net.org>
	 <20150114123658.185884720@rtp-net.org>
	 <1421239885.19708.82.camel@decadent.org.uk>
	 <87lhkyictc.fsf@lebrac.rtp-net.org>
	 <1421769898.31046.194.camel@decadent.org.uk>
	 <CAGNsrLD97yDkUxsNPb9Ni2JNuwxLEamtBxyT9A8VSDwNfZ8BWg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9d/GCgCQ4AkfPn9ptCuE"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Arnaud Patard <arnaud.patard@rtp-net.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-9d/GCgCQ4AkfPn9ptCuE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-01-22 at 12:24 +0200, Fathi Boudra wrote:
> Hi,
>=20
> On 20 January 2015 at 18:04, Ben Hutchings <ben@decadent.org.uk> wrote:
> > On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
> >> Ben Hutchings <ben@decadent.org.uk> writes:
> >>
> >> > [Please submit patches inline.]
> >>
> >> I've no way to control the way quilt is sending mails.
> >>
> >> >
> >> > On Wed, 2015-01-14 at 13:32 +0100, Arnaud Patard wrote:
> >> >> When building a package with make deb-pkg (say, for arm), the dtb f=
iles are
> >> >> not added to the package. Given that things are still evolving on a=
rm, it
> >> >> make sense to have them along with the kernel and modules.
> >> >>
> >> >> v2: make use of dtbs_install
> >> >>
> >> >> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> >> >> ---
> >> >>
> >> >> Index: linux-next/scripts/package/builddeb
> >> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45=
.845922441 +0100
> >> >> +++ linux-next/scripts/package/builddeb 2015-01-14 13:19:26.1218837=
20 +0100
> >> >> @@ -143,6 +143,10 @@ else
> >> >>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_=
path"
> >> >>  fi
> >> >>
> >> >> +if grep -q "^CONFIG_OF=3Dy" .config ; then
> >> >> +       make INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/$packagename" dtb=
s_install
> >> >> +fi
> >> >
> >> > Only arm and arm64 support that target.  You should maybe run someth=
ing
> >> > like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
> >> > target is defined.
> >>
> >> There's a 'set -e' on top of the script so using make -n will likely
> >> result in the script failing, which wouldn't be so nice imho.
> > [...]
> >
> > That's why you use it with the if statement:
> >
> > # Only some architectures with OF support have this target
> > if make -n dtbs_install >/dev/null 2>&1; then
> >         make INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/$packagename" dtbs_in=
stall
> > fi
>=20
> Would it be acceptable to have a fallback when dtbs_install isn't availab=
le?
> It will allow to cover e.g. LTS 3.10 kernel which don't have the target
>=20
> for example (i.e. can't be upstreamed as-is), I'm using this hack locally=
:
> https://git.linaro.org/kernel/linux-linaro-tracking.git/blob/HEAD:/script=
s/package/builddeb#l334

If there are any architectures that build .dtb files but don't have a
dtbs_install target, they should be fixed rather than adding a
workaround here.

If you want this in some other branch then you should get the addition
of the dtbs_install target backported.

Ben.

--=20
Ben Hutchings
I haven't lost my mind; it's backed up on tape somewhere.

--=-9d/GCgCQ4AkfPn9ptCuE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVMD38ue/yOyVhhEJAQqE2BAAwUTGkSP59Z4ATRs/rQFifwfl4sqtgVOa
dgl1fJ2veUiGVoCKsLmpPjJXU3BjhbhDvjO6bku7VIWtuupROpJg8UsnMHTWDnTg
n1WE6sgVX4OtPDbdxp9yqnBG/roGbDCfOc5nJbv861UUcSXCwpi4kef8AoUOXsKD
8maiI6M5RMOfWV8zI3Hj1jx8YpcSWIaBeDzmgp+9K2XsSJc2WODVGZUElbhFiPXB
Nwfp3iSJGukYaO7UGyPjBZ3k1zDQuJKmC9xxaIP9mFNmCMtSIIzH6lhxB1jTcYrJ
IHXf3KTYWcs8jZGsSi8BWTAk8+ruCxysTsvwI8VEPuSoiMhDde4E4cup7bYjOHm8
OsUM+EZNkEhgmUiqhOeRumKoerFUIxp4hz0vHGmnlvrC+00ptBKjTabz5lfmECoO
8CU3wyC+VAP4mODVORzaLn9mX6Ekbw5pinbpVO3z+A+qI2Q8s/kSV9YGG1p20jhF
o14/ANNBfnpfiBiKZsnbKpvBLRlHysY3E/I5cR5OWSgdQLdy8I/XlHmg0DR14ToL
f+tyX1+ieOU3MBZ7TK7xhnvljzsAGdHORkZxmkRTPat2RIRmBPqA7OmQK6CNP6lJ
7DYoAp2EbZTg7kEKl6fQ22ZeQIqcKwJC9b8vEnnEjQtrW/2aa56yBsmANGoYQ51/
n6WmNdvqmzQ=
=PhEy
-----END PGP SIGNATURE-----

--=-9d/GCgCQ4AkfPn9ptCuE--
