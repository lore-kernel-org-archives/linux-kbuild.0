Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:46846 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752579AbdBGDIF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 22:08:05 -0500
Date: Tue, 7 Feb 2017 11:06:05 +0800
From: "Du, Changbin" <changbin.du@intel.com>
Subject: Re: [PATCH 2/2] Documentation/kconfig: add search jump feature
 description
Message-ID: <20170207030605.GA32621@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
 <20170206074648.23896-3-changbin.du@intel.com>
 <CA+r1ZhgO-jkcsRxOvhtPa4Pd1Mz1GXnH4cpnWdreBMtXeAkoSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <CA+r1ZhgO-jkcsRxOvhtPa4Pd1Mz1GXnH4cpnWdreBMtXeAkoSw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 07:42:11AM -0700, Jim Davis wrote:
> On Mon, Feb 6, 2017 at 12:46 AM,  <changbin.du@intel.com> wrote:
> > From: Changbin Du <changbin.du@intel.com>
> >
> > Kernel menuconfig support direct jumping function from the search
> > result. This is a very convenient feature but not documented. So
> > add a short description to the kconfig documentation to let more
> > developer know it.
> >
> > Signed-off-by: Changbin Du <changbin.du@intel.com>
> > ---
> >  Documentation/kbuild/kconfig.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kc=
onfig.txt
> > index bbc99c0..9916318 100644
> > --- a/Documentation/kbuild/kconfig.txt
> > +++ b/Documentation/kbuild/kconfig.txt
> > @@ -178,6 +178,10 @@ Searching in menuconfig:
> >         first (and in alphabetical order), then come all other symbols,
> >         sorted in alphabetical order.
> >
> > +       In the search result textbox, each symbol has a jump number on
> > +       left side if the symbol is jumpable. You can type the nubmer
>=20
> number  ("jumpable" reads a bit oddly, but it is understandable.)
>=20
How about 'if the symbol is visible'?

> > +       to jump to target menu to configurate that symbol.
>=20
> configure?
>
Thanks, I will correct them.

> --=20
> Jim

--=20
Thanks,
Changbin

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYmTmdAAoJEAanuZwLnPNUPucH/1bf6Nku2YGkXZBKVbkjHEoQ
U4EJtJMxSPjbX6r3msIidcNhxLoxQs152+qW0wGhSCv/aJcmSx+2ZPbftFbkAnGT
ByjC0SNsM7oXEPW66GHwg/Zn3RWX28+ugn6CpKhfqdIyKPHrr+R1Z01EsBm59ynV
tAVH1VJ6AZ1quYDAmaYBiQ/F1+NfWhnVsp6E5fqRedKlfpxnL8+Prg3TcrQqxjs6
NUBh1srIGrUXwL22wiyQrUUsywHhvSM5bkDldF8DCtxX00pajpZfNmOqpSAqQryK
/d7GGVtHJLBk/QmmX62r1M7B6QCc+CM9uu846P5g/TbV6+kTgGtsi2jjnY3dCi4=
=hi28
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
