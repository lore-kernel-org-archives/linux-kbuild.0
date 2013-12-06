Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35932 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751500Ab3LFCH5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 21:07:57 -0500
Message-ID: <1386295673.3000.35.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 06 Dec 2013 02:07:53 +0000
In-Reply-To: <CABsPBHob2cYEVhBT8=jaJXE=oZ_c-b2iv-sLTQQthX_EZPwPpg@mail.gmail.com>
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
	 <1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHob2cYEVhBT8=jaJXE=oZ_c-b2iv-sLTQQthX_EZPwPpg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+Ds9qOlxX/4HJJDoGOXk"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Niew, Sh." <shniew@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org


--=-+Ds9qOlxX/4HJJDoGOXk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-12-06 at 09:45 +0800, Niew, Sh. wrote:
> On Fri, Dec 6, 2013 at 9:40 AM, Ben Hutchings <ben@decadent.org.uk> wrote=
:
> > On Fri, 2013-12-06 at 09:35 +0800, Niew, Sh. wrote:
> >> On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk> w=
rote:
> >> > builddeb generates a control file that says the linux-headers packag=
e
> >> > can only be built for the build system primary architecture.  This
> >> > breaks cross-building configurations.  We should use $debarch for th=
is
> >> > instead.
> >> >
> >> > Since $debarch is not yet set when generating the control file, set
> >> > Architecture: any and use control file variables to fill in the
> >> > description.
> >> >
> >> > Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pk=
g')
> >> > Reported-by: "Niew, Sh." <shniew@gmail.com>
> >> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > [...]
> >> I can't patch this to my linux-3.2.y tree which i clone from linux-sta=
ble
> >> I check that the patches number line are different...
> >> What i missed?
> >
> > This is for mainline; it should apply cleanly to 3.12.
>=20
> What if i want to test this to 3.2?

Then you're on your own, sorry.

Ben.

--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-+Ds9qOlxX/4HJJDoGOXk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUqExeee/yOyVhhEJAQrhOg//QtVD6Hf58ZmSKwpxlb2uJtxdGHUtIKZv
OKl6PuPY2rS/SCRZdUCK1lF+9sgJldpdqqMA7HvOC0elAEe73cdG65+9SCTsYtxn
8ojZmSYGrdGBb3jSyq4/32vXrcQSGMqOZhIZWTp0f9g1SNLxF/wcksxv46EOpkLI
HuO0V1ytJN8L/jmqOT9Z0mL73rqMkfjvvBDg7F/R6SNTethxosy5gjTuX+iGnx2l
o+wGHW3PCaOPfL35Z5/yv9uvcYSUV5+P/kxxMk0qV04IlvyWu0PoZmJGt7cMUvTq
Fq5Fv97Ze96kc83i+AXnt5e0S+ANHL1ZBnQZCmHTfUMa37U6a6kW4vYcTyjd6Ug0
WgoK+ODLJ4pxR8LkrT08uaPZWkAPpR9eDpjmJcA7oevARxmDiy+wJW+DPHiii/Nx
VvPfvCg7a+2nDm/G7mvd2XR9FhnWVP2wdbG7T8WrUWfiBLfzCOcL/X4cJ9EsTdcR
7TfUaE1UiIs/f86HrfmbP7ky0bMGonGnrh2lZwxtzP4EEvpwLf4lpjuuHVNKGd3N
WiygYH+Q8RmvPk2HdERKTlK+WtAnbuAVdO89R/L/3ME/rwd43yzmrJxzr6e7KTf6
Fjq4enF04ei+SKfOVXHbW8rAtHPFK5INbXHuoY96q+xkwDHcZs01/h5tde7DCF4+
w9XT6JLyh9Y=
=+0SH
-----END PGP SIGNATURE-----

--=-+Ds9qOlxX/4HJJDoGOXk--
