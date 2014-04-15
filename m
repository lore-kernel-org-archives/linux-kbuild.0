Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56214 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750951AbaDOMGb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 08:06:31 -0400
Message-ID: <1397563579.31481.43.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] builddeb: fix missing headers in linux-headers package
 on arm architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 15 Apr 2014 13:06:19 +0100
In-Reply-To: <CAGNsrLBDidU9mW-Mz2bD4F2ZPMQzkFc4172ocUsd1S41v8_z-w@mail.gmail.com>
References: <1397477996-24575-1-git-send-email-fathi.boudra@linaro.org>
	 <1397503641.31481.10.camel@deadeye.wl.decadent.org.uk>
	 <CAGNsrLBDidU9mW-Mz2bD4F2ZPMQzkFc4172ocUsd1S41v8_z-w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z/BuvVynQozCxzeb7U7V"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-z/BuvVynQozCxzeb7U7V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-04-15 at 08:06 +0300, Fathi Boudra wrote:
> On 14 April 2014 22:27, Ben Hutchings <ben@decadent.org.uk> wrote:
> > On Mon, 2014-04-14 at 15:19 +0300, Fathi Boudra wrote:
> >> The kernel headers package (linux-headers) doesn't include
> >> the arch/arm/mach-*/include header files.
> >>
> >> It makes the package unusable on ARM architecture and prevent
> >> out-of-tree modules build:
> >>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
> >>  fatal error: mach/memory.h: No such file or directory
> >>  #include <mach/memory.h>
> >>  ^
> >>  compilation terminated.
> >>
> >> While this patch explicitely test arm architecture, avr32 and blackfin=
 are
> >> affected since they ship mach-* headers. However, they haven't been in=
cluded
> >> in the test because they aren't official architectures supported by De=
bian.
> >
> > I don't see why you can't generically look for all include directories
> > in arch/$SRCARCH.
>=20
> If you think that we should all include dirs independently from their
> support in the official archive, that's fine to me.
[...]

I think it's a reasonable starting point.  If that later turns out to be
insufficient for some new-to-Debian architecture, we can fix it then.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption] would be
development of an easy way to factor large prime numbers. - Bill Gates

--=-z/BuvVynQozCxzeb7U7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU00gu+e/yOyVhhEJAQrJYA/+JXGj1Rqln1MN4uq1Q4axt25rLKX/FVk3
i/H/Zwy/AigJ8RlSIk0NoyONYCDRmtiUuxt4UZ8iXa9iPglZs6my1ZM2O5BUl/J7
XxtOxh1P0FdSQ6n5lLaJapRVtqFQPbeQ77Fq4OmbG7EUkLVMiWd3zCZYW6ow37Dg
73pvWpV3R3AsHgLpaUAgSl9zlc/X6hCP80waW9WI5KxpKA4apd/174ZjWCg+aqjJ
s9P7vbkzTZe82KQZh8r1Klzt7/saRSZDrxdcX6tcX+hVG2kePxy0Zskw/JSAfru9
cJzLg89jQIJubya0RPB+mhovH5KlnFYh3VE6ePEabS60FOiElieV5++pUa2pODPW
cftKzs0ry4IbcXz1mfpXFevoxredg709oV6nQgsnlmzm2TOME+6TyNwrUUjwhsvN
BiSKKvgQY3/TxcHiEOdZhPIF1OYefRRIgMAOAje8Mym97WBA5MArxhoWJn7jVTvq
Ej1nciBmwXnHtziJj7SH8wkXk08H0UGx9tBo+/qQQ8EXw2C7hYatfkWiT/sSfL26
1FXqq9RpjDbBetzVXeZwSkC4bR7KD/GYuwttmNYLUO4+0nT4E72heRjPyw7pOUHJ
8kKcLGl9hi9PQzXQrA4sVbveXSrPanE8Tw7QBADdLcDhFLQSC/B59Zfh4G17pFvh
rQbtTh03chw=
=TYOq
-----END PGP SIGNATURE-----

--=-z/BuvVynQozCxzeb7U7V--
