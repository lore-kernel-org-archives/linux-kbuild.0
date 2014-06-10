Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:48676 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754378AbaFJVmc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 17:42:32 -0400
Message-ID: <1402436539.23860.116.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf
 architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 10 Jun 2014 22:42:19 +0100
In-Reply-To: <1402297488.31087.5.camel@dagon.hellion.org.uk>
References: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
	 <1402297488.31087.5.camel@dagon.hellion.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QLMd1xphOevC7YSY14fX"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>


--=-QLMd1xphOevC7YSY14fX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-06-09 at 08:04 +0100, Ian Campbell wrote:
> On Mon, 2014-06-09 at 01:21 +0100, Ben Hutchings wrote:
> > The Debian armhf architecture uses the ARM EABI hard-float variant,
> > whereas armel uses the soft-float variant.  Although the kernel
> > doesn't use FP itself, CONFIG_VFP must be enabled to support
> > hard-float userland and will probably be disabled when supporting a
> > soft-float userland.  So set the architecture to armhf by default when
> > CONFIG_AEABI and CONFIG_VFP are both enabled.
> >=20
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>=20
> Acked-by: Ian Campbell <ijc@hellion.org.uk>
>=20
> We should also add the following. If there is some reason to do a v3
> feel free to squash it into you patch (if you wish).
[...]

arm64 is already in -next.  Actually, that means my patch is fuzzy as
it's based on v3.15.  I hope that's OK.

Ben.

--=20
Ben Hutchings
DNRC Motto:  I can please only one person per day.
Today is not your day.  Tomorrow isn't looking good either.

--=-QLMd1xphOevC7YSY14fX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5d7wee/yOyVhhEJAQpzphAAgUIP7WtkaKSVV6ldp6FpQik+iYOMQVYG
iSKdu4zGICoQeabe8BqDorzye1Xm5Y4dYQ7QPzmmkE34WZ+sskVTQRxeo67zWiLF
SA45uuiqqosX9rbgF0aRxTIufjMttL/e0Q5FZG20pUBCi2LSUEfQ3WlC4nVuOILY
zU08pTmqrYUtr4qbFLyf2WCepKW5HqYtO7aQLVRgsf6IjmmyustFbXkNZuYgGfUk
R0W2smxVADxye2XFjqKaEStoPApEgMg2OorsQhrAYpI3Pq5i3IjYMPSN1Ez3JVgJ
oJrDr3syfTFTaaq+pBmHyqhPy3R7d0aRnvTusR3xK8DUzXXMAHRHYZz+8eLxCXQf
9QGbHvIkCz5shloiY1HryphUkYsaxjVgEYzPYHk1vS7Tu4BOx5mW0YUvJCD5sV7E
klYQMXQ51yZOw0Kmk7b4QPMWiA7SVSEhtrFU8D/gGcq4fS/xqbMrs8DMuq2i4VL5
dIwMFQDWY9VH2RfE4P/rGjVs9g5AtZ056znzD7E39kTieIp+bnBlWGVVpjIsyX8E
tG5fXM824hI82fT2Ou7kjqwI54INW5dW95eD8yl+JHqqki9OcxILR5gUr1tfS32L
0inswWHX76j/d1GsUMVSPQZsQcyIdshq4FlWqlpzg9+2vVIVF8U+d+QaCI2dJxx7
HRyYAzy2qcg=
=EUkf
-----END PGP SIGNATURE-----

--=-QLMd1xphOevC7YSY14fX--
