Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33083 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755000Ab0LDSa1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 13:30:27 -0500
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
References: <1290488397.6770.1404.camel@localhost>
	 <20101203122347.GA12395@sepie.suse.cz> <1291482609.8025.57.camel@localhost>
	 <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-+czF1D5NznK3rbeRRi91"
Date: Sat, 04 Dec 2010 18:30:21 +0000
Message-ID: <1291487421.8025.69.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>


--=-+czF1D5NznK3rbeRRi91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-12-04 at 13:11 -0500, Arnaud Lacombe wrote:
[...]
> > +static void report_conf(struct menu *menu, bool verbose)
> > +{
> > +       struct symbol *sym;
> > +       struct menu *child;
> > +
> > +       if (!menu_is_visible(menu))
> > +               return;
> > +
> > +       if (verbose && menu =3D=3D &rootmenu) {
> > +               printf("\n#\n"
> > +                      "# Changes:\n"
> > +                      "#\n");
> > +       }
> > +
> I would not expect to see any header if there is no new symbol(s).
> However, that might complicate the code too much. Btw, I find
> "Changes" to be misleading, is that header necessary ?

We use this feature (or an earlier version of it) in automated kernel
builds in Debian, so we expect the output to appear in build logs and
the header makes it easier to pick out.

> > +       sym =3D menu->sym;
> > +       if (sym && (sym->flags & SYMBOL_NEW) &&
> > +           sym_is_changable(sym) && sym->name && !sym_is_choice_value(=
sym)) {
> > +               if (verbose)
> > +                       conf_write_symbol(sym, sym->type, stdout, true)=
;
> > +               else
> > +                       printf("CONFIG_%s\n", sym->name);
> Please don't hardcode the prefix string. This should be:
>=20
>                        printf("%s%s\n", CONFIG_, sym->name);

OK, but I don't understand why it would change.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-+czF1D5NznK3rbeRRi91
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATPqIsee/yOyVhhEJAQJ0txAAkZl07RVku1ur1WwoB0GmUv3EQgGttuEP
x7nvVrE466DTQ0CD434hYkdFP27yyav3bVQghwFsOdGYNkWo3tHHWfYLjRtMNClU
c49O/UOLXDa8xWIV35aq8281149Ib2VJoHzykmz/22q+mGNslpL429pBid+37PB4
1AlnXXfL+AxvCzIlFRi2SV38h8adIl5bZvchQM5fWnRFI5hmj0uEkzUIyE7ikYeZ
qbc58VwxsECvilzaoxuEH45HPtWQHcKO+yKGH2BALv7kzqH52NqW5eX2yhmjTFrm
Ak3S9KTYJoL0uj8+QlKMUjU+LB4ln0msIpccm1sGL63O3mO1wwxAM6HOQIgsI634
AqwivJiKx5cgz1sTxyP113pU8JxamJhXXdyUm43FOx/59P/NmRoj3yY/FPQgChwl
0KK6lC7jjsDHpa6oy9pHIe3AzONLWFRGszRTjgUZqadBpciHU+ltEEtRDhqyxjBh
q/ZIvq57mAK4YA1IgXu7OXBWoI8PDmtutMZhizcxYMCU7zQw5mNaFu2sq4C0iYnN
m78LIETrCC6SvnW1QziN3yKxauB9sQcqcnNFCvC+7Qf8zjrNiGQUU5pP75EQ59RQ
gXJ9w8YHoJHW/dNolOQB6TpoVJaU386RTs8i1d4oVzwWJ97MrYhX1SnGo7rSV8ww
Y/tfZCrZFWY=
=VcEK
-----END PGP SIGNATURE-----

--=-+czF1D5NznK3rbeRRi91--
