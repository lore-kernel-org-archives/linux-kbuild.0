Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33300 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751966Ab0LVEof (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Dec 2010 23:44:35 -0500
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <4D10DA09.6070009@suse.cz>
References: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
	 <1291530919-5601-2-git-send-email-lacombar@gmail.com>
	 <4D10DA09.6070009@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-IBDHlGXbvnGbIE8t6a2H"
Date: Wed, 22 Dec 2010 04:44:28 +0000
Message-ID: <1292993068.2874.31.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] [RFC] kconfig/listnewconfig: show default value of
 new symbel
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org


--=-IBDHlGXbvnGbIE8t6a2H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-12-21 at 17:47 +0100, Michal Marek wrote:
> On 5.12.2010 07:35, Arnaud Lacombe wrote:
> > note: I would not mind adding the KCONFIG_VERBOSE logic.
> >=20
> > Original idea and implementation by Bastian Blank <waldi@debian.org>,
> > Maximilian Attems <max@stro.at> and Ben Hutchings <ben@decadent.org.uk>
> >=20
> > CC: Ben Hutchings <ben@decadent.org.uk>
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > ---
> >  scripts/kconfig/conf.c     |   14 +++++++++++++-
> >  scripts/kconfig/confdata.c |    4 ++--
> >  2 files changed, 15 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> > index 5459a38..1b58129 100644
> > --- a/scripts/kconfig/conf.c
> > +++ b/scripts/kconfig/conf.c
> > @@ -411,6 +411,17 @@ conf_childs:
> >  		indent -=3D 2;
> >  }
> > =20
> > +
> > +static void
> > +listnewconfig_print_symbol(FILE *fp, struct symbol *sym, const char *v=
al, void *arg)
> > +{
> > +	fprintf(fp, "%s%s (default: %s)\n", CONFIG_, sym->name, val);
> > +}
>=20
> Ben, do you have an opinion on this format versus the standard .config
> produced by your patch?
[...]

The .config format is more useful as it is then possible to copy lines
directly into a .config file.  If you're going to apply Arnaud's
preceding patch (1/2) then please let me rewrite mine to apply on top of
that, rather than applying this second patch.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-IBDHlGXbvnGbIE8t6a2H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATRGCJue/yOyVhhEJAQJwZBAAxgbht0uN2lthZlDyVzFXqZo5RnaNvCUR
bb7LbtAP3RowpVHQxkfX1xwdAlxxkiavNUxXXfn+FipWOBJbZKZn93V+93OrrdbH
Xz5qwyPe1hk7tfr+q7LzfeZzBCT4Ex7SU8Pze/sAeMLqZlmcxZTYkG9fvXecz8qh
asHbdmHUNB86G9px2qG2iOMYYGrXDg+sUHoi57YsWrQ+QjFEqrgToGvG/kh0dzgZ
OKZhe0luVB4Q3R3Aa7a4OlLdp9ORhASMR0VVEwTlTtM0C0jaZRAfgLDAnn4/aW8T
yzgK9XhGmd0cHgJcu+MrbjVNJaCZY74FhsTB0R6pTGCrusCsa7WsgMeUzDI0sGfK
uiENIYYEzhdlwKTRW3cxQW2yjDrBlhc/5nSK7UV2aahaED+yseUvXWKKPFQ5sR2V
eJl0mJFOgCnp9pmIzReyvWwzVP4I0swhHVTjmcSKpgD5V6OZCxZ7moeKpGl8wZAp
+K88r+U/hYz0tb56CwY+35QFtKa0FLsJG1Zl3quMr/qv9PQX755xLTzVqoNN0GaM
FdQtutRebRkXg3rmwFu0npFB1mRm4mmFGQv0gko420jfrHTqvJ0KwgMqJtkz+XFl
QUcPJ4fI6/Pi2CjNWl6hF376wRBeIr57c+cknU/0vh1uLhnl71emAQiuoU6uXRWK
AAgtfYgL0O4=
=pO9m
-----END PGP SIGNATURE-----

--=-IBDHlGXbvnGbIE8t6a2H--
