Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35183 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755692Ab0LDVxs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:53:48 -0500
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <AANLkTimTz=AtE6FL-+HDniWwO256yuaqEJyoPWRThYqf@mail.gmail.com>
References: <1290488397.6770.1404.camel@localhost>
	 <20101203122347.GA12395@sepie.suse.cz> <1291482609.8025.57.camel@localhost>
	 <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
	 <1291487421.8025.69.camel@localhost>
	 <AANLkTik8OgrFRYKF6PS5MkawDDojmF_yEnFtTcnjz4Pp@mail.gmail.com>
	 <1291496832.8025.79.camel@localhost>
	 <AANLkTimTz=AtE6FL-+HDniWwO256yuaqEJyoPWRThYqf@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-PyaLwll6vix/+SFCkvxl"
Date: Sat, 04 Dec 2010 21:53:42 +0000
Message-ID: <1291499622.8025.83.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>


--=-PyaLwll6vix/+SFCkvxl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-12-04 at 16:14 -0500, Arnaud Lacombe wrote:
> Hi,
>=20
> On Sat, Dec 4, 2010 at 4:07 PM, Ben Hutchings <ben@decadent.org.uk> wrote=
:
> [...]
> >> >> I would not expect to see any header if there is no new symbol(s).
> >> >> However, that might complicate the code too much. Btw, I find
> >> >> "Changes" to be misleading, is that header necessary ?
> >> >
> >> > We use this feature (or an earlier version of it) in automated kerne=
l
> >> > builds in Debian, so we expect the output to appear in build logs an=
d
> >> > the header makes it easier to pick out.
> >> >
> >> That's easily doable outside kconfig.
> >
> > No it isn't, as the Kconfig code must be built as part of the
> > listnewconfig target.  (Building just the code first will provoke
> > warnings about the invalid config.)
> >
> echo "#"
> echo "# Changes:"
> echo "#"
> make [...] listnewconfig
>=20
> does the job, without introducing extra header others do not seem to
> want to see.

Now try that with a clean tree and an outdated config file.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-PyaLwll6vix/+SFCkvxl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATPq4W+e/yOyVhhEJAQK6zxAA1nrNnSkqv3VtFfVCp0VQ0K9RYYI+tVv1
FVX9TqMFDuPO5JK6rnweI4QZ+q1lMDP+SQNkAU4Eap9U4hFeGOYRTgYQt8syQQt8
hYuGSCZwZCLJrcOVghoROWb0blk3xhKLs8A/lUpkgJQoxmX88XRnSTqUaXFf/rdx
lfS+Li6Bylr401Bz9qpYfPUv+OxV/6NHku/GZydANogxTLTr8+InvJU8cVQ6qggT
dhq2HC7sdX7n2Kwx6rXL0cbeGePc3RbDeK54eFvXG1/av68Jt7t5mT0SPbOlUmW8
BDYZko72u7DZR+Vfcl9oyUQKRkjwAlq8Y0Z66mFsw9QgmJT6kgyHpvPJ1oiRc0DB
qG/VTLVp9WYbDBf1k1bAHXCM6IcrQpFNvI+vuEWZ23Yox6zZ3bIKwT7sBOeVhe9k
S/YDT9r6+KNzqdfu+KixOw2YunRmd4VOqDcukM+ZjiXjsaRmYl5vc8LEmvwkTODA
by9SInkyMm4KZ4mFAycH6HciYeveDEA7hc69y8z75o/anM0VOmDNaFG9GGapFa4f
z1hfBk4WfzmKrQ26pk+jRt8mFYgg774lDNJxppOuDQld+Lbr/FLGGcbp368RNdMm
KjtVQ5zKafmEatzTPPM8V4UaixK82YbWdIuwEbNQsIU0bCerjRpSBVuTB8Avk7rn
5pfBXao3tdk=
=AB/l
-----END PGP SIGNATURE-----

--=-PyaLwll6vix/+SFCkvxl--
