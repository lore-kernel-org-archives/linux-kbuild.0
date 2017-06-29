Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:55557 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751602AbdF2J0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jun 2017 05:26:53 -0400
Date: Thu, 29 Jun 2017 11:26:51 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [RFC] kbuild: Enable Large File Support for hostprogs
Message-ID: <20170629092646.djtsrkbtz5ywdefj@taurus.defre.kleine-koenig.org>
References: <1431307012.6033.9.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6ybfctqugprl6qtt"
Content-Disposition: inline
In-Reply-To: <1431307012.6033.9.camel@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, 778942@bugs.debian.org


--6ybfctqugprl6qtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ben,

On Mon, May 11, 2015 at 02:16:52AM +0100, Ben Hutchings wrote:
> Some programs built on a 32-bit host need Large File Support (LFS).
> Regardless of whether any of them need to deal with large files,
> non-LFS *stat() functions don't work at all on an XFS volume with
> 64-bit inodes.
>=20
> References: https://bugs.debian.org/778942
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index fbd43bf..a6fb432 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -297,7 +297,7 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then ec=
ho $$BASH; \
> =20
>  HOSTCC       =3D gcc
>  HOSTCXX      =3D g++
> -HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fom=
it-frame-pointer -std=3Dgnu89
> +HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fom=
it-frame-pointer -std=3Dgnu89 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
>  HOSTCXXFLAGS =3D -O2

I think we need the same for HOSTCXXFLAGS?

Also I wonder if this would be a better approach:

diff --git a/Makefile b/Makefile
index e40c471abe29..d9dd5db0abce 100644
--- a/Makefile
+++ b/Makefile
@@ -301,9 +301,15 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then ech=
o $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
=20
+HOST_LFS_CFLAGS :=3D $(getconf LFS_CFLAGS)
+HOST_LFS_LDFLAGS :=3D $(getconf LFS_LDFLAGS)
+HOST_LFS_LIBS :=3D $(getconf LFS_LIBS)
+
 HOSTCC       =3D gcc
 HOSTCXX      =3D g++
-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit=
-frame-pointer -std=3Dgnu89
+HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit=
-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS)
+HOSTLDFLAGS  =3D $(HOST_LFS_LDFLAGS)
+HOSTLOADLIBES =3D $(HOST_LFS_LIBS)
-HOSTCXXFLAGS =3D -O2
+HOSTCXXFLAGS =3D -O2 $(HOST_LFS_CFLAGS)
=20
 ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
 HOSTCFLAGS  +=3D -Wno-unused-value -Wno-unused-parameter \

but note, that HOSTLDFLAGS and HOSTLOADLIBES doesn't seem to be picked
up.

Best regards
Uwe

--6ybfctqugprl6qtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAllUx9MACgkQwfwUeK3K
7An7hAf/RMaOgXYbz/V2eB5Yme3MvMLMY0P6rqPLT6lzoTNA9XqjzdxU3yuIciO0
GxMHv3FhwMnuh+RZoPAD9u8rrNKfC+GVPILmoKXZzYcKBVepDpkST2GYUvxAfrwl
+nme7a9qTvrz8t34Rw/zsfHQ13nZ8sBbRkObKV2MUiU+g+NjrSmWLM0IGBx+L3tc
FgydJWxSkl9/FYByDQe0KlglMpa3CcFaj38YFqbyWynu3wUqC6vOHbIP8JR7fT3U
3+1oxY7M1XOALh0R/BPmBjtMv6u6t908se8Ryx2HkHiB66+zlCBipDTCFWHUTQOQ
Gi6bYkyXwg1kxnyhQzjM0W5mO7dksA==
=htfi
-----END PGP SIGNATURE-----

--6ybfctqugprl6qtt--
