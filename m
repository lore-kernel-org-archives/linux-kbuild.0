Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:48659 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756058Ab0LDVHU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:07:20 -0500
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <AANLkTik8OgrFRYKF6PS5MkawDDojmF_yEnFtTcnjz4Pp@mail.gmail.com>
References: <1290488397.6770.1404.camel@localhost>
	 <20101203122347.GA12395@sepie.suse.cz> <1291482609.8025.57.camel@localhost>
	 <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
	 <1291487421.8025.69.camel@localhost>
	 <AANLkTik8OgrFRYKF6PS5MkawDDojmF_yEnFtTcnjz4Pp@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-9ZkrODrUwHaW4SFFMv2B"
Date: Sat, 04 Dec 2010 21:07:12 +0000
Message-ID: <1291496832.8025.79.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>


--=-9ZkrODrUwHaW4SFFMv2B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-12-04 at 14:53 -0500, Arnaud Lacombe wrote:
> Hi,
>=20
> On Sat, Dec 4, 2010 at 1:30 PM, Ben Hutchings <ben@decadent.org.uk> wrote=
:
> > On Sat, 2010-12-04 at 13:11 -0500, Arnaud Lacombe wrote:
> > [...]
> >> > +static void report_conf(struct menu *menu, bool verbose)
> >> > +{
> >> > +       struct symbol *sym;
> >> > +       struct menu *child;
> >> > +
> >> > +       if (!menu_is_visible(menu))
> >> > +               return;
> >> > +
> >> > +       if (verbose && menu =3D=3D &rootmenu) {
> >> > +               printf("\n#\n"
> >> > +                      "# Changes:\n"
> >> > +                      "#\n");
> >> > +       }
> >> > +
> FWIW, some more nits about this header:
>  - I'd rather either always or never see it, not depending on whether
> or not KBUILD_VERBOSE is set to non-zero.

The other users of listnewconfig obviously didn't want that.

>  - The "menu =3D=3D &rootmenu" test is pretty useless, just move the
> display (if any) outside of report_conf(), where there is no
> ambiguity.
>  - And why do you need a leading newline in front of the header (ie.
> the "\n#\n") ? The only places where this construct is used in conf is
> when there is a need to highlight the message, which should not be
> needed here.
>=20
> >> I would not expect to see any header if there is no new symbol(s).
> >> However, that might complicate the code too much. Btw, I find
> >> "Changes" to be misleading, is that header necessary ?
> >
> > We use this feature (or an earlier version of it) in automated kernel
> > builds in Debian, so we expect the output to appear in build logs and
> > the header makes it easier to pick out.
> >
> That's easily doable outside kconfig.

No it isn't, as the Kconfig code must be built as part of the
listnewconfig target.  (Building just the code first will provoke
warnings about the invalid config.)

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-9ZkrODrUwHaW4SFFMv2B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATPqtcee/yOyVhhEJAQJXahAAqwGi67j5mYq1jlB4fdGZBNeqxlq+66Eg
XufEqOYDyIjtZlLSUWFwpMz7aLIJV9PFeqRLsjWAALHyLmA0nh9RDchWWF1lIbZm
pBEXGgDlA8puQ7VZ2U5g2Kl8ColkTnFEkx5Tu1GMYCIvj/Z4+xB3FF3OMJJsQpXX
EeNeCSuDQ3yLS9niTM4/gjx221KYgMos8O3LaViGxmiF9yGzjrLMXPmYKJfNHJnK
k8z7W7g7NN7yKuK1NCP3XhOPDyOhHkCAZdh0hbKyfj4UxH843zZ+c3V9SSSblZIU
Fokfhcjn6RgJMkCNQnKgiYmtY6CFoAM+5iwHdEggMx5E7Y/klg8TlaVpKYYYXC+B
obma4zisMLYTzZymeL8KKGZ/AUlAV4GZXjUPF4v8q7hkR3iNPLH14wxnDzZWBCmp
QJnlzWSitmUDWYPfk35fz2ggpePfZ2eIJUpksiYjd3thooAMmjUX6JUjnovrjIuH
q1BzhnlM8pmFGcYOZR55WOJ1PNXLysOPxcYJq77gV9U+Kyydy3KUOx8BNn9Q9oF3
FO6Kj0FGjA4lMwvn3F2jVWcqgmlT86dpxN0EwwslGLTdpoKDKXjuw+LaS072Cmki
j5+zTNFWAZcof/bfEH1DgtsLxskqUeT5pfJSFAjE24vkeiIpCgmv6Pmh33ZpFTfx
X9g7jtIId+4=
=l+5I
-----END PGP SIGNATURE-----

--=-9ZkrODrUwHaW4SFFMv2B--
