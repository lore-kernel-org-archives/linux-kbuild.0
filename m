Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:5043 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751918AbdBGDM3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 22:12:29 -0500
Date: Tue, 7 Feb 2017 11:10:33 +0800
From: "Du, Changbin" <changbin.du@intel.com>
Subject: Re: [PATCH 1/2] kconfig/mconf: add jumping tip in title of search
 result textbox
Message-ID: <20170207031033.GB32621@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
 <20170206074648.23896-2-changbin.du@intel.com>
 <87a89zbkb0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <87a89zbkb0.fsf@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: mmarek@suse.com, corbet@lwn.net, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 02:00:51PM +0200, Jani Nikula wrote:
> On Mon, 06 Feb 2017, changbin.du@intel.com wrote:
> > From: Changbin Du <changbin.du@intel.com>
> >
> > Prompt user how to quickly jump to the item he/she is interested in.
>=20
> :o
>=20
> All these years. I... I didn't know. Thanks!
>
aha, me too! You know, back to the top menu then look into step by
step...

> > Signed-off-by: Changbin Du <changbin.du@intel.com>
> > ---
> >  scripts/kconfig/mconf.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> > index 315ce2c..23d5681 100644
> > --- a/scripts/kconfig/mconf.c
> > +++ b/scripts/kconfig/mconf.c
> > @@ -443,10 +443,10 @@ static void search_conf(void)
> > =20
> >  		res =3D get_relations_str(sym_arr, &head);
> >  		set_subtitle();
> > -		dres =3D show_textbox_ext(_("Search Results"), (char *)
> > -					str_get(&res), 0, 0, keys, &vscroll,
> > -					&hscroll, &update_text, (void *)
> > -					&data);
> > +		dres =3D show_textbox_ext(
> > +				_("Search Results (type the number to jump)"),
> > +				(char *)str_get(&res), 0, 0, keys, &vscroll,
> > +				&hscroll, &update_text, (void *)&data);
>=20
> It would be even better and discoverable if this could be turned into a
> dialog menu, so that you could navigate the search results using arrow
> keys and hit enter to choose. But this is already an improvement.
>=20
Yes, that will have a better experience. :)

> >  		again =3D false;
> >  		for (i =3D 0; i < JUMP_NB && keys[i]; i++)
> >  			if (dres =3D=3D keys[i]) {
>=20
> --=20
> Jani Nikula, Intel Open Source Technology Center

--=20
Thanks,
Changbin

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYmTqpAAoJEAanuZwLnPNUL/4H/2qh2xX/eWpNUQ1p9XOl/t49
Mbec2BuOc0Ulrgww64ewfbktV4/UHIhXAg54CyF5nI5cFs3lYTs5gSlXyAtr0S8y
B4L9Z8WTotOy+Cy/3h+m8FUY4TbNL0NBrPRsO1FsC1Gr4CzIQB7SkaByC97Afhq8
cKTwN7/qsNO0SSUkeGff1xDuC510582mmA6YIWIdCuRG4ZOFC/IdqwUazJjbAzB7
IL9bFrT6J7o1QXbHn0RDcVzz6Nqm6mJsbMiYe6S7N4O5uvpWmEi3YfMnEIQtiAEG
pYRAxEoO2LUpxxDPeagMn0MEfJKQzM/kOH4H0ezUfOFXJTX3lh1TRK1yM28vc0Q=
=ugmk
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
