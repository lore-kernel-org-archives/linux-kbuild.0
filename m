Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:47049 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751632AbaFJMtn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 08:49:43 -0400
Message-ID: <1402404565.23860.112.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v2 1/1] builddeb: add arm64 in the supported
 architectures
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 10 Jun 2014 13:49:25 +0100
In-Reply-To: <1402389097.1823.14.camel@kazak.uk.xensource.com>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
	 <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
	 <1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
	 <1402272928.23860.55.camel@deadeye.wl.decadent.org.uk>
	 <CAGNsrLAiK88Lfz1nhZgB8FUgCDO88g462uJG+yKZ139_AZymeA@mail.gmail.com>
	 <1402389097.1823.14.camel@kazak.uk.xensource.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cdrvaMtn0gFqvr0Ob/rJ"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: Fathi Boudra <fathi.boudra@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-cdrvaMtn0gFqvr0Ob/rJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-06-10 at 09:31 +0100, Ian Campbell wrote:
> On Tue, 2014-06-10 at 11:15 +0300, Fathi Boudra wrote:
> > On 9 June 2014 03:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> > > On Sun, 2014-04-13 at 14:26 +0100, Ben Hutchings wrote:
> > >> On Sat, 2014-04-12 at 15:53 +0300, Fathi Boudra wrote:
> > >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > >>
> > >> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> > >>
> > >> > ---
> > >> >  scripts/package/builddeb | 2 ++
> > >> >  1 file changed, 2 insertions(+)
> > >> >
> > >> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > >> > index f46e4dd..0bf29a6 100644
> > >> > --- a/scripts/package/builddeb
> > >> > +++ b/scripts/package/builddeb
> > >> > @@ -42,6 +42,8 @@ create_package() {
> > >> >             debarch=3Dhppa ;;
> > >> >     mips*)
> > >> >             debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG=
_CONFIG && echo el || true) ;;
> > >> > +   arm64)
> > >
> > > Now I'm not so sure.  As we are comparing with the 'machine' name
> > > ($UTS_MACHINE, not $ARCH or $SRCARCH), shouldn't this actually check =
for
> > > aarch64?
> >=20
> > not sure. I've seen Ian comment (added to the cc list).
>=20
> The patch above produced the right thing when crossbuilt with
> ARCH=3Darm64. e.g. linux-image-3.14.5+_3.14.5+-2_arm64.deb
>=20
> With just Ben's original patch it produced linux-image-3.14.5+_3.14.5
> +-2_arm.deb instead.
>=20
> I think UTS_MACHINE is correct because:
>=20
> Makefile:UTS_MACHINE    :=3D $(ARCH)
>=20
> and there is no override in arch/arm*/Makefile.
>=20
> So the kernel arch is the correct thing to use here.

OK, so $UTS_MACHINE is a misnomer for this and some other architectures.
I wonder whether we should be using it at all?

Ben.

--=20
Ben Hutchings
DNRC Motto:  I can please only one person per day.
Today is not your day.  Tomorrow isn't looking good either.

--=-cdrvaMtn0gFqvr0Ob/rJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5b+3ue/yOyVhhEJAQr0ThAAq3RrW3VrHfCq5vMyER38/c8X7eBMOmiG
Z7NQ3lg3Rup2JTCp56SZJGbT0+M/5PCxkwQoLXzMiY269nplZAsbi37fiAFn5Pcd
Doi3rPFZTLfEt4ConE2ClN9JXgI7JmaHw9ipODft7la9gsHxXuBbrtzDpoZEW6bp
7KUYVWdRIm0LsWjc/b6axqXPibPtE58NuvuNX7I/OV1eWUYVEPVOKQqRLj3A7ETp
vEbuCVb0tRRo3iOUuw3aAA/XtkyXsbqF1ruYCBdIXIK+a2evpgoerk3ovaRcx+OL
jThNwUN2AF4UEs5zviRkYyfJmFwkuh00jC6mfdQZL1UVWH2Is8rSv+KSugb9KNvn
u65biKUWAtja4WLI4mUoUfvbh1cP1je5OIth2pkhZ8jrqCRWfDJkCuzCQ1PKJosN
Hc2VJ6NVB2A2fni83Uybexb9Hv+syiyu33O8U544AeyDUH/7j+uInVrFV91w1gaF
9iY+HMy+8mOco8x0AHTKzvLHGGWCXlCTXwwWyDLUk5fc+WeIG/whezoyoLgdH1HQ
GUuudAzRNEVpRPcIgPRMDXBgmgbQKST0BTjvm9gALJYBxp9VBIyCJOQdOPvadEsN
XGJYCTtPWOJ5vQYMajnjrhGsgpk3dhlJIIj0ny57zoC/i1vXwHU1Knf8zwkjUAEK
3yJk0+FrWXs=
=e5Q9
-----END PGP SIGNATURE-----

--=-cdrvaMtn0gFqvr0Ob/rJ--
