Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:53290 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725795AbfINXno (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 19:43:44 -0400
Message-ID: <c90c07552347ce3ae26ad6115d7bee7a6fbcaaa3.camel@decadent.org.uk>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 14 Sep 2019 12:15:50 +0100
In-Reply-To: <20190913062811.GG8267@fjasle.eu>
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
         <20190913062811.GG8267@fjasle.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-T61ovYkJ++u0q7lrH+Xr"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, ab@php.net


--=-T61ovYkJ++u0q7lrH+Xr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-13 at 08:28 +0200, Nicolas Schier wrote:
> Hi Ben,
>=20
> thanks for that document, I really enjoyed reading it!
>=20
> On Wed, Sep 11, 2019 at 12:53:53PM +0100, Ben Hutchings wrote:
> [...]
> > diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentati=
on/kbuild/reproducible-builds.rst
> > new file mode 100644
> > index 000000000000..4d988faf93b8
> > --- /dev/null
> > +++ b/Documentation/kbuild/reproducible-builds.rst
> > @@ -0,0 +1,115 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Reproducible builds
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +It is generally desirable that the building the same source code with
>=20
> In this sentence, I think there is either one word to much (the first
> 'the') or some word is missing (e.h. 'of').

Yes, thanks.

Ben.

--=20
Ben Hutchings
If you seem to know what you are doing, you'll be given more to do.



--=-T61ovYkJ++u0q7lrH+Xr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl18y+cACgkQ57/I7JWG
EQmkbQ/7BiRT3bkLrMimHZUVFAqdRFSAN/J3ot1yPHJpDURjrA2XLM3/5nuTxiMm
+QQ0BuPDSMTxdUGLiTs4xhFZgnShkG5uDObnkKtLUfsTEDgcLuQojAARD210nCAh
Xr5S3li3kpJ7JziA1/48i9DA+yls0IlGzHe8BBL996YRMHbSlyorMwzhKTv4e5zX
AnoCKb6o2LpTmdcrd1nzYItyrwCjwROSpUe3RizorU9zWo1EEucxPdS9Su9T1QW4
icojZ0gQPc6hBBHEl4ZpOnLuvvqtcYMbs0pvQqUCHcpXcik8wBbPHFoXtuJLsEzF
Nqp3xt0ZLqBdefKUowlGYR8usX7M2QWRNw7o7fBSfcywxXGnskxUjmIUOmF3DZj2
baOoCRjdk7G7m3YaTt6/nVol2MgDcdPYtjbP2GyyiW6d4QZMuhp8MssPIWWpXWYl
ufedb1hptWldBRHG7e+uTn40ToPY9gKKoDxF/hU83uWJ6eJHjvZSV2yPHTaXWMLp
Wu2lWwC20mnnz2p0NUdvcT/r5fw0mSN0ze8NtD/SaUlv/+IXEnyL8OGkwF6rivwS
O3mYfUpE8MCIxKyP7neBX+//uH8QON1cE2rU3pfcPTA0ZSNyezyY1H2dJjKDRWRh
/qF22JZaT4LiXDxDEPpm8ZV4RhvlXB9kwaY1pRpTvrLFJSUGVag=
=VLJx
-----END PGP SIGNATURE-----

--=-T61ovYkJ++u0q7lrH+Xr--
