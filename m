Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57388 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727302AbfIKNEk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 09:04:40 -0400
Message-ID: <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 11 Sep 2019 14:04:29 +0100
In-Reply-To: <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
         <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-QTdYwm36GNbQ//qlVjyL"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ab@php.net


--=-QTdYwm36GNbQ//qlVjyL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-11 at 21:17 +0900, Masahiro Yamada wrote:
> Hi Ben,
>=20
>=20
> Thanks for this.
> Please let me add some comments.
>=20
>=20
> On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wrote=
:
[...]
> > +Absolute filenames
> > +------------------
> > +
> > +When the kernel is built out-of-tree, debug information may include
> > +absolute filenames for the source files.  The ``__FILE__`` macro may
> > +also expand to an absolute filename.  This must be overridden by
> > +including `prefix-map options`_ in the `KCFLAGS`_ variable.
>=20
> Do you mean -fmacro-prefix-map ?

No, I mean -ffile-prefix-map or the older -fdebug-prefix-map.

> If so, it is already taken care of by the top Makefile.
> If you use GCC 8 or newer, it is automatically added to
> KBUILD_CFLAGS.

Ah, that's helpful.  So, I suppose I should just mention
-fdebug-prefix-map here and warn that __FILE__ will still be a proble
if using older compiler versions.

> > +Generated files in source packages
> > +----------------------------------
> > +
> > +The build processes for some programs under the ``tools/``
> > +subdirectory do not completely support out-of-tree builds.  This may
> > +cause source packages built using e.g. ``make rpm-pkg`` to include
> > +generated files and so be unreproducible.  It may be necessary to
> > +clean the source tree completely (``make mrproper`` or
> > +``git clean -d -f -x``) before building a source package.
>=20
> Currently, the source package building does not support
> out-of-tree build anyway.

Yes, I realise that.

> 'make O=3Dfoo rpm-pkg' fails with an error message.
>=20
> Building in a pristine source will solve the issue.
[...]

The issue I'm thinking about is that an out-of-tree build, prior to the
package build, *should* leave the source pristine and sometimes does
not.

For Debian's official kernel packages, we build a binary package of the
upstream source, and at some times this has unexpectedly included some=20
generated files.  I believe a similar issue would affect the upstream
package scripts.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption]
would be development of an easy way to factor large prime numbers.
                                                           - Bill Gates


--=-QTdYwm36GNbQ//qlVjyL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl148N4ACgkQ57/I7JWG
EQmehxAAmj7AUQ/OZVK3DAa0/jDsYlo2jdkXwZTDFhKxve70PBWXXpjSwGHakyGz
+ox4OkloGUpK3/gLGhihZUal+3U3vxdvS4NjuBB8s6Ka/E+p/PnVBToXJEI8GOg7
PRfNFwEcfjIjgsJ50ZT40ijU+f6yD5AdBxnJRQHhFAkJhJTiH0sGKA1J9qPnrJkk
NQ9mLgf7XlrjeSkdtKbUt5GhgNETq9L+GWA3z7kQczQw/c3Mn80/ca3rAeXwNfV8
fq96hueX18CPOjcSl62kg3KXhW0RkRovR/hhr4Fwt9OPKFd6HU9GfyF3iri8GJXi
SHvs/Bzh/UlJuTMf5RXBaGru/fNRcsZBFjWUjdb3eG1qM1aZ9iYvXQoaRnAyfjn+
DszzW27icgt4G212KuPuuGAhAD7JVuGOLBkOW4iNX1onO3sJObCDfyx1mNZqusei
85Eu/mTg4QmHHVhYDjuKIRMMz8QuU/tkvMc/k/zXfLVA/jNCpM9G9wyoFR6exlE/
kcZP8jh33Nxcg1CRkieMSp7Bb+NRH+vt3J5SjYHaUZIwJfT440t9dL1ajIdUNqMR
4/fUqw+Z3thFl+VY6xR7jgjoJP/SrMf4MuMpHMuHQ+LTxrJcS3wM9dpw8tQFQgsP
DISBccLrwpPNRYKYfq9L7AOyBuzMJGTS2Z6SK5CRpX8GR1HVts0=
=8pIU
-----END PGP SIGNATURE-----

--=-QTdYwm36GNbQ//qlVjyL--
