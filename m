Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51021 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750768AbbABSEl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 13:04:41 -0500
Message-ID: <1420221867.5686.117.camel@decadent.org.uk>
Subject: Re: [3.19-rc2] builddeb: Update year and git repository URL in
 debian/copyright
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 02 Jan 2015 18:04:27 +0000
In-Reply-To: <CA+icZUUpxLS6B2RNGdkvEzmmPRi8TtJ6ySO3N0uLQgkuEPahEQ@mail.gmail.com>
References: <1420210672-12712-1-git-send-email-sedat.dilek@gmail.com>
	 <20150102151227.GA2658@sepie.suse.cz>
	 <CA+icZUUpxLS6B2RNGdkvEzmmPRi8TtJ6ySO3N0uLQgkuEPahEQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eIhfuqXpDbte45zJqmiI"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org


--=-eIhfuqXpDbte45zJqmiI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-01-02 at 16:18 +0100, Sedat Dilek wrote:
> On Fri, Jan 2, 2015 at 4:12 PM, Michal Marek <mmarek@suse.cz> wrote:
> > On Fri, Jan 02, 2015 at 03:57:52PM +0100, Sedat Dilek wrote:
> >> Happy new 2015!
> >>
> >> I have combined two patches which I had already sent to linux-kbuild M=
L.
> >
> > Applied to kbuild.git#misc, thanks.
> >
>=20
> /o\
>=20
> Just FYI...
> I will send out the 3rd in the original triple as "[RFC RESEND]
> builddeb: Try to determine distribution" against kbuild-next.
> From the discussion:
> max had some concerns and if I remember correctly I got no alternativ
> proposal from him.
> Today, I asked friends on #grml on how to do it better.
> I will try to find out if I can ensure lsb_release binary is available
> in all supported Debian/Ubuntu release.
> Not sure if this really necessary.

lsb-release is still not essential or build-essential in Debian.

The distribution (queue) name in the changelog only matters when
uploading to a distribution's package repository, and a builddeb-
generated binary package generally won't be accepted into such a
repository as there is no corresponding Debian-format source package.

In case some Debian derivative or private repository does accept
builddeb-generated binary packages, perhaps it is useful to allow
changing the distribution name from 'unstable'.  But the distribution
(queue) name doesn't necessarily match the codename of the running
release, so we would need to provide some way to set it explicitly.
(E.g. even the official Debian repositories for wheezy have some
different queue names: wheezy-proposed-updates, wheezy-security,
wheezy-backports.)

Apparently this is not needed by most users of builddeb, so we shouldn't
warn very loudly if lsb_release fails.

So how about something like:

if [ -n "$KDEB_CHANGELOG_DIST" ]; then
	distribution=3D"$KDEB_CHANGELOG_DIST"
elif ! distribution=3D"$(lsb_release --codename --short 2>/dev/null)"; then
	distribution=3Dunstable
	echo "I: Using default distribution of 'unstable' in the changelog"
	echo "I: Install lsb-release or set \$KDEB_CHANGELOG_DIST to change this"
fi

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
                                - John Levine, moderator of comp.compilers

--=-eIhfuqXpDbte45zJqmiI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVKbdsOe/yOyVhhEJAQo/Mw//bKYFMAPDn37Gzpfw1h/RifUtt3dUOtGA
ccq9/ElYKBA7j8lBTjtJV+8K+Iuu9XjnrIV6eilqoHoHbo8iwfog/zL2oyTfc+XI
buWYnzPJc6msY4VluqyETl5RDOiGUDjYkGlnwEKl25/qSJQfWFVLzK7tR3fkJHUI
VnOidq+3S0SCgF3+CeH2rhAg5KwBZVeXpCuoTVOEHRI311AaQrGJdD2FF32kaBE7
qrio7AU8vPuarUx+L/rwGgLVGcm28fjQwHp/zzgEATgSP6knQkSnwfFumSu34kGy
i0FHcICYD7kNKTDq+Fdpig6/MuvVWofNJTMKFhymsqnxc24Opg3TnAlRB2T+AXZu
L9KElMYIfl6ps1HmmcGmdV2RfqcTsJ4DyvnxYQWYzYEvdIr48RR3+hWX/dVNowjt
ZeQXC+mspc2ENofezF6VIUOl7dur7Mo5BFDWWbYNZr6YLzVgPxsC7NeflsuQgYBK
gYLUpoVZcqzdGh9s0EP+nlRLCmMKroWBX4T8wolYiLmnP3HdI9zgV+zffESon8dl
8K0Bf8uzmRaYDx6pppMJnzkF4p7RR3UFGQ7Cn+ovPAPr+ERAbst1Aj6knZ0f+KBU
pOWnWLfqfocptT0HB2Ned7Pwzpd8adSsZ0mBoNaxbI3j5pGbH2QVLmSilJ9U7bmC
6RFa4hLSoWI=
=ODC+
-----END PGP SIGNATURE-----

--=-eIhfuqXpDbte45zJqmiI--
